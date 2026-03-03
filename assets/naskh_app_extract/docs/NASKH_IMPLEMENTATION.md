# Naskh Quran Reader Implementation

## Overview

This document outlines the architecture and implementation plan for reimplementing the Naskh Quran reader from the quran_android app in Flutter. The implementation will provide a scrollable, selectable Quran reading experience using pre-rendered calligraphic line images.

## Juz Navigation Data

The juz → page mapping for Naskh (extracted from `ayahinfo_1342.db`):

```dart
// Naskh juz starting pages (page 1 is title page, content starts at page 2)
const naskhJuzPages = [
  /*  1 - 10 */   2,  23,  43,  63,  83, 103, 122, 143, 163, 183,
  /* 11 - 20 */ 202, 223, 243, 262, 283, 303, 323, 343, 363, 382,
  /* 21 - 30 */ 403, 423, 443, 463, 483, 503, 523, 543, 563, 587,
];

// Helper function to get page for juz
int getPageForJuz(int juz) => naskhJuzPages[juz - 1];

// Helper function to get juz for page
int getJuzForPage(int page) {
  for (int i = naskhJuzPages.length - 1; i >= 0; i--) {
    if (page >= naskhJuzPages[i]) return i + 1;
  }
  return 1;
}
```

This differs from the Madani mushaf (604 pages) because Naskh has 611 pages including title/index pages.

## Data Assets (Extracted)

Located in `assets/naskh_app_extract/`:

### Databases

1. **ayahinfo_1342.db** (504 KB) - Coordinate mapping for touch detection
   - `ayah_highlights`: Line-level ayah positions
     ```sql
     ayah_id INTEGER, page INTEGER, sura INTEGER, ayah INTEGER,
     line INTEGER, left REAL, right REAL
     ```
     - `left`/`right`: Normalized coordinates (0.0-1.0) defining ayah bounds on each line

   - `ayah_markers`: Position of ayah number markers (circled numbers)
     ```sql
     ayah_id INTEGER, page INTEGER, sura INTEGER, ayah INTEGER,
     line INTEGER, code_point TEXT, center_x REAL, center_y REAL
     ```

   - `sura_headers`: Position of surah header decorations
     ```sql
     sura INTEGER, page INTEGER, line INTEGER, center_x REAL, center_y REAL
     ```

2. **quran.ar_naskh.db** (3.4 MB) - Arabic text in Naskh script
   - `arabic_text`: Full Quran text
     ```sql
     sura INTEGER, ayah INTEGER, text TEXT, PRIMARY KEY(sura, ayah)
     ```
   - `verses`: FTS3 full-text search table

### Page Images

Structure: `pages/{page_number}/`
- 611 pages total (includes title/index pages)
- Each page contains:
  - `1.png` to `15.png` - Line images (one PNG per line)
  - `sidelines/` - Decorative margin elements

Line characteristics:
- Width: 1342 pixels
- Empty lines: ~131 bytes (placeholder)
- Content lines: 5-10 KB each
- Pre-rendered Arabic calligraphy with ayah markers embedded

## Architecture

### Core Components

```
lib/
├── db/
│   └── naskh_database.dart         # Drift database for ayahinfo
├── models/
│   └── naskh/
│       ├── ayah_bounds.dart        # Ayah coordinate bounds model
│       ├── ayah_marker.dart        # Ayah marker position model
│       └── page_coordinates.dart   # Page coordinate data
├── widgets/
│   └── naskh/
│       ├── naskh_quran_reader.dart # Main reader widget
│       ├── naskh_page.dart         # Single page widget
│       ├── naskh_line.dart         # Single line image widget
│       ├── naskh_highlight.dart    # Ayah highlight overlay
│       └── naskh_sidelines.dart    # Decorative sidelines
└── providers/
    └── naskh_coordinates_provider.dart  # Coordinate data provider
```

### Data Flow

