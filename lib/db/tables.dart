import 'package:drift/drift.dart';

/// Surah (chapter) table - 114 surahs
class Surah extends Table {
  IntColumn get surahNumber => integer().named('surah_number')();
  TextColumn get nameEnglish => text().named('name_english')();
  TextColumn get nameTranslated => text().named('name_translated').nullable()();
  TextColumn get nameArabic => text().named('name_arabic').nullable()();
  IntColumn get totalVerses => integer().named('total_verses')();
  TextColumn get revelationPlace => text().named('revelation_place').nullable()();
  IntColumn get revelationOrder => integer().named('revelation_order').nullable()();
  TextColumn get shortExcerpt => text().named('short_excerpt').nullable()();
  TextColumn get summary => text().nullable()();

  @override
  Set<Column> get primaryKey => {surahNumber};
}

/// Juzu (para/juz) table - 30 juzus
class Juzu extends Table {
  IntColumn get juzuNumber => integer().named('juzu_number')();
  TextColumn get arabicName => text().named('arabic_name')();
  IntColumn get startSurah => integer().named('start_surah')();
  IntColumn get startVerse => integer().named('start_verse')();
  IntColumn get endSurah => integer().named('end_surah')();
  IntColumn get endVerse => integer().named('end_verse')();

  @override
  Set<Column> get primaryKey => {juzuNumber};
}

/// Ruku table - sections within surahs
class Ruku extends Table {
  IntColumn get rukuNumber => integer().named('ruku_number')();
  IntColumn get surahNumber => integer().named('surah_number').references(Surah, #surahNumber)();
  TextColumn get surahNameArabic => text().named('surah_name_arabic').nullable()();
  IntColumn get firstAya => integer().named('first_aya')();
  IntColumn get lastAya => integer().named('last_aya')();
  IntColumn get sajdaAya => integer().named('sajda_aya').withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {rukuNumber};
}

/// Page table - 604 pages in standard Mushaf
class Page extends Table {
  IntColumn get pageNumber => integer().named('page_number')();
  IntColumn get juzuNumber => integer().named('juzu_number').nullable()();
  TextColumn get firstVerseKey => text().named('first_verse_key').nullable()();
  IntColumn get verseCount => integer().named('verse_count').nullable()();

  @override
  Set<Column> get primaryKey => {pageNumber};
}

/// Ayah (verse) table - Quran Arabic text
class Ayah extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get surahNumber => integer().named('surah_number').references(Surah, #surahNumber)();
  IntColumn get verseNumber => integer().named('verse_number')();
  TextColumn get verseKey => text().named('verse_key').unique()();
  TextColumn get arabic => text()();
  IntColumn get pageNumber => integer().named('page_number').nullable()();
  IntColumn get rukuNumber => integer().named('ruku_number').nullable().references(Ruku, #rukuNumber)();
  IntColumn get juzuNumber => integer().named('juzu_number').nullable().references(Juzu, #juzuNumber)();
}

/// Japanese translation table
class Japanese extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get surahNumber => integer().named('surah_number')();
  IntColumn get verseNumber => integer().named('verse_number')();
  TextColumn get verseKey => text().named('verse_key').unique()();
  TextColumn get textPlain => text().named('text_plain').nullable()();
  TextColumn get textWithFurigana => text().named('text_with_furigana').nullable()();
}

/// English translation table
class English extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get surahNumber => integer().named('surah_number')();
  IntColumn get verseNumber => integer().named('verse_number')();
  TextColumn get verseKey => text().named('verse_key').unique()();
  TextColumn get translationText => text().named('text')();
}
