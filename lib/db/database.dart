import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'tables.dart';

part 'database.g.dart';

@DriftDatabase(tables: [Surah, Juzu, Ruku, Page, Ayah, Japanese, English])
class AppDatabase extends _$AppDatabase {
  AppDatabase._() : super(_openConnection());

  static AppDatabase? _instance;

  static AppDatabase get instance {
    _instance ??= AppDatabase._();
    return _instance!;
  }

  @override
  int get schemaVersion => 1;

  // Query helpers

  /// Get all surahs
  Future<List<SurahData>> getAllSurahs() => select(surah).get();

  /// Get a surah by number
  Future<SurahData?> getSurah(int surahNumber) =>
      (select(surah)..where((s) => s.surahNumber.equals(surahNumber)))
          .getSingleOrNull();

  /// Get all ayahs for a surah
  Future<List<AyahData>> getAyahsBySurah(int surahNumber) =>
      (select(ayah)..where((a) => a.surahNumber.equals(surahNumber))).get();

  /// Get all ayahs for a page
  Future<List<AyahData>> getAyahsByPage(int pageNumber) =>
      (select(ayah)..where((a) => a.pageNumber.equals(pageNumber))).get();

  /// Get all ayahs for a juzu
  Future<List<AyahData>> getAyahsByJuzu(int juzuNumber) =>
      (select(ayah)..where((a) => a.juzuNumber.equals(juzuNumber))).get();

  /// Get ayah with translations
  Future<AyahWithTranslations?> getAyahWithTranslations(String verseKey) async {
    final ayahResult = await (select(ayah)
          ..where((a) => a.verseKey.equals(verseKey)))
        .getSingleOrNull();

    if (ayahResult == null) return null;

    final japaneseResult = await (select(japanese)
          ..where((j) => j.verseKey.equals(verseKey)))
        .getSingleOrNull();

    final englishResult = await (select(english)
          ..where((e) => e.verseKey.equals(verseKey)))
        .getSingleOrNull();

    return AyahWithTranslations(
      ayah: ayahResult,
      japanese: japaneseResult,
      english: englishResult,
    );
  }

  /// Get all juzus
  Future<List<JuzuData>> getAllJuzus() => select(juzu).get();

  /// Get all pages
  Future<List<PageData>> getAllPages() => select(page).get();

  /// Get all rukus for a surah
  Future<List<RukuData>> getRukusBySurah(int surahNumber) =>
      (select(ruku)..where((r) => r.surahNumber.equals(surahNumber))).get();
}

/// Helper class to hold ayah with its translations
class AyahWithTranslations {
  final AyahData ayah;
  final JapaneseData? japanese;
  final EnglishData? english;

  AyahWithTranslations({
    required this.ayah,
    this.japanese,
    this.english,
  });
}

/// Opens connection and copies pre-built database from assets if needed
QueryExecutor _openConnection() {
  return driftDatabase(
    name: 'quran',
    native: DriftNativeOptions(
      databasePath: () async {
        final dbFolder = await getApplicationDocumentsDirectory();
        final file = File(p.join(dbFolder.path, 'quran.db'));

        // Copy pre-built database from assets if it doesn't exist
        if (!await file.exists()) {
          final blob = await rootBundle.load('assets/quran.db');
          final buffer = blob.buffer;
          await file.writeAsBytes(
            buffer.asUint8List(blob.offsetInBytes, blob.lengthInBytes),
          );
        }

        return file.path;
      },
    ),
  );
}