```
┌─────────────────┐     ┌──────────────────┐     ┌─────────────────┐
│  ayahinfo_1342  │────▶│  Coordinates     │────▶│  Touch Handler  │
│      .db        │     │    Provider      │     │                 │
└─────────────────┘     └──────────────────┘     └─────────────────┘
                                                         │
                                                         ▼
┌─────────────────┐     ┌──────────────────┐     ┌─────────────────┐
│   Page Images   │────▶│   NaskhPage      │◀────│  Ayah Selection │
│   (PNG lines)   │     │     Widget       │     │     State       │
└─────────────────┘     └──────────────────┘     └─────────────────┘
```

## Implementation Details

### 1. Database Layer (naskh_database.dart)

```dart
// Tables for ayahinfo_1342.db
class AyahHighlight extends Table {
  IntColumn get ayahId => integer()();
  IntColumn get page => integer()();
  IntColumn get sura => integer()();
  IntColumn get ayah => integer()();
  IntColumn get line => integer()();
  RealColumn get left => real()();
  RealColumn get right => real()();
}

class AyahMarker extends Table {
  IntColumn get ayahId => integer()();
  IntColumn get page => integer()();
  IntColumn get sura => integer()();
  IntColumn get ayah => integer()();
  IntColumn get line => integer()();
  TextColumn get codePoint => text()();
  RealColumn get centerX => real()();
  RealColumn get centerY => real()();
}

class SuraHeader extends Table {
  IntColumn get sura => integer()();
  IntColumn get page => integer()();
  IntColumn get line => integer()();
  RealColumn get centerX => real()();
  RealColumn get centerY => real()();
}
```

### 2. Coordinate Provider

```dart
class NaskhCoordinatesProvider {
  final NaskhDatabase _db;

  // Cache ayah coordinates per page
  final Map<int, Map<String, List<AyahBounds>>> _pageCoordinatesCache = {};

  /// Get ayah bounds for a page
  Future<Map<String, List<AyahBounds>>> getAyahCoordinates(int page) async {
    if (_pageCoordinatesCache.containsKey(page)) {
      return _pageCoordinatesCache[page]!;
    }

    final highlights = await _db.getAyahHighlightsForPage(page);
    final coordsMap = <String, List<AyahBounds>>{};

    for (final h in highlights) {
      final key = '${h.sura}:${h.ayah}';
      coordsMap.putIfAbsent(key, () => []).add(
        AyahBounds(
          line: h.line,
          left: h.left,
          right: h.right,
        ),
      );
    }

    _pageCoordinatesCache[page] = coordsMap;
    return coordsMap;
  }

  /// Find ayah at touch position
  SuraAyah? getAyahAtPosition(
    Map<String, List<AyahBounds>> coords,
    int line,
    double normalizedX,
  ) {
    for (final entry in coords.entries) {
      for (final bounds in entry.value) {
        if (bounds.line == line &&
            normalizedX >= bounds.left &&
            normalizedX <= bounds.right) {
          final parts = entry.key.split(':');
          return SuraAyah(int.parse(parts[0]), int.parse(parts[1]));
        }
      }
    }
    return null;
  }
}
```

### 3. Page Widget (naskh_page.dart)

