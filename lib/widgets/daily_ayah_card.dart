import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../db/database.dart';
import 'furigana_text.dart';
import 'styled_html_text.dart';

/// Check if text contains HTML tags
bool _containsHtml(String text) {
  return RegExp(r'<[^>]+>').hasMatch(text);
}

/// Represents a content item (translation or tafsir) to display in the carousel
class _ContentItem {
  final String sourceId;
  final String sourceName;
  final String language;
  final String type; // 'translation' or 'tafsir'
  final String text;
  final bool isGrouped; // For tafsirs that cover multiple verses
  final String? groupVerseKey; // The primary verse key for grouped tafsirs
  final bool isHtml; // Whether the text contains HTML

  _ContentItem({
    required this.sourceId,
    required this.sourceName,
    required this.language,
    required this.type,
    required this.text,
    this.isGrouped = false,
    this.groupVerseKey,
    this.isHtml = false,
  });
}

class DailyAyahCard extends StatefulWidget {
  const DailyAyahCard({super.key});

  @override
  State<DailyAyahCard> createState() => _DailyAyahCardState();
}

class _DailyAyahCardState extends State<DailyAyahCard> {
  AyahData? _ayah;
  SurahData? _surahData;
  List<_ContentItem> _contentItems = [];
  Map<String, List<FootnoteWithLink>> _footnotes = {};
  bool _isLoading = true;
  int _currentPage = 0;
  final PageController _pageController = PageController();

  /// Source ID to display name mapping
  static const Map<String, String> _sourceNames = {
    'en_clear': 'The Clear Quran',
    'ja_mita': '三田了一訳',
    'ja_sato': '佐藤サイード訳',
    'ja_yasashii': 'やさしい日本語',
    'en_ibn_kathir': 'Ibn Kathir',
    'en_abridged': 'Abridged Explanation',
    'ja_mokhtasar': '簡潔解説',
  };

  /// Get the Unicode character for the ayah number marker
  String _getAyahMarkerChar(int number) {
    final codePoint = 0xF4FF + number;
    return String.fromCharCode(codePoint);
  }

