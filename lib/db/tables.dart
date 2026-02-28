import 'package:drift/drift.dart';

// ============================================================================
// CORE TABLES
// ============================================================================

/// Surah (chapter) table - 114 surahs
class Surah extends Table {
  IntColumn get surahNumber => integer().named('surah_number')();
  TextColumn get nameArabic => text().named('name_arabic')();
  TextColumn get nameEnglish => text().named('name_english')();
  TextColumn get nameTransliteration =>
      text().named('name_transliteration').nullable()();
  IntColumn get totalVerses => integer().named('total_verses')();
  TextColumn get revelationPlace =>
      text().named('revelation_place').nullable()();
  IntColumn get revelationOrder =>
      integer().named('revelation_order').nullable()();
  IntColumn get bismillahPre =>
      integer().named('bismillah_pre').withDefault(const Constant(1))();
  TextColumn get description => text().nullable()();
  TextColumn get descriptionShort =>
      text().named('description_short').nullable()();

  @override
  Set<Column> get primaryKey => {surahNumber};
}

/// Ayah (verse) table - 6,236 ayahs
class Ayah extends Table {
  IntColumn get id => integer()();
  IntColumn get surahNumber =>
      integer().named('surah_number').references(Surah, #surahNumber)();
  IntColumn get verseNumber => integer().named('verse_number')();
  TextColumn get verseKey => text().named('verse_key').unique()();
  TextColumn get arabic => text()();
  IntColumn get pageNumber => integer().named('page_number').nullable()();
  IntColumn get juzNumber =>
      integer().named('juz_number').nullable().references(Juz, #juzNumber)();
  IntColumn get rukuNumber =>
      integer().named('ruku_number').nullable().references(Ruku, #rukuNumber)();

  @override
  Set<Column> get primaryKey => {id};
}

/// Word table - 83,668 words for mushaf layout
class Word extends Table {
  IntColumn get id => integer()();
  TextColumn get verseKey =>
      text().named('verse_key').references(Ayah, #verseKey)();
  IntColumn get wordNumber => integer().named('word_number')();
  TextColumn get wordText => text().named('text')();

  @override
  Set<Column> get primaryKey => {id};
}

/// Page line table - mushaf layout (610 pages × ~15 lines)
/// Stores actual Arabic text for each line for precise rendering
class PageLine extends Table {
  IntColumn get pageNumber => integer().named('page_number')();
  IntColumn get lineNumber => integer().named('line_number')();
  TextColumn get lineType => text().named('line_type')();
  IntColumn get isCentered =>
      integer().named('is_centered').withDefault(const Constant(0))();
  /// The actual Arabic text to render for this line
  TextColumn get lineText => text().named('line_text').nullable()();
  IntColumn get surahNumber => integer().named('surah_number').nullable()();

  @override
  Set<Column> get primaryKey => {pageNumber, lineNumber};
}

// ============================================================================
// METADATA TABLES
// ============================================================================

/// Juz (para) table - 30 juz
class Juz extends Table {
  IntColumn get juzNumber => integer().named('juz_number')();
  TextColumn get arabicName => text().named('arabic_name').nullable()();
  TextColumn get firstVerseKey => text().named('first_verse_key')();
  TextColumn get lastVerseKey => text().named('last_verse_key')();
  IntColumn get versesCount => integer().named('verses_count').nullable()();

  @override
  Set<Column> get primaryKey => {juzNumber};
}

/// Ruku table - ~558 sections
class Ruku extends Table {
  IntColumn get rukuNumber => integer().named('ruku_number')();
  IntColumn get surahNumber =>
      integer().named('surah_number').references(Surah, #surahNumber)();
  IntColumn get surahRukuNumber =>
      integer().named('surah_ruku_number').nullable()();
  TextColumn get firstVerseKey => text().named('first_verse_key')();
  TextColumn get lastVerseKey => text().named('last_verse_key')();
  IntColumn get versesCount => integer().named('verses_count').nullable()();

  @override
  Set<Column> get primaryKey => {rukuNumber};
}

/// Sajda table - 15 prostration points
class Sajda extends Table {
  IntColumn get sajdaNumber => integer().named('sajda_number')();
  TextColumn get verseKey =>
      text().named('verse_key').unique().references(Ayah, #verseKey)();
  TextColumn get sajdaType => text().named('sajda_type')();

  @override
  Set<Column> get primaryKey => {sajdaNumber};
}

// ============================================================================
// CONTENT TABLES
// ============================================================================

/// Source table - metadata for translations and tafsirs
class Source extends Table {
  TextColumn get sourceId => text().named('source_id')();
  TextColumn get sourceType => text().named('source_type')();
  TextColumn get language => text()();
  TextColumn get name => text()();
  TextColumn get author => text().nullable()();
  TextColumn get description => text().nullable()();

  @override
  Set<Column> get primaryKey => {sourceId};
}

/// Translation table - unified translations (en_clear, ja_mita, ja_sato, ja_yasashii)
class Translation extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get verseKey =>
      text().named('verse_key').references(Ayah, #verseKey)();
  TextColumn get sourceId =>
      text().named('source_id').references(Source, #sourceId)();
  TextColumn get translationText => text().named('text')();

  @override
  List<Set<Column>> get uniqueKeys => [
        {verseKey, sourceId}
      ];
}

/// Tafsir table - unified tafsirs (en_ibn_kathir, en_abridged, ja_mokhtasar)
class Tafsir extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get verseKey =>
      text().named('verse_key').references(Ayah, #verseKey)();
  TextColumn get sourceId =>
      text().named('source_id').references(Source, #sourceId)();
  TextColumn get groupVerseKey => text().named('group_verse_key').nullable()();
  TextColumn get tafsirText => text().named('text')();

  @override
  List<Set<Column>> get uniqueKeys => [
        {verseKey, sourceId}
      ];
}

// ============================================================================
// FOOTNOTE TABLES
// ============================================================================

/// Footnote table - Clear Quran footnotes
class Footnote extends Table {
  IntColumn get id => integer()();
  IntColumn get footnoteId => integer().named('footnote_id').unique()();
  TextColumn get footnoteText => text().named('text')();

  @override
  Set<Column> get primaryKey => {id};
}

/// Ayah-Footnote link table
class AyahFootnote extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get verseKey =>
      text().named('verse_key').references(Ayah, #verseKey)();
  IntColumn get footnoteNumber => integer().named('footnote_number')();
  IntColumn get footnoteId =>
      integer().named('footnote_id').references(Footnote, #footnoteId)();
}