```dart
class NaskhPage extends StatefulWidget {
  final int pageNumber;
  final Set<SuraAyah>? highlightedAyahs;
  final ValueChanged<SuraAyah>? onAyahTap;
  final ValueChanged<SuraAyah>? onAyahLongPress;

  const NaskhPage({
    required this.pageNumber,
    this.highlightedAyahs,
    this.onAyahTap,
    this.onAyahLongPress,
  });
}

class _NaskhPageState extends State<NaskhPage> {
  List<ImageProvider>? _lineImages;
  Map<String, List<AyahBounds>>? _coordinates;

  @override
  void initState() {
    super.initState();
    _loadPageData();
  }

  Future<void> _loadPageData() async {
    // Load line images
    final images = <ImageProvider>[];
    for (int line = 1; line <= 15; line++) {
      images.add(AssetImage(
        'assets/naskh_app_extract/pages/${widget.pageNumber}/$line.png'
      ));
    }

    // Load coordinates
    final coords = await NaskhCoordinatesProvider.instance
        .getAyahCoordinates(widget.pageNumber);

    setState(() {
      _lineImages = images;
      _coordinates = coords;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_lineImages == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final lineHeight = constraints.maxHeight / 15;

        return Stack(
          children: [
            // Line images
            Column(
              children: List.generate(15, (index) {
                return NaskhLine(
                  image: _lineImages![index],
                  height: lineHeight,
                  lineNumber: index + 1,
                  onTap: (normalizedX) => _handleTap(index + 1, normalizedX),
                  onLongPress: (normalizedX) => _handleLongPress(index + 1, normalizedX),
                );
              }),
            ),

            // Highlight overlays
            if (widget.highlightedAyahs != null && _coordinates != null)
              ...widget.highlightedAyahs!.map((ayah) {
                return NaskhHighlight(
                  ayah: ayah,
                  coordinates: _coordinates!,
                  lineHeight: lineHeight,
                  pageWidth: constraints.maxWidth,
                );
              }),
          ],
        );
      },
    );
  }

  void _handleTap(int line, double normalizedX) {
    if (_coordinates == null) return;

    final ayah = NaskhCoordinatesProvider.instance
        .getAyahAtPosition(_coordinates!, line, normalizedX);

    if (ayah != null && widget.onAyahTap != null) {
      widget.onAyahTap!(ayah);
    }
  }
}
```

### 4. Line Widget (naskh_line.dart)

```dart
class NaskhLine extends StatelessWidget {
  final ImageProvider image;
  final double height;
  final int lineNumber;
  final ValueChanged<double>? onTap;
  final ValueChanged<double>? onLongPress;

  const NaskhLine({
    required this.image,
    required this.height,
    required this.lineNumber,
    this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (details) {
        if (onTap != null) {
          final box = context.findRenderObject() as RenderBox;
          final normalizedX = details.localPosition.dx / box.size.width;
          onTap!(normalizedX);
        }
      },
      onLongPressStart: (details) {
        if (onLongPress != null) {
          final box = context.findRenderObject() as RenderBox;
          final normalizedX = details.localPosition.dx / box.size.width;
          onLongPress!(normalizedX);
        }
      },
      child: SizedBox(
        height: height,
        width: double.infinity,
        child: Image(
          image: image,
          fit: BoxFit.contain,
          filterQuality: FilterQuality.high,
        ),
      ),
    );
  }
}
```

### 5. Highlight Overlay (naskh_highlight.dart)

```dart
class NaskhHighlight extends StatelessWidget {
  final SuraAyah ayah;
  final Map<String, List<AyahBounds>> coordinates;
  final double lineHeight;
  final double pageWidth;
  final Color color;

  const NaskhHighlight({
    required this.ayah,
    required this.coordinates,
    required this.lineHeight,
    required this.pageWidth,
    this.color = const Color(0x4046a6a6), // Semi-transparent teal
  });

  @override
  Widget build(BuildContext context) {
    final key = '${ayah.sura}:${ayah.ayah}';
    final bounds = coordinates[key];

    if (bounds == null) return const SizedBox.shrink();

    return Stack(
      children: bounds.map((b) {
        final top = (b.line - 1) * lineHeight;
        final left = b.left * pageWidth;
        final width = (b.right - b.left) * pageWidth;

        return Positioned(
          top: top,
          left: left,
          width: width,
          height: lineHeight,
          child: Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        );
      }).toList(),
    );
  }
}
```

### 6. Main Reader Widget (naskh_quran_reader.dart)

