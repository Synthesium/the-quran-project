import 'package:flutter/material.dart';

import '../db/database.dart';

/// Widget for rendering a single mushaf page with 15 lines
class MushafPage extends StatefulWidget {
  final int pageNumber;
  final VoidCallback? onTap;

  const MushafPage({
    super.key,
    required this.pageNumber,
    this.onTap,
  });

  @override
  State<MushafPage> createState() => _MushafPageState();
}

class _MushafPageState extends State<MushafPage> {
  List<PageLineData>? _lines;
  Map<int, SurahData> _surahCache = {};
  bool _isLoading = true;

  // Line separator color
  static const _lineColor = Color(0xFFD4AF37); // Gold color like traditional mushaf

  @override
  void initState() {
    super.initState();
    _loadPageData();
  }

  @override
  void didUpdateWidget(MushafPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.pageNumber != widget.pageNumber) {
      _loadPageData();
    }
  }

  Future<void> _loadPageData() async {
    setState(() => _isLoading = true);

    final db = AppDatabase.instance;
    final lines = await db.getPageLines(widget.pageNumber);

    // Load surah names for header lines
    final surahCache = <int, SurahData>{};

    for (final line in lines) {
      if (line.lineType == 'surah_name' && line.surahNumber != null) {
        final surah = await db.getSurah(line.surahNumber!);
        if (surah != null) {
          surahCache[line.surahNumber!] = surah;
        }
      }
    }

    if (mounted) {
      setState(() {
        _lines = lines;
        _surahCache = surahCache;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_lines == null || _lines!.isEmpty) {
      return Center(
        child: Text('Page ${widget.pageNumber} not found'),
      );
    }

    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        color: const Color(0xFFFFFBF0), // Cream/paper color
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Column(
              children: [
                // Page header
                _buildPageHeader(context),
                const SizedBox(height: 4),
                // Top border line
                Container(
                  height: 1.5,
                  color: _lineColor,
                ),
                // Lines with separators
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return _buildLinesWithSeparators(context, constraints);
                    },
                  ),
                ),
                // Bottom border line
                Container(
                  height: 1.5,
                  color: _lineColor,
                ),
                const SizedBox(height: 4),
                // Page number footer
                _buildPageFooter(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLinesWithSeparators(BuildContext context, BoxConstraints constraints) {
    final lines = _lines!;
    final lineCount = lines.length;

    // Calculate available height for each line (including separator)
    // Reserve space for separators (lineCount + 1 separators for top/bottom borders handled separately)
    final separatorHeight = 0.5;
    final totalSeparatorHeight = (lineCount - 1) * separatorHeight;
    final availableHeight = constraints.maxHeight - totalSeparatorHeight;
    final lineHeight = availableHeight / lineCount;

    final children = <Widget>[];

    for (int i = 0; i < lineCount; i++) {
      final line = lines[i];

      // Add the line content
      children.add(
        SizedBox(
          height: lineHeight,
          child: _buildLine(context, line, constraints.maxWidth),
        ),
      );

      // Add separator after each line except the last
      if (i < lineCount - 1) {
        children.add(
          Container(
            height: separatorHeight,
            color: _lineColor.withValues(alpha: 0.5),
          ),
        );
      }
    }

    return Column(
      children: children,
    );
  }

  Widget _buildPageHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'جزء ${_getJuzNumber()}',
          style: const TextStyle(
            fontFamily: 'AlQuran',
            fontSize: 12,
            color: Colors.grey,
          ),
          textDirection: TextDirection.rtl,
        ),
        Text(
          _getSurahNameForPage(),
          style: const TextStyle(
            fontFamily: 'AlQuran',
            fontSize: 12,
            color: Colors.grey,
          ),
          textDirection: TextDirection.rtl,
        ),
      ],
    );
  }

  String _getJuzNumber() {
    // Calculate juz from page number (approximate: 610 pages / 30 juz ≈ 20 pages per juz)
    final juz = ((widget.pageNumber - 1) ~/ 20) + 1;
    return _toArabicNumerals(juz.clamp(1, 30));
  }

  String _getSurahNameForPage() {
    // Get surah name from cache
    if (_surahCache.isNotEmpty) {
      return _surahCache.values.first.nameArabic;
    }
    return '';
  }

  Widget _buildPageFooter(BuildContext context) {
    return Text(
      _toArabicNumerals(widget.pageNumber),
      style: const TextStyle(
        fontFamily: 'AlQuran',
        fontSize: 14,
        color: Colors.grey,
      ),
    );
  }

  Widget _buildLine(BuildContext context, PageLineData line, double maxWidth) {
    if (line.lineType == 'surah_name') {
      return _buildSurahNameLine(context, line);
    } else if (line.lineType == 'basmallah') {
      return _buildBasmallahLine(context);
    } else {
      return _buildAyahLine(context, line, maxWidth);
    }
  }

  Widget _buildSurahNameLine(BuildContext context, PageLineData line) {
    final surah = line.surahNumber != null ? _surahCache[line.surahNumber!] : null;
    final surahName = surah?.nameArabic ?? 'سورة';

    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
        decoration: BoxDecoration(
          border: Border.all(color: _lineColor, width: 1.5),
          borderRadius: BorderRadius.circular(8),
          color: const Color(0xFFFFFDF5),
        ),
        child: Text(
          surahName,
          style: TextStyle(
            fontFamily: 'AlQuran',
            fontSize: 20,
            color: Colors.amber.shade900,
          ),
          textDirection: TextDirection.rtl,
        ),
      ),
    );
  }

  Widget _buildBasmallahLine(BuildContext context) {
    // Bismillah - centered, slightly smaller than regular text
    return Center(
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          'بِسْمِ ٱللَّهِ ٱلرَّحْمَـٰنِ ٱلرَّحِيمِ',
          style: const TextStyle(
            fontFamily: 'AlQuran',
            fontSize: 20,
            color: Colors.black,
          ),
          textDirection: TextDirection.rtl,
          maxLines: 1,
        ),
      ),
    );
  }

  Widget _buildAyahLine(BuildContext context, PageLineData line, double maxWidth) {
    final lineText = line.lineText;

    if (lineText == null || lineText.isEmpty) {
      return const SizedBox.expand();
    }

    final isCentered = line.isCentered == 1;

    if (isCentered) {
      // Centered lines - use FittedBox to scale
      return _buildCenteredLine(lineText);
    } else {
      // Justified lines - stretch text to fill the line
      return _buildJustifiedLine(lineText, maxWidth);
    }
  }

  Widget _buildCenteredLine(String lineText) {
    return Center(
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          lineText,
          style: const TextStyle(
            fontFamily: 'AlQuran',
            fontSize: 22,
            color: Colors.black,
          ),
          textDirection: TextDirection.rtl,
          maxLines: 1,
        ),
      ),
    );
  }

  Widget _buildJustifiedLine(String lineText, double maxWidth) {
    // Split text into words for justification
    final words = lineText.split(' ').where((w) => w.isNotEmpty).toList();

    // For justified text, we use a Row with spaceBetween to distribute words evenly
    // This ensures text fills the entire line width
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: words.map((word) {
          return Flexible(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                word,
                style: const TextStyle(
                  fontFamily: 'AlQuran',
                  fontSize: 22,
                  color: Colors.black,
                ),
                maxLines: 1,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  /// Convert integer to Arabic numerals
  String _toArabicNumerals(int number) {
    const arabicNumerals = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    return number.toString().split('').map((d) {
      final digit = int.tryParse(d);
      return digit != null ? arabicNumerals[digit] : d;
    }).join();
  }
}
