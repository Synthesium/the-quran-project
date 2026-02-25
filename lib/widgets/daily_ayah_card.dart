import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../db/database.dart';
import 'furigana_text.dart';

class DailyAyahCard extends StatefulWidget {
  const DailyAyahCard({super.key});

  @override
  State<DailyAyahCard> createState() => _DailyAyahCardState();
}

class _DailyAyahCardState extends State<DailyAyahCard> {
  AyahWithTranslations? _ayahData;
  SurahData? _surahData;
  bool _isLoading = true;

  /// Get the Unicode character for the ayah number marker
  /// The AlQuran font has pre-made circular markers at U+F4FF + N
  String _getAyahMarkerChar(int number) {
    final codePoint = 0xF4FF + number;
    return String.fromCharCode(codePoint);
  }

  @override
  void initState() {
    super.initState();
    _loadRandomAyah();
  }

  Future<void> _loadRandomAyah() async {
    final db = AppDatabase.instance;

    // Get a random ayah (1-6236)
    final random = Random();
    final randomId = random.nextInt(6236) + 1;

    // Fetch ayah by constructing verse key
    final ayahs = await db.select(db.ayah).get();
    if (ayahs.isEmpty) return;

    final randomAyah = ayahs[randomId - 1];
    final verseKey = randomAyah.verseKey;

    final ayahWithTranslations = await db.getAyahWithTranslations(verseKey);
    final surah = await db.getSurah(randomAyah.surahNumber);

    if (mounted) {
      setState(() {
        _ayahData = ayahWithTranslations;
        _surahData = surah;
        _isLoading = false;
      });
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

    if (_ayahData == null) {
      return const Card(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Center(child: Text('Could not load ayah')),
        ),
      );
    }

    final ayah = _ayahData!.ayah;
    final japanese = _ayahData!.japanese;
    final english = _ayahData!.english;

    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header
            Row(
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
            ),

            const SizedBox(height: 8),

            // Surah info
            if (_surahData != null)
              Text(
                '${_surahData!.nameEnglish} (${_surahData!.nameArabic}) - ${ayah.verseKey}',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),

            const SizedBox(height: 16),

            // Arabic text with inline ayah marker
            SelectableText.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '${ayah.arabic} ',
                    style: const TextStyle(
                      fontFamily: 'AlQuran',
                      fontSize: 32,
                      height: 2.0,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: _getAyahMarkerChar(ayah.verseNumber),
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
            ),

            const Divider(height: 32),

            // English translation - using EB Garamond
            if (english != null)
              SelectableText(
                english.translationText,
                style: GoogleFonts.ebGaramond(
                  fontSize: 18,
                  height: 1.6,
                ),
              ),

            const SizedBox(height: 16),

            // Japanese translation with furigana - using Noto Serif JP
            if (japanese?.textWithFurigana != null)
              FuriganaTextWidget(
                text: japanese!.textWithFurigana!,
                baseStyle: GoogleFonts.notoSerifJp(
                  fontSize: 18,
                  height: 1.4,
                  color: Colors.black,
                ),
                furiganaStyle: GoogleFonts.notoSerifJp(
                  fontSize: 10,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