```dart
class NaskhQuranReader extends StatefulWidget {
  final int initialPage;
  final ValueChanged<int>? onPageChanged;

  const NaskhQuranReader({
    this.initialPage = 1,
    this.onPageChanged,
  });

  @override
  State<NaskhQuranReader> createState() => _NaskhQuranReaderState();
}

class _NaskhQuranReaderState extends State<NaskhQuranReader> {
  late PageController _pageController;
  Set<SuraAyah> _selectedAyahs = {};
  int _currentPage = 1;

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage;
    _pageController = PageController(initialPage: widget.initialPage - 1);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header with page info
        _buildHeader(),

        // Page viewer
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            reverse: true, // RTL reading direction
            itemCount: 611,
            onPageChanged: (index) {
              setState(() => _currentPage = index + 1);
              widget.onPageChanged?.call(index + 1);
            },
            itemBuilder: (context, index) {
              return NaskhPage(
                pageNumber: index + 1,
                highlightedAyahs: _selectedAyahs,
                onAyahTap: _handleAyahTap,
                onAyahLongPress: _handleAyahLongPress,
              );
            },
          ),
        ),

        // Footer with controls
        _buildFooter(),
      ],
    );
  }

  void _handleAyahTap(SuraAyah ayah) {
    setState(() {
      if (_selectedAyahs.contains(ayah)) {
        _selectedAyahs.remove(ayah);
      } else {
        _selectedAyahs = {ayah}; // Single selection
      }
    });
  }

  void _handleAyahLongPress(SuraAyah ayah) {
    // Show context menu or start range selection
    _showAyahMenu(ayah);
  }

  void _showAyahMenu(SuraAyah ayah) {
    showModalBottomSheet(
      context: context,
      builder: (context) => AyahActionSheet(
        ayah: ayah,
        onPlay: () => _playAyah(ayah),
        onBookmark: () => _bookmarkAyah(ayah),
        onShare: () => _shareAyah(ayah),
        onCopy: () => _copyAyah(ayah),
      ),
    );
  }
}
```

## Key Features

### 1. Touch-based Ayah Selection
- Use normalized coordinates (0.0-1.0) from database
- Map touch position to ayah based on line and x-position
- Support single tap, long press, and range selection

### 2. Visual Highlighting
- Overlay semi-transparent rectangles on selected ayahs
- Support multiple highlight types (selection, audio, bookmark)
- Animate highlight transitions

### 3. Scrollable Pages
- Vertical scroll within page (for zoomed view)
- Horizontal page swipe (RTL direction)
- Jump to specific page/surah/juz

### 4. Night Mode
- Invert colors using ColorFilter matrix
- Adjustable brightness levels
- Preserve readability

### 5. Audio Integration
- Highlight current playing ayah
- Word-by-word highlighting (if marker data available)
- Auto-scroll to playing ayah

## Implementation Steps

1. **Phase 1: Database Setup**
   - Create Drift tables for ayahinfo database
   - Implement database initialization from assets
   - Add query methods for coordinates

2. **Phase 2: Basic Page Rendering**
   - Create NaskhLine widget with image loading
   - Create NaskhPage widget with 15 lines
   - Add basic tap detection

3. **Phase 3: Coordinate System**
   - Implement AyahBounds model
   - Create coordinate provider
   - Map touch positions to ayahs

4. **Phase 4: Highlighting**
   - Create highlight overlay widget
   - Implement multiple highlight types
   - Add selection state management

5. **Phase 5: Reader Integration**
   - Create main reader widget with PageView
   - Add page navigation controls
   - Implement header/footer overlays

6. **Phase 6: Polish**
   - Add night mode support
   - Implement sidelines rendering
   - Add loading states and error handling

## Test Page Integration

Add to `test_screen.dart`:

```dart
_ComponentTile(
  title: 'Naskh Quran Reader',
  description: 'Image-based Quran with selectable ayahs',
  onTap: () => _openComponent(context, const _NaskhQuranTest()),
),

// ...

class _NaskhQuranTest extends StatelessWidget {
  const _NaskhQuranTest();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Naskh Quran Reader'),
      ),
      body: const NaskhQuranReader(
        initialPage: 1,
      ),
    );
  }
}
```

## Notes

- Original 1342px width images scale well to various screen sizes
- Empty line images (131 bytes) are placeholders - check file size before loading
- Line images include ayah markers embedded in the calligraphy
- Sideline images are decorative and optional
- RTL page order: page 1 is rightmost, swipe left to advance