  @override
  void initState() {
    super.initState();
    _loadRandomAyah();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _loadRandomAyah() async {
    final db = AppDatabase.instance;

    // Get a random ayah
    final randomAyah = await db.getRandomAyah();
    if (randomAyah == null) return;

    final verseKey = randomAyah.verseKey;

    // Fetch all data in parallel
    final results = await Future.wait([
      db.getSurah(randomAyah.surahNumber),
      db.getTranslationsForVerse(verseKey),
      db.getResolvedTafsirsForVerse(verseKey),
      db.getFootnotesForVerse(verseKey),
    ]);

    final surah = results[0] as SurahData?;
    final translations = results[1] as List<TranslationData>;
    final tafsirs = results[2] as List<ResolvedTafsir>;
    final footnotes = results[3] as List<FootnoteWithLink>;

    // Build content items list
    final contentItems = <_ContentItem>[];

    // Add translations first
    for (final t in translations) {
      contentItems.add(_ContentItem(
        sourceId: t.sourceId,
        sourceName: _sourceNames[t.sourceId] ?? t.sourceId,
        language: t.sourceId.startsWith('ja') ? 'ja' : 'en',
        type: 'translation',
        text: t.translationText,
      ));
    }

    // Add tafsirs (with resolved group text)
    for (final t in tafsirs) {
      // Skip tafsirs with no text even after resolution
      if (t.resolvedText.isEmpty) continue;

      final hasHtml = _containsHtml(t.resolvedText);

      contentItems.add(_ContentItem(
        sourceId: t.sourceId,
        sourceName: _sourceNames[t.sourceId] ?? t.sourceId,
        language: t.sourceId.startsWith('ja') ? 'ja' : 'en',
        type: 'tafsir',
        text: t.resolvedText,
        isGrouped: t.isGrouped,
        groupVerseKey: t.groupVerseKey,
        isHtml: hasHtml,
      ));
    }

    // Group footnotes by source (currently only en_clear has footnotes)
    final footnotesMap = <String, List<FootnoteWithLink>>{};
    if (footnotes.isNotEmpty) {
      footnotesMap['en_clear'] = footnotes;
    }

    if (mounted) {
      setState(() {
        _ayah = randomAyah;
        _surahData = surah;
        _contentItems = contentItems;
        _footnotes = footnotesMap;
        _isLoading = false;
        _currentPage = 0;
      });
      _pageController.jumpToPage(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Card(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Center(child: CircularProgressIndicator()),
        ),
      );
    }

    if (_ayah == null) {
      return const Card(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Center(child: Text('Could not load ayah')),
        ),
      );
    }

    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildHeader(context),
            const SizedBox(height: 8),
            _buildSurahInfo(context),
            const SizedBox(height: 16),
            _buildArabicText(context),
            const Divider(height: 32),
            _buildContentCarousel(context),
            if (_contentItems.length > 1) ...[
              const SizedBox(height: 16),
              _buildPageIndicator(context),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Daily Ayah',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
        ),
        IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: () {
            setState(() => _isLoading = true);
            _loadRandomAyah();
          },
          tooltip: 'Get new ayah',
        ),
      ],
    );
  }

  Widget _buildSurahInfo(BuildContext context) {
    if (_surahData == null) return const SizedBox.shrink();

    return Text(
      '${_surahData!.nameEnglish} (${_surahData!.nameArabic}) - ${_ayah!.verseKey}',
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
    );
  }

  Widget _buildArabicText(BuildContext context) {
    return SelectableText.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '${_ayah!.arabic} ',
            style: const TextStyle(
              fontFamily: 'AlQuran',
              fontSize: 32,
              height: 2.0,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: _getAyahMarkerChar(_ayah!.verseNumber),
            style: TextStyle(
              fontFamily: 'AlQuran',
              fontSize: 32,
              height: 2.0,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.right,
      textDirection: TextDirection.rtl,
    );
  }

  Widget _buildContentCarousel(BuildContext context) {
    if (_contentItems.isEmpty) {
      return const Text('No translations available');
    }

    return SizedBox(
      height: 280,
      child: PageView.builder(
        controller: _pageController,
        itemCount: _contentItems.length,
        onPageChanged: (index) {
          setState(() => _currentPage = index);
        },
        itemBuilder: (context, index) {
          return _buildContentPage(context, _contentItems[index]);
        },
      ),
    );
  }

  Widget _buildContentPage(BuildContext context, _ContentItem item) {
    final footnotes = _footnotes[item.sourceId];
    final hasFootnotes = footnotes != null && footnotes.isNotEmpty;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Source label
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: item.type == 'tafsir'
                      ? Theme.of(context).colorScheme.secondaryContainer
                      : Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  item.type == 'tafsir' ? 'Tafsir' : 'Translation',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: item.type == 'tafsir'
                            ? Theme.of(context).colorScheme.onSecondaryContainer
                            : Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  item.sourceName,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
            ],
          ),

          // Show grouped tafsir note
          if (item.isGrouped && item.groupVerseKey != null) ...[
            const SizedBox(height: 6),
            Text(
              'This tafsir covers verses starting from ${item.groupVerseKey}',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontStyle: FontStyle.italic,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
          ],

          const SizedBox(height: 12),

          // Content text - render based on content type
          _buildContentText(context, item),

          // Footnotes section
          if (hasFootnotes) ...[
            const SizedBox(height: 16),
            _buildFootnotes(context, footnotes),
          ],
        ],
      ),
    );
  }

  Widget _buildContentText(BuildContext context, _ContentItem item) {
    // Japanese text with furigana
    if (item.language == 'ja') {
      return FuriganaTextWidget(
        text: item.text,
        baseStyle: GoogleFonts.notoSerifJp(
          fontSize: 16,
          height: 1.5,
          color: Colors.black,
        ),
        furiganaStyle: GoogleFonts.notoSerifJp(
          fontSize: 9,
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
      );
    }

    // HTML content (primarily Ibn Kathir)
    if (item.isHtml) {
      return StyledHtmlText(
        html: item.text,
        baseStyle: GoogleFonts.ebGaramond(
          fontSize: 16,
          height: 1.6,
        ),
      );
    }

    // Plain text (translations and other tafsirs)
    return SelectableText(
      item.text,
      style: GoogleFonts.ebGaramond(
        fontSize: 17,
        height: 1.6,
      ),
    );
  }

  Widget _buildFootnotes(BuildContext context, List<FootnoteWithLink> footnotes) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.info_outline,
                size: 16,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              const SizedBox(width: 6),
              Text(
                'Footnotes',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ...footnotes.map((f) => Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: SelectableText.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '${f.link.footnoteNumber}. ',
                        style: GoogleFonts.ebGaramond(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      TextSpan(
                        text: f.footnote.footnoteText,
                        style: GoogleFonts.ebGaramond(
                          fontSize: 13,
                          height: 1.4,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildPageIndicator(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Left arrow
        IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: _currentPage > 0
              ? () {
                  _pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              : null,
          iconSize: 20,
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
        ),

        // Dots
        Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(_contentItems.length, (index) {
            final isActive = index == _currentPage;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.symmetric(horizontal: 3),
              width: isActive ? 24 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: isActive
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.outlineVariant,
                borderRadius: BorderRadius.circular(4),
              ),
            );
          }),
        ),

        // Right arrow
        IconButton(
          icon: const Icon(Icons.chevron_right),
          onPressed: _currentPage < _contentItems.length - 1
              ? () {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              : null,
          iconSize: 20,
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
        ),
      ],
    );
  }
}
