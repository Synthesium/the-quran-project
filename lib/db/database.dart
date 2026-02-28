import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'tables.dart';

part 'database.g.dart';

@DriftDatabase(tables: [
  Surah,
  Ayah,
  Word,
  PageLine,
  Juz,
  Ruku,
  Sajda,
  Source,
  Translation,
  Tafsir,
  Footnote,
  AyahFootnote,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase._() : super(_openConnection());

  static AppDatabase? _instance;

  static AppDatabase get instance {
    _instance ??= AppDatabase._();
    return _instance!;
  }

  @override
  int get schemaVersion => 2;

  // ============================================================================
  // SURAH QUERIES
  // ============================================================================

  /// Get all surahs
  Future<List<SurahData>> getAllSurahs() => select(surah).get();

  /// Get a surah by number
  Future<SurahData?> getSurah(int surahNumber) =>
      (select(surah)..where((s) => s.surahNumber.equals(surahNumber)))
          .getSingleOrNull();

  /// Get all surahs with their start pages
  Future<List<SurahWithStartPage>> getAllSurahsWithStartPages() async {
    final surahs = await getAllSurahs();
    final result = <SurahWithStartPage>[];

    for (final s in surahs) {
      final firstAyah = await (select(ayah)
            ..where((a) => a.surahNumber.equals(s.surahNumber))
            ..orderBy([(a) => OrderingTerm.asc(a.verseNumber)])
            ..limit(1))
          .getSingleOrNull();

      result.add(SurahWithStartPage(
        surah: s,
        startPage: firstAyah?.pageNumber ?? 1,
      ));
    }

    return result;
  }

  // ============================================================================
  // AYAH QUERIES
  // ============================================================================

  /// Get all ayahs for a surah
  Future<List<AyahData>> getAyahsBySurah(int surahNumber) =>
      (select(ayah)..where((a) => a.surahNumber.equals(surahNumber))).get();

  /// Get all ayahs for a page
  Future<List<AyahData>> getAyahsByPage(int pageNumber) =>
      (select(ayah)..where((a) => a.pageNumber.equals(pageNumber))).get();

  /// Get all ayahs for a juz
  Future<List<AyahData>> getAyahsByJuz(int juzNumber) =>
      (select(ayah)..where((a) => a.juzNumber.equals(juzNumber))).get();

  /// Get a single ayah by verse key
  Future<AyahData?> getAyah(String verseKey) =>
      (select(ayah)..where((a) => a.verseKey.equals(verseKey)))
          .getSingleOrNull();

  /// Get a random ayah
  Future<AyahData?> getRandomAyah() async {
    final result = await customSelect(
      'SELECT * FROM ayah ORDER BY RANDOM() LIMIT 1',
      readsFrom: {ayah},
    ).getSingleOrNull();
    if (result == null) return null;
    return AyahData(
      id: result.read<int>('id'),
      surahNumber: result.read<int>('surah_number'),
      verseNumber: result.read<int>('verse_number'),
      verseKey: result.read<String>('verse_key'),
      arabic: result.read<String>('arabic'),
      pageNumber: result.readNullable<int>('page_number'),
      juzNumber: result.readNullable<int>('juz_number'),
      rukuNumber: result.readNullable<int>('ruku_number'),
    );
  }

  // ============================================================================
  // TRANSLATION QUERIES
  // ============================================================================

  /// Get translation for a verse by source ID
  Future<TranslationData?> getTranslation(
          String verseKey, String sourceId) async =>
      (select(translation)
            ..where((t) =>
                t.verseKey.equals(verseKey) & t.sourceId.equals(sourceId)))
          .getSingleOrNull();

  /// Get all translations for a verse
  Future<List<TranslationData>> getTranslationsForVerse(String verseKey) =>
      (select(translation)..where((t) => t.verseKey.equals(verseKey))).get();

  /// Get translations by source for a surah
  Future<List<TranslationData>> getTranslationsBySurah(
      int surahNumber, String sourceId) async {
    return (select(translation).join([
      innerJoin(ayah, ayah.verseKey.equalsExp(translation.verseKey)),
    ])
          ..where(
              ayah.surahNumber.equals(surahNumber) & translation.sourceId.equals(sourceId))
          ..orderBy([OrderingTerm.asc(ayah.verseNumber)]))
        .map((row) => row.readTable(translation))
        .get();
  }

  // ============================================================================
  // TAFSIR QUERIES
  // ============================================================================

  /// Get tafsir for a verse by source ID
  Future<TafsirData?> getTafsir(String verseKey, String sourceId) async =>
      (select(tafsir)
            ..where((t) =>
                t.verseKey.equals(verseKey) & t.sourceId.equals(sourceId)))
          .getSingleOrNull();

  /// Get all tafsirs for a verse
  Future<List<TafsirData>> getTafsirsForVerse(String verseKey) =>
      (select(tafsir)..where((t) => t.verseKey.equals(verseKey))).get();

  /// Get tafsirs with resolved group text
  /// When a tafsir has empty text but a group_verse_key, fetch text from the group
  Future<List<ResolvedTafsir>> getResolvedTafsirsForVerse(String verseKey) async {
    final tafsirs = await getTafsirsForVerse(verseKey);
    final resolved = <ResolvedTafsir>[];

    for (final t in tafsirs) {
      String text = t.tafsirText;
      String? groupVerseKey = t.groupVerseKey;
      bool isGrouped = false;

      // If text is empty and we have a group key, fetch from group
      if ((text.isEmpty) && groupVerseKey != null && groupVerseKey != verseKey) {
        final groupTafsir = await getTafsir(groupVerseKey, t.sourceId);
        if (groupTafsir != null && groupTafsir.tafsirText.isNotEmpty) {
          text = groupTafsir.tafsirText;
          isGrouped = true;
        }
      }

      resolved.add(ResolvedTafsir(
        tafsir: t,
        resolvedText: text,
        isGrouped: isGrouped,
        groupVerseKey: isGrouped ? groupVerseKey : null,
      ));
    }

    return resolved;
  }

  // ============================================================================
  // WORD QUERIES (for mushaf layout)
  // ============================================================================

  /// Get all words for a verse
  Future<List<WordData>> getWordsForVerse(String verseKey) =>
      (select(word)
            ..where((w) => w.verseKey.equals(verseKey))
            ..orderBy([(w) => OrderingTerm.asc(w.wordNumber)]))
          .get();

  /// Get words by ID range (for page line rendering)
  Future<List<WordData>> getWordsInRange(int firstWordId, int lastWordId) =>
      (select(word)
            ..where((w) =>
                w.id.isBiggerOrEqualValue(firstWordId) &
                w.id.isSmallerOrEqualValue(lastWordId))
            ..orderBy([(w) => OrderingTerm.asc(w.id)]))
          .get();

  // ============================================================================
  // PAGE LINE QUERIES (for mushaf layout)
  // ============================================================================

  /// Get all lines for a page
  Future<List<PageLineData>> getPageLines(int pageNumber) =>
      (select(pageLine)
            ..where((p) => p.pageNumber.equals(pageNumber))
            ..orderBy([(p) => OrderingTerm.asc(p.lineNumber)]))
          .get();

  // ============================================================================
  // METADATA QUERIES
  // ============================================================================

  /// Get all juz
  Future<List<JuzData>> getAllJuz() => select(juz).get();

  /// Get a juz by number
  Future<JuzData?> getJuz(int juzNumber) =>
      (select(juz)..where((j) => j.juzNumber.equals(juzNumber)))
          .getSingleOrNull();

  /// Get all rukus for a surah
  Future<List<RukuData>> getRukusBySurah(int surahNumber) =>
      (select(ruku)..where((r) => r.surahNumber.equals(surahNumber))).get();

  /// Get all sajdas
  Future<List<SajdaData>> getAllSajdas() => select(sajda).get();

  /// Check if a verse has sajda
  Future<SajdaData?> getSajdaForVerse(String verseKey) =>
      (select(sajda)..where((s) => s.verseKey.equals(verseKey)))
          .getSingleOrNull();

  // ============================================================================
  // SOURCE QUERIES
  // ============================================================================

  /// Get all sources
  Future<List<SourceData>> getAllSources() => select(source).get();

  /// Get sources by type (translation or tafsir)
  Future<List<SourceData>> getSourcesByType(String sourceType) =>
      (select(source)..where((s) => s.sourceType.equals(sourceType))).get();

  /// Get sources by language
  Future<List<SourceData>> getSourcesByLanguage(String language) =>
      (select(source)..where((s) => s.language.equals(language))).get();

  // ============================================================================
  // FOOTNOTE QUERIES
  // ============================================================================

  /// Get footnotes for a verse
  Future<List<FootnoteWithLink>> getFootnotesForVerse(String verseKey) async {
    final result = await (select(ayahFootnote).join([
      innerJoin(footnote, footnote.footnoteId.equalsExp(ayahFootnote.footnoteId)),
    ])
          ..where(ayahFootnote.verseKey.equals(verseKey))
          ..orderBy([OrderingTerm.asc(ayahFootnote.footnoteNumber)]))
        .get();

    return result.map((row) {
      return FootnoteWithLink(
        link: row.readTable(ayahFootnote),
        footnote: row.readTable(footnote),
      );
    }).toList();
  }

  // ============================================================================
  // COMBINED QUERIES
  // ============================================================================

  /// Get ayah with all translations
  Future<AyahWithTranslations?> getAyahWithTranslations(String verseKey) async {
    final ayahResult = await getAyah(verseKey);
    if (ayahResult == null) return null;

    final translations = await getTranslationsForVerse(verseKey);

    return AyahWithTranslations(
      ayah: ayahResult,
      translations: {for (var t in translations) t.sourceId: t},
    );
  }

  /// Get ayah with specific translations
  Future<AyahWithTranslations?> getAyahWithSpecificTranslations(
    String verseKey,
    List<String> sourceIds,
  ) async {
    final ayahResult = await getAyah(verseKey);
    if (ayahResult == null) return null;

    final Map<String, TranslationData> translations = {};
    for (final sourceId in sourceIds) {
      final t = await getTranslation(verseKey, sourceId);
      if (t != null) translations[sourceId] = t;
    }

    return AyahWithTranslations(
      ayah: ayahResult,
      translations: translations,
    );
  }
}

/// Helper class to hold ayah with its translations
class AyahWithTranslations {
  final AyahData ayah;
  final Map<String, TranslationData> translations;

  AyahWithTranslations({
    required this.ayah,
    required this.translations,
  });

  /// Get English translation (Clear Quran)
  TranslationData? get english => translations['en_clear'];

  /// Get Japanese translation (Mita)
  TranslationData? get japaneseMita => translations['ja_mita'];

  /// Get Japanese translation (Sato)
  TranslationData? get japaneseSato => translations['ja_sato'];

  /// Get Japanese translation (Yasashii)
  TranslationData? get japaneseYasashii => translations['ja_yasashii'];
}

/// Helper class for footnotes with their links
class FootnoteWithLink {
  final AyahFootnoteData link;
  final FootnoteData footnote;

  FootnoteWithLink({
    required this.link,
    required this.footnote,
  });
}

/// Helper class for tafsirs with resolved group text
class ResolvedTafsir {
  final TafsirData tafsir;
  final String resolvedText;
  final bool isGrouped;
  final String? groupVerseKey;

  ResolvedTafsir({
    required this.tafsir,
    required this.resolvedText,
    required this.isGrouped,
    this.groupVerseKey,
  });

  String get sourceId => tafsir.sourceId;
  String get verseKey => tafsir.verseKey;
}

/// Helper class for surahs with their start page
class SurahWithStartPage {
  final SurahData surah;
  final int startPage;

  SurahWithStartPage({
    required this.surah,
    required this.startPage,
  });
}

/// Current asset database version - increment this when assets/quran.db changes
const int _assetDbVersion = 6;

/// Opens connection and copies pre-built database from assets if needed
QueryExecutor _openConnection() {
  return driftDatabase(
    name: 'quran',
    native: DriftNativeOptions(
      databasePath: () async {
        final dbFolder = await getApplicationDocumentsDirectory();
        final file = File(p.join(dbFolder.path, 'quran.db'));
        final versionFile = File(p.join(dbFolder.path, 'quran.db.version'));

        // Check if we need to update the database
        bool needsUpdate = !await file.exists();
        if (!needsUpdate && await versionFile.exists()) {
          final currentVersion = int.tryParse(await versionFile.readAsString());
          needsUpdate = currentVersion != _assetDbVersion;
        } else if (!needsUpdate) {
          // No version file means old database, needs update
          needsUpdate = true;
        }

        if (needsUpdate) {
          // Delete old database if it exists
          if (await file.exists()) {
            await file.delete();
          }

          // Copy pre-built database from assets
          final blob = await rootBundle.load('assets/quran.db');
          final buffer = blob.buffer;
          await file.writeAsBytes(
            buffer.asUint8List(blob.offsetInBytes, blob.lengthInBytes),
          );

          // Write version file
          await versionFile.writeAsString(_assetDbVersion.toString());
        }

        return file.path;
      },
    ),
  );
}
