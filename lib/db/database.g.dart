// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $SurahTable extends Surah with TableInfo<$SurahTable, SurahData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SurahTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _surahNumberMeta = const VerificationMeta(
    'surahNumber',
  );
  @override
  late final GeneratedColumn<int> surahNumber = GeneratedColumn<int>(
    'surah_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameEnglishMeta = const VerificationMeta(
    'nameEnglish',
  );
  @override
  late final GeneratedColumn<String> nameEnglish = GeneratedColumn<String>(
    'name_english',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameTranslatedMeta = const VerificationMeta(
    'nameTranslated',
  );
  @override
  late final GeneratedColumn<String> nameTranslated = GeneratedColumn<String>(
    'name_translated',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameArabicMeta = const VerificationMeta(
    'nameArabic',
  );
  @override
  late final GeneratedColumn<String> nameArabic = GeneratedColumn<String>(
    'name_arabic',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _totalVersesMeta = const VerificationMeta(
    'totalVerses',
  );
  @override
  late final GeneratedColumn<int> totalVerses = GeneratedColumn<int>(
    'total_verses',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _revelationPlaceMeta = const VerificationMeta(
    'revelationPlace',
  );
  @override
  late final GeneratedColumn<String> revelationPlace = GeneratedColumn<String>(
    'revelation_place',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _revelationOrderMeta = const VerificationMeta(
    'revelationOrder',
  );
  @override
  late final GeneratedColumn<int> revelationOrder = GeneratedColumn<int>(
    'revelation_order',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _shortExcerptMeta = const VerificationMeta(
    'shortExcerpt',
  );
  @override
  late final GeneratedColumn<String> shortExcerpt = GeneratedColumn<String>(
    'short_excerpt',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _summaryMeta = const VerificationMeta(
    'summary',
  );
  @override
  late final GeneratedColumn<String> summary = GeneratedColumn<String>(
    'summary',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    surahNumber,
    nameEnglish,
    nameTranslated,
    nameArabic,
    totalVerses,
    revelationPlace,
    revelationOrder,
    shortExcerpt,
    summary,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'surah';
  @override
  VerificationContext validateIntegrity(
    Insertable<SurahData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('surah_number')) {
      context.handle(
        _surahNumberMeta,
        surahNumber.isAcceptableOrUnknown(
          data['surah_number']!,
          _surahNumberMeta,
        ),
      );
    }
    if (data.containsKey('name_english')) {
      context.handle(
        _nameEnglishMeta,
        nameEnglish.isAcceptableOrUnknown(
          data['name_english']!,
          _nameEnglishMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_nameEnglishMeta);
    }
    if (data.containsKey('name_translated')) {
      context.handle(
        _nameTranslatedMeta,
        nameTranslated.isAcceptableOrUnknown(
          data['name_translated']!,
          _nameTranslatedMeta,
        ),
      );
    }
    if (data.containsKey('name_arabic')) {
      context.handle(
        _nameArabicMeta,
        nameArabic.isAcceptableOrUnknown(data['name_arabic']!, _nameArabicMeta),
      );
    }
    if (data.containsKey('total_verses')) {
      context.handle(
        _totalVersesMeta,
        totalVerses.isAcceptableOrUnknown(
          data['total_verses']!,
          _totalVersesMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_totalVersesMeta);
    }
    if (data.containsKey('revelation_place')) {
      context.handle(
        _revelationPlaceMeta,
        revelationPlace.isAcceptableOrUnknown(
          data['revelation_place']!,
          _revelationPlaceMeta,
        ),
      );
    }
    if (data.containsKey('revelation_order')) {
      context.handle(
        _revelationOrderMeta,
        revelationOrder.isAcceptableOrUnknown(
          data['revelation_order']!,
          _revelationOrderMeta,
        ),
      );
    }
    if (data.containsKey('short_excerpt')) {
      context.handle(
        _shortExcerptMeta,
        shortExcerpt.isAcceptableOrUnknown(
          data['short_excerpt']!,
          _shortExcerptMeta,
        ),
      );
    }
    if (data.containsKey('summary')) {
      context.handle(
        _summaryMeta,
        summary.isAcceptableOrUnknown(data['summary']!, _summaryMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {surahNumber};
  @override
  SurahData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SurahData(
      surahNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}surah_number'],
      )!,
      nameEnglish: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_english'],
      )!,
      nameTranslated: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_translated'],
      ),
      nameArabic: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_arabic'],
      ),
      totalVerses: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_verses'],
      )!,
      revelationPlace: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}revelation_place'],
      ),
      revelationOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}revelation_order'],
      ),
      shortExcerpt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}short_excerpt'],
      ),
      summary: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}summary'],
      ),
    );
  }

  @override
  $SurahTable createAlias(String alias) {
    return $SurahTable(attachedDatabase, alias);
  }
}

class SurahData extends DataClass implements Insertable<SurahData> {
  final int surahNumber;
  final String nameEnglish;
  final String? nameTranslated;
  final String? nameArabic;
  final int totalVerses;
  final String? revelationPlace;
  final int? revelationOrder;
  final String? shortExcerpt;
  final String? summary;
  const SurahData({
    required this.surahNumber,
    required this.nameEnglish,
    this.nameTranslated,
    this.nameArabic,
    required this.totalVerses,
    this.revelationPlace,
    this.revelationOrder,
    this.shortExcerpt,
    this.summary,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['surah_number'] = Variable<int>(surahNumber);
    map['name_english'] = Variable<String>(nameEnglish);
    if (!nullToAbsent || nameTranslated != null) {
      map['name_translated'] = Variable<String>(nameTranslated);
    }
    if (!nullToAbsent || nameArabic != null) {
      map['name_arabic'] = Variable<String>(nameArabic);
    }
    map['total_verses'] = Variable<int>(totalVerses);
    if (!nullToAbsent || revelationPlace != null) {
      map['revelation_place'] = Variable<String>(revelationPlace);
    }
    if (!nullToAbsent || revelationOrder != null) {
      map['revelation_order'] = Variable<int>(revelationOrder);
    }
    if (!nullToAbsent || shortExcerpt != null) {
      map['short_excerpt'] = Variable<String>(shortExcerpt);
    }
    if (!nullToAbsent || summary != null) {
      map['summary'] = Variable<String>(summary);
    }
    return map;
  }

  SurahCompanion toCompanion(bool nullToAbsent) {
    return SurahCompanion(
      surahNumber: Value(surahNumber),
      nameEnglish: Value(nameEnglish),
      nameTranslated: nameTranslated == null && nullToAbsent
          ? const Value.absent()
          : Value(nameTranslated),
      nameArabic: nameArabic == null && nullToAbsent
          ? const Value.absent()
          : Value(nameArabic),
      totalVerses: Value(totalVerses),
      revelationPlace: revelationPlace == null && nullToAbsent
          ? const Value.absent()
          : Value(revelationPlace),
      revelationOrder: revelationOrder == null && nullToAbsent
          ? const Value.absent()
          : Value(revelationOrder),
      shortExcerpt: shortExcerpt == null && nullToAbsent
          ? const Value.absent()
          : Value(shortExcerpt),
      summary: summary == null && nullToAbsent
          ? const Value.absent()
          : Value(summary),
    );
  }

  factory SurahData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SurahData(
      surahNumber: serializer.fromJson<int>(json['surahNumber']),
      nameEnglish: serializer.fromJson<String>(json['nameEnglish']),
      nameTranslated: serializer.fromJson<String?>(json['nameTranslated']),
      nameArabic: serializer.fromJson<String?>(json['nameArabic']),
      totalVerses: serializer.fromJson<int>(json['totalVerses']),
      revelationPlace: serializer.fromJson<String?>(json['revelationPlace']),
      revelationOrder: serializer.fromJson<int?>(json['revelationOrder']),
      shortExcerpt: serializer.fromJson<String?>(json['shortExcerpt']),
      summary: serializer.fromJson<String?>(json['summary']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'surahNumber': serializer.toJson<int>(surahNumber),
      'nameEnglish': serializer.toJson<String>(nameEnglish),
      'nameTranslated': serializer.toJson<String?>(nameTranslated),
      'nameArabic': serializer.toJson<String?>(nameArabic),
      'totalVerses': serializer.toJson<int>(totalVerses),
      'revelationPlace': serializer.toJson<String?>(revelationPlace),
      'revelationOrder': serializer.toJson<int?>(revelationOrder),
      'shortExcerpt': serializer.toJson<String?>(shortExcerpt),
      'summary': serializer.toJson<String?>(summary),
    };
  }

  SurahData copyWith({
    int? surahNumber,
    String? nameEnglish,
    Value<String?> nameTranslated = const Value.absent(),
    Value<String?> nameArabic = const Value.absent(),
    int? totalVerses,
    Value<String?> revelationPlace = const Value.absent(),
    Value<int?> revelationOrder = const Value.absent(),
    Value<String?> shortExcerpt = const Value.absent(),
    Value<String?> summary = const Value.absent(),
  }) => SurahData(
    surahNumber: surahNumber ?? this.surahNumber,
    nameEnglish: nameEnglish ?? this.nameEnglish,
    nameTranslated: nameTranslated.present
        ? nameTranslated.value
        : this.nameTranslated,
    nameArabic: nameArabic.present ? nameArabic.value : this.nameArabic,
    totalVerses: totalVerses ?? this.totalVerses,
    revelationPlace: revelationPlace.present
        ? revelationPlace.value
        : this.revelationPlace,
    revelationOrder: revelationOrder.present
        ? revelationOrder.value
        : this.revelationOrder,
    shortExcerpt: shortExcerpt.present ? shortExcerpt.value : this.shortExcerpt,
    summary: summary.present ? summary.value : this.summary,
  );
  SurahData copyWithCompanion(SurahCompanion data) {
    return SurahData(
      surahNumber: data.surahNumber.present
          ? data.surahNumber.value
          : this.surahNumber,
      nameEnglish: data.nameEnglish.present
          ? data.nameEnglish.value
          : this.nameEnglish,
      nameTranslated: data.nameTranslated.present
          ? data.nameTranslated.value
          : this.nameTranslated,
      nameArabic: data.nameArabic.present
          ? data.nameArabic.value
          : this.nameArabic,
      totalVerses: data.totalVerses.present
          ? data.totalVerses.value
          : this.totalVerses,
      revelationPlace: data.revelationPlace.present
          ? data.revelationPlace.value
          : this.revelationPlace,
      revelationOrder: data.revelationOrder.present
          ? data.revelationOrder.value
          : this.revelationOrder,
      shortExcerpt: data.shortExcerpt.present
          ? data.shortExcerpt.value
          : this.shortExcerpt,
      summary: data.summary.present ? data.summary.value : this.summary,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SurahData(')
          ..write('surahNumber: $surahNumber, ')
          ..write('nameEnglish: $nameEnglish, ')
          ..write('nameTranslated: $nameTranslated, ')
          ..write('nameArabic: $nameArabic, ')
          ..write('totalVerses: $totalVerses, ')
          ..write('revelationPlace: $revelationPlace, ')
          ..write('revelationOrder: $revelationOrder, ')
          ..write('shortExcerpt: $shortExcerpt, ')
          ..write('summary: $summary')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    surahNumber,
    nameEnglish,
    nameTranslated,
    nameArabic,
    totalVerses,
    revelationPlace,
    revelationOrder,
    shortExcerpt,
    summary,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SurahData &&
          other.surahNumber == this.surahNumber &&
          other.nameEnglish == this.nameEnglish &&
          other.nameTranslated == this.nameTranslated &&
          other.nameArabic == this.nameArabic &&
          other.totalVerses == this.totalVerses &&
          other.revelationPlace == this.revelationPlace &&
          other.revelationOrder == this.revelationOrder &&
          other.shortExcerpt == this.shortExcerpt &&
          other.summary == this.summary);
}

class SurahCompanion extends UpdateCompanion<SurahData> {
  final Value<int> surahNumber;
  final Value<String> nameEnglish;
  final Value<String?> nameTranslated;
  final Value<String?> nameArabic;
  final Value<int> totalVerses;
  final Value<String?> revelationPlace;
  final Value<int?> revelationOrder;
  final Value<String?> shortExcerpt;
  final Value<String?> summary;
  const SurahCompanion({
    this.surahNumber = const Value.absent(),
    this.nameEnglish = const Value.absent(),
    this.nameTranslated = const Value.absent(),
    this.nameArabic = const Value.absent(),
    this.totalVerses = const Value.absent(),
    this.revelationPlace = const Value.absent(),
    this.revelationOrder = const Value.absent(),
    this.shortExcerpt = const Value.absent(),
    this.summary = const Value.absent(),
  });
  SurahCompanion.insert({
    this.surahNumber = const Value.absent(),
    required String nameEnglish,
    this.nameTranslated = const Value.absent(),
    this.nameArabic = const Value.absent(),
    required int totalVerses,
    this.revelationPlace = const Value.absent(),
    this.revelationOrder = const Value.absent(),
    this.shortExcerpt = const Value.absent(),
    this.summary = const Value.absent(),
  }) : nameEnglish = Value(nameEnglish),
       totalVerses = Value(totalVerses);
  static Insertable<SurahData> custom({
    Expression<int>? surahNumber,
    Expression<String>? nameEnglish,
    Expression<String>? nameTranslated,
    Expression<String>? nameArabic,
    Expression<int>? totalVerses,
    Expression<String>? revelationPlace,
    Expression<int>? revelationOrder,
    Expression<String>? shortExcerpt,
    Expression<String>? summary,
  }) {
    return RawValuesInsertable({
      if (surahNumber != null) 'surah_number': surahNumber,
      if (nameEnglish != null) 'name_english': nameEnglish,
      if (nameTranslated != null) 'name_translated': nameTranslated,
      if (nameArabic != null) 'name_arabic': nameArabic,
      if (totalVerses != null) 'total_verses': totalVerses,
      if (revelationPlace != null) 'revelation_place': revelationPlace,
      if (revelationOrder != null) 'revelation_order': revelationOrder,
      if (shortExcerpt != null) 'short_excerpt': shortExcerpt,
      if (summary != null) 'summary': summary,
    });
  }

  SurahCompanion copyWith({
    Value<int>? surahNumber,
    Value<String>? nameEnglish,
    Value<String?>? nameTranslated,
    Value<String?>? nameArabic,
    Value<int>? totalVerses,
    Value<String?>? revelationPlace,
    Value<int?>? revelationOrder,
    Value<String?>? shortExcerpt,
    Value<String?>? summary,
  }) {
    return SurahCompanion(
      surahNumber: surahNumber ?? this.surahNumber,
      nameEnglish: nameEnglish ?? this.nameEnglish,
      nameTranslated: nameTranslated ?? this.nameTranslated,
      nameArabic: nameArabic ?? this.nameArabic,
      totalVerses: totalVerses ?? this.totalVerses,
      revelationPlace: revelationPlace ?? this.revelationPlace,
      revelationOrder: revelationOrder ?? this.revelationOrder,
      shortExcerpt: shortExcerpt ?? this.shortExcerpt,
      summary: summary ?? this.summary,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (surahNumber.present) {
      map['surah_number'] = Variable<int>(surahNumber.value);
    }
    if (nameEnglish.present) {
      map['name_english'] = Variable<String>(nameEnglish.value);
    }
    if (nameTranslated.present) {
      map['name_translated'] = Variable<String>(nameTranslated.value);
    }
    if (nameArabic.present) {
      map['name_arabic'] = Variable<String>(nameArabic.value);
    }
    if (totalVerses.present) {
      map['total_verses'] = Variable<int>(totalVerses.value);
    }
    if (revelationPlace.present) {
      map['revelation_place'] = Variable<String>(revelationPlace.value);
    }
    if (revelationOrder.present) {
      map['revelation_order'] = Variable<int>(revelationOrder.value);
    }
    if (shortExcerpt.present) {
      map['short_excerpt'] = Variable<String>(shortExcerpt.value);
    }
    if (summary.present) {
      map['summary'] = Variable<String>(summary.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SurahCompanion(')
          ..write('surahNumber: $surahNumber, ')
          ..write('nameEnglish: $nameEnglish, ')
          ..write('nameTranslated: $nameTranslated, ')
          ..write('nameArabic: $nameArabic, ')
          ..write('totalVerses: $totalVerses, ')
          ..write('revelationPlace: $revelationPlace, ')
          ..write('revelationOrder: $revelationOrder, ')
          ..write('shortExcerpt: $shortExcerpt, ')
          ..write('summary: $summary')
          ..write(')'))
        .toString();
  }
}

class $JuzuTable extends Juzu with TableInfo<$JuzuTable, JuzuData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $JuzuTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _juzuNumberMeta = const VerificationMeta(
    'juzuNumber',
  );
  @override
  late final GeneratedColumn<int> juzuNumber = GeneratedColumn<int>(
    'juzu_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _arabicNameMeta = const VerificationMeta(
    'arabicName',
  );
  @override
  late final GeneratedColumn<String> arabicName = GeneratedColumn<String>(
    'arabic_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startSurahMeta = const VerificationMeta(
    'startSurah',
  );
  @override
  late final GeneratedColumn<int> startSurah = GeneratedColumn<int>(
    'start_surah',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startVerseMeta = const VerificationMeta(
    'startVerse',
  );
  @override
  late final GeneratedColumn<int> startVerse = GeneratedColumn<int>(
    'start_verse',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endSurahMeta = const VerificationMeta(
    'endSurah',
  );
  @override
  late final GeneratedColumn<int> endSurah = GeneratedColumn<int>(
    'end_surah',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endVerseMeta = const VerificationMeta(
    'endVerse',
  );
  @override
  late final GeneratedColumn<int> endVerse = GeneratedColumn<int>(
    'end_verse',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    juzuNumber,
    arabicName,
    startSurah,
    startVerse,
    endSurah,
    endVerse,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'juzu';
  @override
  VerificationContext validateIntegrity(
    Insertable<JuzuData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('juzu_number')) {
      context.handle(
        _juzuNumberMeta,
        juzuNumber.isAcceptableOrUnknown(data['juzu_number']!, _juzuNumberMeta),
      );
    }
    if (data.containsKey('arabic_name')) {
      context.handle(
        _arabicNameMeta,
        arabicName.isAcceptableOrUnknown(data['arabic_name']!, _arabicNameMeta),
      );
    } else if (isInserting) {
      context.missing(_arabicNameMeta);
    }
    if (data.containsKey('start_surah')) {
      context.handle(
        _startSurahMeta,
        startSurah.isAcceptableOrUnknown(data['start_surah']!, _startSurahMeta),
      );
    } else if (isInserting) {
      context.missing(_startSurahMeta);
    }
    if (data.containsKey('start_verse')) {
      context.handle(
        _startVerseMeta,
        startVerse.isAcceptableOrUnknown(data['start_verse']!, _startVerseMeta),
      );
    } else if (isInserting) {
      context.missing(_startVerseMeta);
    }
    if (data.containsKey('end_surah')) {
      context.handle(
        _endSurahMeta,
        endSurah.isAcceptableOrUnknown(data['end_surah']!, _endSurahMeta),
      );
    } else if (isInserting) {
      context.missing(_endSurahMeta);
    }
    if (data.containsKey('end_verse')) {
      context.handle(
        _endVerseMeta,
        endVerse.isAcceptableOrUnknown(data['end_verse']!, _endVerseMeta),
      );
    } else if (isInserting) {
      context.missing(_endVerseMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {juzuNumber};
  @override
  JuzuData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return JuzuData(
      juzuNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}juzu_number'],
      )!,
      arabicName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}arabic_name'],
      )!,
      startSurah: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}start_surah'],
      )!,
      startVerse: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}start_verse'],
      )!,
      endSurah: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}end_surah'],
      )!,
      endVerse: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}end_verse'],
      )!,
    );
  }

  @override
  $JuzuTable createAlias(String alias) {
    return $JuzuTable(attachedDatabase, alias);
  }
}

class JuzuData extends DataClass implements Insertable<JuzuData> {
  final int juzuNumber;
  final String arabicName;
  final int startSurah;
  final int startVerse;
  final int endSurah;
  final int endVerse;
  const JuzuData({
    required this.juzuNumber,
    required this.arabicName,
    required this.startSurah,
    required this.startVerse,
    required this.endSurah,
    required this.endVerse,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['juzu_number'] = Variable<int>(juzuNumber);
    map['arabic_name'] = Variable<String>(arabicName);
    map['start_surah'] = Variable<int>(startSurah);
    map['start_verse'] = Variable<int>(startVerse);
    map['end_surah'] = Variable<int>(endSurah);
    map['end_verse'] = Variable<int>(endVerse);
    return map;
  }

  JuzuCompanion toCompanion(bool nullToAbsent) {
    return JuzuCompanion(
      juzuNumber: Value(juzuNumber),
      arabicName: Value(arabicName),
      startSurah: Value(startSurah),
      startVerse: Value(startVerse),
      endSurah: Value(endSurah),
      endVerse: Value(endVerse),
    );
  }

  factory JuzuData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return JuzuData(
      juzuNumber: serializer.fromJson<int>(json['juzuNumber']),
      arabicName: serializer.fromJson<String>(json['arabicName']),
      startSurah: serializer.fromJson<int>(json['startSurah']),
      startVerse: serializer.fromJson<int>(json['startVerse']),
      endSurah: serializer.fromJson<int>(json['endSurah']),
      endVerse: serializer.fromJson<int>(json['endVerse']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'juzuNumber': serializer.toJson<int>(juzuNumber),
      'arabicName': serializer.toJson<String>(arabicName),
      'startSurah': serializer.toJson<int>(startSurah),
      'startVerse': serializer.toJson<int>(startVerse),
      'endSurah': serializer.toJson<int>(endSurah),
      'endVerse': serializer.toJson<int>(endVerse),
    };
  }

  JuzuData copyWith({
    int? juzuNumber,
    String? arabicName,
    int? startSurah,
    int? startVerse,
    int? endSurah,
    int? endVerse,
  }) => JuzuData(
    juzuNumber: juzuNumber ?? this.juzuNumber,
    arabicName: arabicName ?? this.arabicName,
    startSurah: startSurah ?? this.startSurah,
    startVerse: startVerse ?? this.startVerse,
    endSurah: endSurah ?? this.endSurah,
    endVerse: endVerse ?? this.endVerse,
  );
  JuzuData copyWithCompanion(JuzuCompanion data) {
    return JuzuData(
      juzuNumber: data.juzuNumber.present
          ? data.juzuNumber.value
          : this.juzuNumber,
      arabicName: data.arabicName.present
          ? data.arabicName.value
          : this.arabicName,
      startSurah: data.startSurah.present
          ? data.startSurah.value
          : this.startSurah,
      startVerse: data.startVerse.present
          ? data.startVerse.value
          : this.startVerse,
      endSurah: data.endSurah.present ? data.endSurah.value : this.endSurah,
      endVerse: data.endVerse.present ? data.endVerse.value : this.endVerse,
    );
  }

  @override
  String toString() {
    return (StringBuffer('JuzuData(')
          ..write('juzuNumber: $juzuNumber, ')
          ..write('arabicName: $arabicName, ')
          ..write('startSurah: $startSurah, ')
          ..write('startVerse: $startVerse, ')
          ..write('endSurah: $endSurah, ')
          ..write('endVerse: $endVerse')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    juzuNumber,
    arabicName,
    startSurah,
    startVerse,
    endSurah,
    endVerse,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is JuzuData &&
          other.juzuNumber == this.juzuNumber &&
          other.arabicName == this.arabicName &&
          other.startSurah == this.startSurah &&
          other.startVerse == this.startVerse &&
          other.endSurah == this.endSurah &&
          other.endVerse == this.endVerse);
}

class JuzuCompanion extends UpdateCompanion<JuzuData> {
  final Value<int> juzuNumber;
  final Value<String> arabicName;
  final Value<int> startSurah;
  final Value<int> startVerse;
  final Value<int> endSurah;
  final Value<int> endVerse;
  const JuzuCompanion({
    this.juzuNumber = const Value.absent(),
    this.arabicName = const Value.absent(),
    this.startSurah = const Value.absent(),
    this.startVerse = const Value.absent(),
    this.endSurah = const Value.absent(),
    this.endVerse = const Value.absent(),
  });
  JuzuCompanion.insert({
    this.juzuNumber = const Value.absent(),
    required String arabicName,
    required int startSurah,
    required int startVerse,
    required int endSurah,
    required int endVerse,
  }) : arabicName = Value(arabicName),
       startSurah = Value(startSurah),
       startVerse = Value(startVerse),
       endSurah = Value(endSurah),
       endVerse = Value(endVerse);
  static Insertable<JuzuData> custom({
    Expression<int>? juzuNumber,
    Expression<String>? arabicName,
    Expression<int>? startSurah,
    Expression<int>? startVerse,
    Expression<int>? endSurah,
    Expression<int>? endVerse,
  }) {
    return RawValuesInsertable({
      if (juzuNumber != null) 'juzu_number': juzuNumber,
      if (arabicName != null) 'arabic_name': arabicName,
      if (startSurah != null) 'start_surah': startSurah,
      if (startVerse != null) 'start_verse': startVerse,
      if (endSurah != null) 'end_surah': endSurah,
      if (endVerse != null) 'end_verse': endVerse,
    });
  }

  JuzuCompanion copyWith({
    Value<int>? juzuNumber,
    Value<String>? arabicName,
    Value<int>? startSurah,
    Value<int>? startVerse,
    Value<int>? endSurah,
    Value<int>? endVerse,
  }) {
    return JuzuCompanion(
      juzuNumber: juzuNumber ?? this.juzuNumber,
      arabicName: arabicName ?? this.arabicName,
      startSurah: startSurah ?? this.startSurah,
      startVerse: startVerse ?? this.startVerse,
      endSurah: endSurah ?? this.endSurah,
      endVerse: endVerse ?? this.endVerse,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (juzuNumber.present) {
      map['juzu_number'] = Variable<int>(juzuNumber.value);
    }
    if (arabicName.present) {
      map['arabic_name'] = Variable<String>(arabicName.value);
    }
    if (startSurah.present) {
      map['start_surah'] = Variable<int>(startSurah.value);
    }
    if (startVerse.present) {
      map['start_verse'] = Variable<int>(startVerse.value);
    }
    if (endSurah.present) {
      map['end_surah'] = Variable<int>(endSurah.value);
    }
    if (endVerse.present) {
      map['end_verse'] = Variable<int>(endVerse.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JuzuCompanion(')
          ..write('juzuNumber: $juzuNumber, ')
          ..write('arabicName: $arabicName, ')
          ..write('startSurah: $startSurah, ')
          ..write('startVerse: $startVerse, ')
          ..write('endSurah: $endSurah, ')
          ..write('endVerse: $endVerse')
          ..write(')'))
        .toString();
  }
}

class $RukuTable extends Ruku with TableInfo<$RukuTable, RukuData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RukuTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _rukuNumberMeta = const VerificationMeta(
    'rukuNumber',
  );
  @override
  late final GeneratedColumn<int> rukuNumber = GeneratedColumn<int>(
    'ruku_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _surahNumberMeta = const VerificationMeta(
    'surahNumber',
  );
  @override
  late final GeneratedColumn<int> surahNumber = GeneratedColumn<int>(
    'surah_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES surah (surah_number)',
    ),
  );
  static const VerificationMeta _surahNameArabicMeta = const VerificationMeta(
    'surahNameArabic',
  );
  @override
  late final GeneratedColumn<String> surahNameArabic = GeneratedColumn<String>(
    'surah_name_arabic',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _firstAyaMeta = const VerificationMeta(
    'firstAya',
  );
  @override
  late final GeneratedColumn<int> firstAya = GeneratedColumn<int>(
    'first_aya',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastAyaMeta = const VerificationMeta(
    'lastAya',
  );
  @override
  late final GeneratedColumn<int> lastAya = GeneratedColumn<int>(
    'last_aya',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sajdaAyaMeta = const VerificationMeta(
    'sajdaAya',
  );
  @override
  late final GeneratedColumn<int> sajdaAya = GeneratedColumn<int>(
    'sajda_aya',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    rukuNumber,
    surahNumber,
    surahNameArabic,
    firstAya,
    lastAya,
    sajdaAya,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ruku';
  @override
  VerificationContext validateIntegrity(
    Insertable<RukuData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('ruku_number')) {
      context.handle(
        _rukuNumberMeta,
        rukuNumber.isAcceptableOrUnknown(data['ruku_number']!, _rukuNumberMeta),
      );
    }
    if (data.containsKey('surah_number')) {
      context.handle(
        _surahNumberMeta,
        surahNumber.isAcceptableOrUnknown(
          data['surah_number']!,
          _surahNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_surahNumberMeta);
    }
    if (data.containsKey('surah_name_arabic')) {
      context.handle(
        _surahNameArabicMeta,
        surahNameArabic.isAcceptableOrUnknown(
          data['surah_name_arabic']!,
          _surahNameArabicMeta,
        ),
      );
    }
    if (data.containsKey('first_aya')) {
      context.handle(
        _firstAyaMeta,
        firstAya.isAcceptableOrUnknown(data['first_aya']!, _firstAyaMeta),
      );
    } else if (isInserting) {
      context.missing(_firstAyaMeta);
    }
    if (data.containsKey('last_aya')) {
      context.handle(
        _lastAyaMeta,
        lastAya.isAcceptableOrUnknown(data['last_aya']!, _lastAyaMeta),
      );
    } else if (isInserting) {
      context.missing(_lastAyaMeta);
    }
    if (data.containsKey('sajda_aya')) {
      context.handle(
        _sajdaAyaMeta,
        sajdaAya.isAcceptableOrUnknown(data['sajda_aya']!, _sajdaAyaMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {rukuNumber};
  @override
  RukuData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RukuData(
      rukuNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ruku_number'],
      )!,
      surahNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}surah_number'],
      )!,
      surahNameArabic: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}surah_name_arabic'],
      ),
      firstAya: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}first_aya'],
      )!,
      lastAya: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}last_aya'],
      )!,
      sajdaAya: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sajda_aya'],
      )!,
    );
  }

  @override
  $RukuTable createAlias(String alias) {
    return $RukuTable(attachedDatabase, alias);
  }
}

class RukuData extends DataClass implements Insertable<RukuData> {
  final int rukuNumber;
  final int surahNumber;
  final String? surahNameArabic;
  final int firstAya;
  final int lastAya;
  final int sajdaAya;
  const RukuData({
    required this.rukuNumber,
    required this.surahNumber,
    this.surahNameArabic,
    required this.firstAya,
    required this.lastAya,
    required this.sajdaAya,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['ruku_number'] = Variable<int>(rukuNumber);
    map['surah_number'] = Variable<int>(surahNumber);
    if (!nullToAbsent || surahNameArabic != null) {
      map['surah_name_arabic'] = Variable<String>(surahNameArabic);
    }
    map['first_aya'] = Variable<int>(firstAya);
    map['last_aya'] = Variable<int>(lastAya);
    map['sajda_aya'] = Variable<int>(sajdaAya);
    return map;
  }

  RukuCompanion toCompanion(bool nullToAbsent) {
    return RukuCompanion(
      rukuNumber: Value(rukuNumber),
      surahNumber: Value(surahNumber),
      surahNameArabic: surahNameArabic == null && nullToAbsent
          ? const Value.absent()
          : Value(surahNameArabic),
      firstAya: Value(firstAya),
      lastAya: Value(lastAya),
      sajdaAya: Value(sajdaAya),
    );
  }

  factory RukuData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RukuData(
      rukuNumber: serializer.fromJson<int>(json['rukuNumber']),
      surahNumber: serializer.fromJson<int>(json['surahNumber']),
      surahNameArabic: serializer.fromJson<String?>(json['surahNameArabic']),
      firstAya: serializer.fromJson<int>(json['firstAya']),
      lastAya: serializer.fromJson<int>(json['lastAya']),
      sajdaAya: serializer.fromJson<int>(json['sajdaAya']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'rukuNumber': serializer.toJson<int>(rukuNumber),
      'surahNumber': serializer.toJson<int>(surahNumber),
      'surahNameArabic': serializer.toJson<String?>(surahNameArabic),
      'firstAya': serializer.toJson<int>(firstAya),
      'lastAya': serializer.toJson<int>(lastAya),
      'sajdaAya': serializer.toJson<int>(sajdaAya),
    };
  }

  RukuData copyWith({
    int? rukuNumber,
    int? surahNumber,
    Value<String?> surahNameArabic = const Value.absent(),
    int? firstAya,
    int? lastAya,
    int? sajdaAya,
  }) => RukuData(
    rukuNumber: rukuNumber ?? this.rukuNumber,
    surahNumber: surahNumber ?? this.surahNumber,
    surahNameArabic: surahNameArabic.present
        ? surahNameArabic.value
        : this.surahNameArabic,
    firstAya: firstAya ?? this.firstAya,
    lastAya: lastAya ?? this.lastAya,
    sajdaAya: sajdaAya ?? this.sajdaAya,
  );
  RukuData copyWithCompanion(RukuCompanion data) {
    return RukuData(
      rukuNumber: data.rukuNumber.present
          ? data.rukuNumber.value
          : this.rukuNumber,
      surahNumber: data.surahNumber.present
          ? data.surahNumber.value
          : this.surahNumber,
      surahNameArabic: data.surahNameArabic.present
          ? data.surahNameArabic.value
          : this.surahNameArabic,
      firstAya: data.firstAya.present ? data.firstAya.value : this.firstAya,
      lastAya: data.lastAya.present ? data.lastAya.value : this.lastAya,
      sajdaAya: data.sajdaAya.present ? data.sajdaAya.value : this.sajdaAya,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RukuData(')
          ..write('rukuNumber: $rukuNumber, ')
          ..write('surahNumber: $surahNumber, ')
          ..write('surahNameArabic: $surahNameArabic, ')
          ..write('firstAya: $firstAya, ')
          ..write('lastAya: $lastAya, ')
          ..write('sajdaAya: $sajdaAya')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    rukuNumber,
    surahNumber,
    surahNameArabic,
    firstAya,
    lastAya,
    sajdaAya,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RukuData &&
          other.rukuNumber == this.rukuNumber &&
          other.surahNumber == this.surahNumber &&
          other.surahNameArabic == this.surahNameArabic &&
          other.firstAya == this.firstAya &&
          other.lastAya == this.lastAya &&
          other.sajdaAya == this.sajdaAya);
}

class RukuCompanion extends UpdateCompanion<RukuData> {
  final Value<int> rukuNumber;
  final Value<int> surahNumber;
  final Value<String?> surahNameArabic;
  final Value<int> firstAya;
  final Value<int> lastAya;
  final Value<int> sajdaAya;
  const RukuCompanion({
    this.rukuNumber = const Value.absent(),
    this.surahNumber = const Value.absent(),
    this.surahNameArabic = const Value.absent(),
    this.firstAya = const Value.absent(),
    this.lastAya = const Value.absent(),
    this.sajdaAya = const Value.absent(),
  });
  RukuCompanion.insert({
    this.rukuNumber = const Value.absent(),
    required int surahNumber,
    this.surahNameArabic = const Value.absent(),
    required int firstAya,
    required int lastAya,
    this.sajdaAya = const Value.absent(),
  }) : surahNumber = Value(surahNumber),
       firstAya = Value(firstAya),
       lastAya = Value(lastAya);
  static Insertable<RukuData> custom({
    Expression<int>? rukuNumber,
    Expression<int>? surahNumber,
    Expression<String>? surahNameArabic,
    Expression<int>? firstAya,
    Expression<int>? lastAya,
    Expression<int>? sajdaAya,
  }) {
    return RawValuesInsertable({
      if (rukuNumber != null) 'ruku_number': rukuNumber,
      if (surahNumber != null) 'surah_number': surahNumber,
      if (surahNameArabic != null) 'surah_name_arabic': surahNameArabic,
      if (firstAya != null) 'first_aya': firstAya,
      if (lastAya != null) 'last_aya': lastAya,
      if (sajdaAya != null) 'sajda_aya': sajdaAya,
    });
  }

  RukuCompanion copyWith({
    Value<int>? rukuNumber,
    Value<int>? surahNumber,
    Value<String?>? surahNameArabic,
    Value<int>? firstAya,
    Value<int>? lastAya,
    Value<int>? sajdaAya,
  }) {
    return RukuCompanion(
      rukuNumber: rukuNumber ?? this.rukuNumber,
      surahNumber: surahNumber ?? this.surahNumber,
      surahNameArabic: surahNameArabic ?? this.surahNameArabic,
      firstAya: firstAya ?? this.firstAya,
      lastAya: lastAya ?? this.lastAya,
      sajdaAya: sajdaAya ?? this.sajdaAya,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (rukuNumber.present) {
      map['ruku_number'] = Variable<int>(rukuNumber.value);
    }
    if (surahNumber.present) {
      map['surah_number'] = Variable<int>(surahNumber.value);
    }
    if (surahNameArabic.present) {
      map['surah_name_arabic'] = Variable<String>(surahNameArabic.value);
    }
    if (firstAya.present) {
      map['first_aya'] = Variable<int>(firstAya.value);
    }
    if (lastAya.present) {
      map['last_aya'] = Variable<int>(lastAya.value);
    }
    if (sajdaAya.present) {
      map['sajda_aya'] = Variable<int>(sajdaAya.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RukuCompanion(')
          ..write('rukuNumber: $rukuNumber, ')
          ..write('surahNumber: $surahNumber, ')
          ..write('surahNameArabic: $surahNameArabic, ')
          ..write('firstAya: $firstAya, ')
          ..write('lastAya: $lastAya, ')
          ..write('sajdaAya: $sajdaAya')
          ..write(')'))
        .toString();
  }
}

class $PageTable extends Page with TableInfo<$PageTable, PageData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PageTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _pageNumberMeta = const VerificationMeta(
    'pageNumber',
  );
  @override
  late final GeneratedColumn<int> pageNumber = GeneratedColumn<int>(
    'page_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _juzuNumberMeta = const VerificationMeta(
    'juzuNumber',
  );
  @override
  late final GeneratedColumn<int> juzuNumber = GeneratedColumn<int>(
    'juzu_number',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _firstVerseKeyMeta = const VerificationMeta(
    'firstVerseKey',
  );
  @override
  late final GeneratedColumn<String> firstVerseKey = GeneratedColumn<String>(
    'first_verse_key',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _verseCountMeta = const VerificationMeta(
    'verseCount',
  );
  @override
  late final GeneratedColumn<int> verseCount = GeneratedColumn<int>(
    'verse_count',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    pageNumber,
    juzuNumber,
    firstVerseKey,
    verseCount,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'page';
  @override
  VerificationContext validateIntegrity(
    Insertable<PageData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('page_number')) {
      context.handle(
        _pageNumberMeta,
        pageNumber.isAcceptableOrUnknown(data['page_number']!, _pageNumberMeta),
      );
    }
    if (data.containsKey('juzu_number')) {
      context.handle(
        _juzuNumberMeta,
        juzuNumber.isAcceptableOrUnknown(data['juzu_number']!, _juzuNumberMeta),
      );
    }
    if (data.containsKey('first_verse_key')) {
      context.handle(
        _firstVerseKeyMeta,
        firstVerseKey.isAcceptableOrUnknown(
          data['first_verse_key']!,
          _firstVerseKeyMeta,
        ),
      );
    }
    if (data.containsKey('verse_count')) {
      context.handle(
        _verseCountMeta,
        verseCount.isAcceptableOrUnknown(data['verse_count']!, _verseCountMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {pageNumber};
  @override
  PageData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PageData(
      pageNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}page_number'],
      )!,
      juzuNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}juzu_number'],
      ),
      firstVerseKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}first_verse_key'],
      ),
      verseCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}verse_count'],
      ),
    );
  }

  @override
  $PageTable createAlias(String alias) {
    return $PageTable(attachedDatabase, alias);
  }
}

class PageData extends DataClass implements Insertable<PageData> {
  final int pageNumber;
  final int? juzuNumber;
  final String? firstVerseKey;
  final int? verseCount;
  const PageData({
    required this.pageNumber,
    this.juzuNumber,
    this.firstVerseKey,
    this.verseCount,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['page_number'] = Variable<int>(pageNumber);
    if (!nullToAbsent || juzuNumber != null) {
      map['juzu_number'] = Variable<int>(juzuNumber);
    }
    if (!nullToAbsent || firstVerseKey != null) {
      map['first_verse_key'] = Variable<String>(firstVerseKey);
    }
    if (!nullToAbsent || verseCount != null) {
      map['verse_count'] = Variable<int>(verseCount);
    }
    return map;
  }

  PageCompanion toCompanion(bool nullToAbsent) {
    return PageCompanion(
      pageNumber: Value(pageNumber),
      juzuNumber: juzuNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(juzuNumber),
      firstVerseKey: firstVerseKey == null && nullToAbsent
          ? const Value.absent()
          : Value(firstVerseKey),
      verseCount: verseCount == null && nullToAbsent
          ? const Value.absent()
          : Value(verseCount),
    );
  }

  factory PageData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PageData(
      pageNumber: serializer.fromJson<int>(json['pageNumber']),
      juzuNumber: serializer.fromJson<int?>(json['juzuNumber']),
      firstVerseKey: serializer.fromJson<String?>(json['firstVerseKey']),
      verseCount: serializer.fromJson<int?>(json['verseCount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'pageNumber': serializer.toJson<int>(pageNumber),
      'juzuNumber': serializer.toJson<int?>(juzuNumber),
      'firstVerseKey': serializer.toJson<String?>(firstVerseKey),
      'verseCount': serializer.toJson<int?>(verseCount),
    };
  }

  PageData copyWith({
    int? pageNumber,
    Value<int?> juzuNumber = const Value.absent(),
    Value<String?> firstVerseKey = const Value.absent(),
    Value<int?> verseCount = const Value.absent(),
  }) => PageData(
    pageNumber: pageNumber ?? this.pageNumber,
    juzuNumber: juzuNumber.present ? juzuNumber.value : this.juzuNumber,
    firstVerseKey: firstVerseKey.present
        ? firstVerseKey.value
        : this.firstVerseKey,
    verseCount: verseCount.present ? verseCount.value : this.verseCount,
  );
  PageData copyWithCompanion(PageCompanion data) {
    return PageData(
      pageNumber: data.pageNumber.present
          ? data.pageNumber.value
          : this.pageNumber,
      juzuNumber: data.juzuNumber.present
          ? data.juzuNumber.value
          : this.juzuNumber,
      firstVerseKey: data.firstVerseKey.present
          ? data.firstVerseKey.value
          : this.firstVerseKey,
      verseCount: data.verseCount.present
          ? data.verseCount.value
          : this.verseCount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PageData(')
          ..write('pageNumber: $pageNumber, ')
          ..write('juzuNumber: $juzuNumber, ')
          ..write('firstVerseKey: $firstVerseKey, ')
          ..write('verseCount: $verseCount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(pageNumber, juzuNumber, firstVerseKey, verseCount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PageData &&
          other.pageNumber == this.pageNumber &&
          other.juzuNumber == this.juzuNumber &&
          other.firstVerseKey == this.firstVerseKey &&
          other.verseCount == this.verseCount);
}

class PageCompanion extends UpdateCompanion<PageData> {
  final Value<int> pageNumber;
  final Value<int?> juzuNumber;
  final Value<String?> firstVerseKey;
  final Value<int?> verseCount;
  const PageCompanion({
    this.pageNumber = const Value.absent(),
    this.juzuNumber = const Value.absent(),
    this.firstVerseKey = const Value.absent(),
    this.verseCount = const Value.absent(),
  });
  PageCompanion.insert({
    this.pageNumber = const Value.absent(),
    this.juzuNumber = const Value.absent(),
    this.firstVerseKey = const Value.absent(),
    this.verseCount = const Value.absent(),
  });
  static Insertable<PageData> custom({
    Expression<int>? pageNumber,
    Expression<int>? juzuNumber,
    Expression<String>? firstVerseKey,
    Expression<int>? verseCount,
  }) {
    return RawValuesInsertable({
      if (pageNumber != null) 'page_number': pageNumber,
      if (juzuNumber != null) 'juzu_number': juzuNumber,
      if (firstVerseKey != null) 'first_verse_key': firstVerseKey,
      if (verseCount != null) 'verse_count': verseCount,
    });
  }

  PageCompanion copyWith({
    Value<int>? pageNumber,
    Value<int?>? juzuNumber,
    Value<String?>? firstVerseKey,
    Value<int?>? verseCount,
  }) {
    return PageCompanion(
      pageNumber: pageNumber ?? this.pageNumber,
      juzuNumber: juzuNumber ?? this.juzuNumber,
      firstVerseKey: firstVerseKey ?? this.firstVerseKey,
      verseCount: verseCount ?? this.verseCount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (pageNumber.present) {
      map['page_number'] = Variable<int>(pageNumber.value);
    }
    if (juzuNumber.present) {
      map['juzu_number'] = Variable<int>(juzuNumber.value);
    }
    if (firstVerseKey.present) {
      map['first_verse_key'] = Variable<String>(firstVerseKey.value);
    }
    if (verseCount.present) {
      map['verse_count'] = Variable<int>(verseCount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PageCompanion(')
          ..write('pageNumber: $pageNumber, ')
          ..write('juzuNumber: $juzuNumber, ')
          ..write('firstVerseKey: $firstVerseKey, ')
          ..write('verseCount: $verseCount')
          ..write(')'))
        .toString();
  }
}

class $AyahTable extends Ayah with TableInfo<$AyahTable, AyahData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AyahTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _surahNumberMeta = const VerificationMeta(
    'surahNumber',
  );
  @override
  late final GeneratedColumn<int> surahNumber = GeneratedColumn<int>(
    'surah_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES surah (surah_number)',
    ),
  );
  static const VerificationMeta _verseNumberMeta = const VerificationMeta(
    'verseNumber',
  );
  @override
  late final GeneratedColumn<int> verseNumber = GeneratedColumn<int>(
    'verse_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _verseKeyMeta = const VerificationMeta(
    'verseKey',
  );
  @override
  late final GeneratedColumn<String> verseKey = GeneratedColumn<String>(
    'verse_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _arabicMeta = const VerificationMeta('arabic');
  @override
  late final GeneratedColumn<String> arabic = GeneratedColumn<String>(
    'arabic',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pageNumberMeta = const VerificationMeta(
    'pageNumber',
  );
  @override
  late final GeneratedColumn<int> pageNumber = GeneratedColumn<int>(
    'page_number',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _rukuNumberMeta = const VerificationMeta(
    'rukuNumber',
  );
  @override
  late final GeneratedColumn<int> rukuNumber = GeneratedColumn<int>(
    'ruku_number',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES ruku (ruku_number)',
    ),
  );
  static const VerificationMeta _juzuNumberMeta = const VerificationMeta(
    'juzuNumber',
  );
  @override
  late final GeneratedColumn<int> juzuNumber = GeneratedColumn<int>(
    'juzu_number',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES juzu (juzu_number)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    surahNumber,
    verseNumber,
    verseKey,
    arabic,
    pageNumber,
    rukuNumber,
    juzuNumber,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ayah';
  @override
  VerificationContext validateIntegrity(
    Insertable<AyahData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('surah_number')) {
      context.handle(
        _surahNumberMeta,
        surahNumber.isAcceptableOrUnknown(
          data['surah_number']!,
          _surahNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_surahNumberMeta);
    }
    if (data.containsKey('verse_number')) {
      context.handle(
        _verseNumberMeta,
        verseNumber.isAcceptableOrUnknown(
          data['verse_number']!,
          _verseNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_verseNumberMeta);
    }
    if (data.containsKey('verse_key')) {
      context.handle(
        _verseKeyMeta,
        verseKey.isAcceptableOrUnknown(data['verse_key']!, _verseKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_verseKeyMeta);
    }
    if (data.containsKey('arabic')) {
      context.handle(
        _arabicMeta,
        arabic.isAcceptableOrUnknown(data['arabic']!, _arabicMeta),
      );
    } else if (isInserting) {
      context.missing(_arabicMeta);
    }
    if (data.containsKey('page_number')) {
      context.handle(
        _pageNumberMeta,
        pageNumber.isAcceptableOrUnknown(data['page_number']!, _pageNumberMeta),
      );
    }
    if (data.containsKey('ruku_number')) {
      context.handle(
        _rukuNumberMeta,
        rukuNumber.isAcceptableOrUnknown(data['ruku_number']!, _rukuNumberMeta),
      );
    }
    if (data.containsKey('juzu_number')) {
      context.handle(
        _juzuNumberMeta,
        juzuNumber.isAcceptableOrUnknown(data['juzu_number']!, _juzuNumberMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AyahData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AyahData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      surahNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}surah_number'],
      )!,
      verseNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}verse_number'],
      )!,
      verseKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}verse_key'],
      )!,
      arabic: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}arabic'],
      )!,
      pageNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}page_number'],
      ),
      rukuNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ruku_number'],
      ),
      juzuNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}juzu_number'],
      ),
    );
  }

  @override
  $AyahTable createAlias(String alias) {
    return $AyahTable(attachedDatabase, alias);
  }
}

class AyahData extends DataClass implements Insertable<AyahData> {
  final int id;
  final int surahNumber;
  final int verseNumber;
  final String verseKey;
  final String arabic;
  final int? pageNumber;
  final int? rukuNumber;
  final int? juzuNumber;
  const AyahData({
    required this.id,
    required this.surahNumber,
    required this.verseNumber,
    required this.verseKey,
    required this.arabic,
    this.pageNumber,
    this.rukuNumber,
    this.juzuNumber,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['surah_number'] = Variable<int>(surahNumber);
    map['verse_number'] = Variable<int>(verseNumber);
    map['verse_key'] = Variable<String>(verseKey);
    map['arabic'] = Variable<String>(arabic);
    if (!nullToAbsent || pageNumber != null) {
      map['page_number'] = Variable<int>(pageNumber);
    }
    if (!nullToAbsent || rukuNumber != null) {
      map['ruku_number'] = Variable<int>(rukuNumber);
    }
    if (!nullToAbsent || juzuNumber != null) {
      map['juzu_number'] = Variable<int>(juzuNumber);
    }
    return map;
  }

  AyahCompanion toCompanion(bool nullToAbsent) {
    return AyahCompanion(
      id: Value(id),
      surahNumber: Value(surahNumber),
      verseNumber: Value(verseNumber),
      verseKey: Value(verseKey),
      arabic: Value(arabic),
      pageNumber: pageNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(pageNumber),
      rukuNumber: rukuNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(rukuNumber),
      juzuNumber: juzuNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(juzuNumber),
    );
  }

  factory AyahData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AyahData(
      id: serializer.fromJson<int>(json['id']),
      surahNumber: serializer.fromJson<int>(json['surahNumber']),
      verseNumber: serializer.fromJson<int>(json['verseNumber']),
      verseKey: serializer.fromJson<String>(json['verseKey']),
      arabic: serializer.fromJson<String>(json['arabic']),
      pageNumber: serializer.fromJson<int?>(json['pageNumber']),
      rukuNumber: serializer.fromJson<int?>(json['rukuNumber']),
      juzuNumber: serializer.fromJson<int?>(json['juzuNumber']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'surahNumber': serializer.toJson<int>(surahNumber),
      'verseNumber': serializer.toJson<int>(verseNumber),
      'verseKey': serializer.toJson<String>(verseKey),
      'arabic': serializer.toJson<String>(arabic),
      'pageNumber': serializer.toJson<int?>(pageNumber),
      'rukuNumber': serializer.toJson<int?>(rukuNumber),
      'juzuNumber': serializer.toJson<int?>(juzuNumber),
    };
  }

  AyahData copyWith({
    int? id,
    int? surahNumber,
    int? verseNumber,
    String? verseKey,
    String? arabic,
    Value<int?> pageNumber = const Value.absent(),
    Value<int?> rukuNumber = const Value.absent(),
    Value<int?> juzuNumber = const Value.absent(),
  }) => AyahData(
    id: id ?? this.id,
    surahNumber: surahNumber ?? this.surahNumber,
    verseNumber: verseNumber ?? this.verseNumber,
    verseKey: verseKey ?? this.verseKey,
    arabic: arabic ?? this.arabic,
    pageNumber: pageNumber.present ? pageNumber.value : this.pageNumber,
    rukuNumber: rukuNumber.present ? rukuNumber.value : this.rukuNumber,
    juzuNumber: juzuNumber.present ? juzuNumber.value : this.juzuNumber,
  );
  AyahData copyWithCompanion(AyahCompanion data) {
    return AyahData(
      id: data.id.present ? data.id.value : this.id,
      surahNumber: data.surahNumber.present
          ? data.surahNumber.value
          : this.surahNumber,
      verseNumber: data.verseNumber.present
          ? data.verseNumber.value
          : this.verseNumber,
      verseKey: data.verseKey.present ? data.verseKey.value : this.verseKey,
      arabic: data.arabic.present ? data.arabic.value : this.arabic,
      pageNumber: data.pageNumber.present
          ? data.pageNumber.value
          : this.pageNumber,
      rukuNumber: data.rukuNumber.present
          ? data.rukuNumber.value
          : this.rukuNumber,
      juzuNumber: data.juzuNumber.present
          ? data.juzuNumber.value
          : this.juzuNumber,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AyahData(')
          ..write('id: $id, ')
          ..write('surahNumber: $surahNumber, ')
          ..write('verseNumber: $verseNumber, ')
          ..write('verseKey: $verseKey, ')
          ..write('arabic: $arabic, ')
          ..write('pageNumber: $pageNumber, ')
          ..write('rukuNumber: $rukuNumber, ')
          ..write('juzuNumber: $juzuNumber')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    surahNumber,
    verseNumber,
    verseKey,
    arabic,
    pageNumber,
    rukuNumber,
    juzuNumber,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AyahData &&
          other.id == this.id &&
          other.surahNumber == this.surahNumber &&
          other.verseNumber == this.verseNumber &&
          other.verseKey == this.verseKey &&
          other.arabic == this.arabic &&
          other.pageNumber == this.pageNumber &&
          other.rukuNumber == this.rukuNumber &&
          other.juzuNumber == this.juzuNumber);
}

class AyahCompanion extends UpdateCompanion<AyahData> {
  final Value<int> id;
  final Value<int> surahNumber;
  final Value<int> verseNumber;
  final Value<String> verseKey;
  final Value<String> arabic;
  final Value<int?> pageNumber;
  final Value<int?> rukuNumber;
  final Value<int?> juzuNumber;
  const AyahCompanion({
    this.id = const Value.absent(),
    this.surahNumber = const Value.absent(),
    this.verseNumber = const Value.absent(),
    this.verseKey = const Value.absent(),
    this.arabic = const Value.absent(),
    this.pageNumber = const Value.absent(),
    this.rukuNumber = const Value.absent(),
    this.juzuNumber = const Value.absent(),
  });
  AyahCompanion.insert({
    this.id = const Value.absent(),
    required int surahNumber,
    required int verseNumber,
    required String verseKey,
    required String arabic,
    this.pageNumber = const Value.absent(),
    this.rukuNumber = const Value.absent(),
    this.juzuNumber = const Value.absent(),
  }) : surahNumber = Value(surahNumber),
       verseNumber = Value(verseNumber),
       verseKey = Value(verseKey),
       arabic = Value(arabic);
  static Insertable<AyahData> custom({
    Expression<int>? id,
    Expression<int>? surahNumber,
    Expression<int>? verseNumber,
    Expression<String>? verseKey,
    Expression<String>? arabic,
    Expression<int>? pageNumber,
    Expression<int>? rukuNumber,
    Expression<int>? juzuNumber,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (surahNumber != null) 'surah_number': surahNumber,
      if (verseNumber != null) 'verse_number': verseNumber,
      if (verseKey != null) 'verse_key': verseKey,
      if (arabic != null) 'arabic': arabic,
      if (pageNumber != null) 'page_number': pageNumber,
      if (rukuNumber != null) 'ruku_number': rukuNumber,
      if (juzuNumber != null) 'juzu_number': juzuNumber,
    });
  }

  AyahCompanion copyWith({
    Value<int>? id,
    Value<int>? surahNumber,
    Value<int>? verseNumber,
    Value<String>? verseKey,
    Value<String>? arabic,
    Value<int?>? pageNumber,
    Value<int?>? rukuNumber,
    Value<int?>? juzuNumber,
  }) {
    return AyahCompanion(
      id: id ?? this.id,
      surahNumber: surahNumber ?? this.surahNumber,
      verseNumber: verseNumber ?? this.verseNumber,
      verseKey: verseKey ?? this.verseKey,
      arabic: arabic ?? this.arabic,
      pageNumber: pageNumber ?? this.pageNumber,
      rukuNumber: rukuNumber ?? this.rukuNumber,
      juzuNumber: juzuNumber ?? this.juzuNumber,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (surahNumber.present) {
      map['surah_number'] = Variable<int>(surahNumber.value);
    }
    if (verseNumber.present) {
      map['verse_number'] = Variable<int>(verseNumber.value);
    }
    if (verseKey.present) {
      map['verse_key'] = Variable<String>(verseKey.value);
    }
    if (arabic.present) {
      map['arabic'] = Variable<String>(arabic.value);
    }
    if (pageNumber.present) {
      map['page_number'] = Variable<int>(pageNumber.value);
    }
    if (rukuNumber.present) {
      map['ruku_number'] = Variable<int>(rukuNumber.value);
    }
    if (juzuNumber.present) {
      map['juzu_number'] = Variable<int>(juzuNumber.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AyahCompanion(')
          ..write('id: $id, ')
          ..write('surahNumber: $surahNumber, ')
          ..write('verseNumber: $verseNumber, ')
          ..write('verseKey: $verseKey, ')
          ..write('arabic: $arabic, ')
          ..write('pageNumber: $pageNumber, ')
          ..write('rukuNumber: $rukuNumber, ')
          ..write('juzuNumber: $juzuNumber')
          ..write(')'))
        .toString();
  }
}

class $JapaneseTable extends Japanese
    with TableInfo<$JapaneseTable, JapaneseData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $JapaneseTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _surahNumberMeta = const VerificationMeta(
    'surahNumber',
  );
  @override
  late final GeneratedColumn<int> surahNumber = GeneratedColumn<int>(
    'surah_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _verseNumberMeta = const VerificationMeta(
    'verseNumber',
  );
  @override
  late final GeneratedColumn<int> verseNumber = GeneratedColumn<int>(
    'verse_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _verseKeyMeta = const VerificationMeta(
    'verseKey',
  );
  @override
  late final GeneratedColumn<String> verseKey = GeneratedColumn<String>(
    'verse_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _textPlainMeta = const VerificationMeta(
    'textPlain',
  );
  @override
  late final GeneratedColumn<String> textPlain = GeneratedColumn<String>(
    'text_plain',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _textWithFuriganaMeta = const VerificationMeta(
    'textWithFurigana',
  );
  @override
  late final GeneratedColumn<String> textWithFurigana = GeneratedColumn<String>(
    'text_with_furigana',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    surahNumber,
    verseNumber,
    verseKey,
    textPlain,
    textWithFurigana,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'japanese';
  @override
  VerificationContext validateIntegrity(
    Insertable<JapaneseData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('surah_number')) {
      context.handle(
        _surahNumberMeta,
        surahNumber.isAcceptableOrUnknown(
          data['surah_number']!,
          _surahNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_surahNumberMeta);
    }
    if (data.containsKey('verse_number')) {
      context.handle(
        _verseNumberMeta,
        verseNumber.isAcceptableOrUnknown(
          data['verse_number']!,
          _verseNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_verseNumberMeta);
    }
    if (data.containsKey('verse_key')) {
      context.handle(
        _verseKeyMeta,
        verseKey.isAcceptableOrUnknown(data['verse_key']!, _verseKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_verseKeyMeta);
    }
    if (data.containsKey('text_plain')) {
      context.handle(
        _textPlainMeta,
        textPlain.isAcceptableOrUnknown(data['text_plain']!, _textPlainMeta),
      );
    }
    if (data.containsKey('text_with_furigana')) {
      context.handle(
        _textWithFuriganaMeta,
        textWithFurigana.isAcceptableOrUnknown(
          data['text_with_furigana']!,
          _textWithFuriganaMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  JapaneseData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return JapaneseData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      surahNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}surah_number'],
      )!,
      verseNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}verse_number'],
      )!,
      verseKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}verse_key'],
      )!,
      textPlain: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}text_plain'],
      ),
      textWithFurigana: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}text_with_furigana'],
      ),
    );
  }

  @override
  $JapaneseTable createAlias(String alias) {
    return $JapaneseTable(attachedDatabase, alias);
  }
}

class JapaneseData extends DataClass implements Insertable<JapaneseData> {
  final int id;
  final int surahNumber;
  final int verseNumber;
  final String verseKey;
  final String? textPlain;
  final String? textWithFurigana;
  const JapaneseData({
    required this.id,
    required this.surahNumber,
    required this.verseNumber,
    required this.verseKey,
    this.textPlain,
    this.textWithFurigana,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['surah_number'] = Variable<int>(surahNumber);
    map['verse_number'] = Variable<int>(verseNumber);
    map['verse_key'] = Variable<String>(verseKey);
    if (!nullToAbsent || textPlain != null) {
      map['text_plain'] = Variable<String>(textPlain);
    }
    if (!nullToAbsent || textWithFurigana != null) {
      map['text_with_furigana'] = Variable<String>(textWithFurigana);
    }
    return map;
  }

  JapaneseCompanion toCompanion(bool nullToAbsent) {
    return JapaneseCompanion(
      id: Value(id),
      surahNumber: Value(surahNumber),
      verseNumber: Value(verseNumber),
      verseKey: Value(verseKey),
      textPlain: textPlain == null && nullToAbsent
          ? const Value.absent()
          : Value(textPlain),
      textWithFurigana: textWithFurigana == null && nullToAbsent
          ? const Value.absent()
          : Value(textWithFurigana),
    );
  }

  factory JapaneseData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return JapaneseData(
      id: serializer.fromJson<int>(json['id']),
      surahNumber: serializer.fromJson<int>(json['surahNumber']),
      verseNumber: serializer.fromJson<int>(json['verseNumber']),
      verseKey: serializer.fromJson<String>(json['verseKey']),
      textPlain: serializer.fromJson<String?>(json['textPlain']),
      textWithFurigana: serializer.fromJson<String?>(json['textWithFurigana']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'surahNumber': serializer.toJson<int>(surahNumber),
      'verseNumber': serializer.toJson<int>(verseNumber),
      'verseKey': serializer.toJson<String>(verseKey),
      'textPlain': serializer.toJson<String?>(textPlain),
      'textWithFurigana': serializer.toJson<String?>(textWithFurigana),
    };
  }

  JapaneseData copyWith({
    int? id,
    int? surahNumber,
    int? verseNumber,
    String? verseKey,
    Value<String?> textPlain = const Value.absent(),
    Value<String?> textWithFurigana = const Value.absent(),
  }) => JapaneseData(
    id: id ?? this.id,
    surahNumber: surahNumber ?? this.surahNumber,
    verseNumber: verseNumber ?? this.verseNumber,
    verseKey: verseKey ?? this.verseKey,
    textPlain: textPlain.present ? textPlain.value : this.textPlain,
    textWithFurigana: textWithFurigana.present
        ? textWithFurigana.value
        : this.textWithFurigana,
  );
  JapaneseData copyWithCompanion(JapaneseCompanion data) {
    return JapaneseData(
      id: data.id.present ? data.id.value : this.id,
      surahNumber: data.surahNumber.present
          ? data.surahNumber.value
          : this.surahNumber,
      verseNumber: data.verseNumber.present
          ? data.verseNumber.value
          : this.verseNumber,
      verseKey: data.verseKey.present ? data.verseKey.value : this.verseKey,
      textPlain: data.textPlain.present ? data.textPlain.value : this.textPlain,
      textWithFurigana: data.textWithFurigana.present
          ? data.textWithFurigana.value
          : this.textWithFurigana,
    );
  }

  @override
  String toString() {
    return (StringBuffer('JapaneseData(')
          ..write('id: $id, ')
          ..write('surahNumber: $surahNumber, ')
          ..write('verseNumber: $verseNumber, ')
          ..write('verseKey: $verseKey, ')
          ..write('textPlain: $textPlain, ')
          ..write('textWithFurigana: $textWithFurigana')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    surahNumber,
    verseNumber,
    verseKey,
    textPlain,
    textWithFurigana,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is JapaneseData &&
          other.id == this.id &&
          other.surahNumber == this.surahNumber &&
          other.verseNumber == this.verseNumber &&
          other.verseKey == this.verseKey &&
          other.textPlain == this.textPlain &&
          other.textWithFurigana == this.textWithFurigana);
}

class JapaneseCompanion extends UpdateCompanion<JapaneseData> {
  final Value<int> id;
  final Value<int> surahNumber;
  final Value<int> verseNumber;
  final Value<String> verseKey;
  final Value<String?> textPlain;
  final Value<String?> textWithFurigana;
  const JapaneseCompanion({
    this.id = const Value.absent(),
    this.surahNumber = const Value.absent(),
    this.verseNumber = const Value.absent(),
    this.verseKey = const Value.absent(),
    this.textPlain = const Value.absent(),
    this.textWithFurigana = const Value.absent(),
  });
  JapaneseCompanion.insert({
    this.id = const Value.absent(),
    required int surahNumber,
    required int verseNumber,
    required String verseKey,
    this.textPlain = const Value.absent(),
    this.textWithFurigana = const Value.absent(),
  }) : surahNumber = Value(surahNumber),
       verseNumber = Value(verseNumber),
       verseKey = Value(verseKey);
  static Insertable<JapaneseData> custom({
    Expression<int>? id,
    Expression<int>? surahNumber,
    Expression<int>? verseNumber,
    Expression<String>? verseKey,
    Expression<String>? textPlain,
    Expression<String>? textWithFurigana,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (surahNumber != null) 'surah_number': surahNumber,
      if (verseNumber != null) 'verse_number': verseNumber,
      if (verseKey != null) 'verse_key': verseKey,
      if (textPlain != null) 'text_plain': textPlain,
      if (textWithFurigana != null) 'text_with_furigana': textWithFurigana,
    });
  }

  JapaneseCompanion copyWith({
    Value<int>? id,
    Value<int>? surahNumber,
    Value<int>? verseNumber,
    Value<String>? verseKey,
    Value<String?>? textPlain,
    Value<String?>? textWithFurigana,
  }) {
    return JapaneseCompanion(
      id: id ?? this.id,
      surahNumber: surahNumber ?? this.surahNumber,
      verseNumber: verseNumber ?? this.verseNumber,
      verseKey: verseKey ?? this.verseKey,
      textPlain: textPlain ?? this.textPlain,
      textWithFurigana: textWithFurigana ?? this.textWithFurigana,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (surahNumber.present) {
      map['surah_number'] = Variable<int>(surahNumber.value);
    }
    if (verseNumber.present) {
      map['verse_number'] = Variable<int>(verseNumber.value);
    }
    if (verseKey.present) {
      map['verse_key'] = Variable<String>(verseKey.value);
    }
    if (textPlain.present) {
      map['text_plain'] = Variable<String>(textPlain.value);
    }
    if (textWithFurigana.present) {
      map['text_with_furigana'] = Variable<String>(textWithFurigana.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JapaneseCompanion(')
          ..write('id: $id, ')
          ..write('surahNumber: $surahNumber, ')
          ..write('verseNumber: $verseNumber, ')
          ..write('verseKey: $verseKey, ')
          ..write('textPlain: $textPlain, ')
          ..write('textWithFurigana: $textWithFurigana')
          ..write(')'))
        .toString();
  }
}

class $EnglishTable extends English with TableInfo<$EnglishTable, EnglishData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EnglishTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _surahNumberMeta = const VerificationMeta(
    'surahNumber',
  );
  @override
  late final GeneratedColumn<int> surahNumber = GeneratedColumn<int>(
    'surah_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _verseNumberMeta = const VerificationMeta(
    'verseNumber',
  );
  @override
  late final GeneratedColumn<int> verseNumber = GeneratedColumn<int>(
    'verse_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _verseKeyMeta = const VerificationMeta(
    'verseKey',
  );
  @override
  late final GeneratedColumn<String> verseKey = GeneratedColumn<String>(
    'verse_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _translationTextMeta = const VerificationMeta(
    'translationText',
  );
  @override
  late final GeneratedColumn<String> translationText = GeneratedColumn<String>(
    'text',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    surahNumber,
    verseNumber,
    verseKey,
    translationText,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'english';
  @override
  VerificationContext validateIntegrity(
    Insertable<EnglishData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('surah_number')) {
      context.handle(
        _surahNumberMeta,
        surahNumber.isAcceptableOrUnknown(
          data['surah_number']!,
          _surahNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_surahNumberMeta);
    }
    if (data.containsKey('verse_number')) {
      context.handle(
        _verseNumberMeta,
        verseNumber.isAcceptableOrUnknown(
          data['verse_number']!,
          _verseNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_verseNumberMeta);
    }
    if (data.containsKey('verse_key')) {
      context.handle(
        _verseKeyMeta,
        verseKey.isAcceptableOrUnknown(data['verse_key']!, _verseKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_verseKeyMeta);
    }
    if (data.containsKey('text')) {
      context.handle(
        _translationTextMeta,
        translationText.isAcceptableOrUnknown(
          data['text']!,
          _translationTextMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_translationTextMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EnglishData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EnglishData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      surahNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}surah_number'],
      )!,
      verseNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}verse_number'],
      )!,
      verseKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}verse_key'],
      )!,
      translationText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}text'],
      )!,
    );
  }

  @override
  $EnglishTable createAlias(String alias) {
    return $EnglishTable(attachedDatabase, alias);
  }
}

class EnglishData extends DataClass implements Insertable<EnglishData> {
  final int id;
  final int surahNumber;
  final int verseNumber;
  final String verseKey;
  final String translationText;
  const EnglishData({
    required this.id,
    required this.surahNumber,
    required this.verseNumber,
    required this.verseKey,
    required this.translationText,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['surah_number'] = Variable<int>(surahNumber);
    map['verse_number'] = Variable<int>(verseNumber);
    map['verse_key'] = Variable<String>(verseKey);
    map['text'] = Variable<String>(translationText);
    return map;
  }

  EnglishCompanion toCompanion(bool nullToAbsent) {
    return EnglishCompanion(
      id: Value(id),
      surahNumber: Value(surahNumber),
      verseNumber: Value(verseNumber),
      verseKey: Value(verseKey),
      translationText: Value(translationText),
    );
  }

  factory EnglishData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EnglishData(
      id: serializer.fromJson<int>(json['id']),
      surahNumber: serializer.fromJson<int>(json['surahNumber']),
      verseNumber: serializer.fromJson<int>(json['verseNumber']),
      verseKey: serializer.fromJson<String>(json['verseKey']),
      translationText: serializer.fromJson<String>(json['translationText']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'surahNumber': serializer.toJson<int>(surahNumber),
      'verseNumber': serializer.toJson<int>(verseNumber),
      'verseKey': serializer.toJson<String>(verseKey),
      'translationText': serializer.toJson<String>(translationText),
    };
  }

  EnglishData copyWith({
    int? id,
    int? surahNumber,
    int? verseNumber,
    String? verseKey,
    String? translationText,
  }) => EnglishData(
    id: id ?? this.id,
    surahNumber: surahNumber ?? this.surahNumber,
    verseNumber: verseNumber ?? this.verseNumber,
    verseKey: verseKey ?? this.verseKey,
    translationText: translationText ?? this.translationText,
  );
  EnglishData copyWithCompanion(EnglishCompanion data) {
    return EnglishData(
      id: data.id.present ? data.id.value : this.id,
      surahNumber: data.surahNumber.present
          ? data.surahNumber.value
          : this.surahNumber,
      verseNumber: data.verseNumber.present
          ? data.verseNumber.value
          : this.verseNumber,
      verseKey: data.verseKey.present ? data.verseKey.value : this.verseKey,
      translationText: data.translationText.present
          ? data.translationText.value
          : this.translationText,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EnglishData(')
          ..write('id: $id, ')
          ..write('surahNumber: $surahNumber, ')
          ..write('verseNumber: $verseNumber, ')
          ..write('verseKey: $verseKey, ')
          ..write('translationText: $translationText')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, surahNumber, verseNumber, verseKey, translationText);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EnglishData &&
          other.id == this.id &&
          other.surahNumber == this.surahNumber &&
          other.verseNumber == this.verseNumber &&
          other.verseKey == this.verseKey &&
          other.translationText == this.translationText);
}

class EnglishCompanion extends UpdateCompanion<EnglishData> {
  final Value<int> id;
  final Value<int> surahNumber;
  final Value<int> verseNumber;
  final Value<String> verseKey;
  final Value<String> translationText;
  const EnglishCompanion({
    this.id = const Value.absent(),
    this.surahNumber = const Value.absent(),
    this.verseNumber = const Value.absent(),
    this.verseKey = const Value.absent(),
    this.translationText = const Value.absent(),
  });
  EnglishCompanion.insert({
    this.id = const Value.absent(),
    required int surahNumber,
    required int verseNumber,
    required String verseKey,
    required String translationText,
  }) : surahNumber = Value(surahNumber),
       verseNumber = Value(verseNumber),
       verseKey = Value(verseKey),
       translationText = Value(translationText);
  static Insertable<EnglishData> custom({
    Expression<int>? id,
    Expression<int>? surahNumber,
    Expression<int>? verseNumber,
    Expression<String>? verseKey,
    Expression<String>? translationText,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (surahNumber != null) 'surah_number': surahNumber,
      if (verseNumber != null) 'verse_number': verseNumber,
      if (verseKey != null) 'verse_key': verseKey,
      if (translationText != null) 'text': translationText,
    });
  }

  EnglishCompanion copyWith({
    Value<int>? id,
    Value<int>? surahNumber,
    Value<int>? verseNumber,
    Value<String>? verseKey,
    Value<String>? translationText,
  }) {
    return EnglishCompanion(
      id: id ?? this.id,
      surahNumber: surahNumber ?? this.surahNumber,
      verseNumber: verseNumber ?? this.verseNumber,
      verseKey: verseKey ?? this.verseKey,
      translationText: translationText ?? this.translationText,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (surahNumber.present) {
      map['surah_number'] = Variable<int>(surahNumber.value);
    }
    if (verseNumber.present) {
      map['verse_number'] = Variable<int>(verseNumber.value);
    }
    if (verseKey.present) {
      map['verse_key'] = Variable<String>(verseKey.value);
    }
    if (translationText.present) {
      map['text'] = Variable<String>(translationText.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EnglishCompanion(')
          ..write('id: $id, ')
          ..write('surahNumber: $surahNumber, ')
          ..write('verseNumber: $verseNumber, ')
          ..write('verseKey: $verseKey, ')
          ..write('translationText: $translationText')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SurahTable surah = $SurahTable(this);
  late final $JuzuTable juzu = $JuzuTable(this);
  late final $RukuTable ruku = $RukuTable(this);
  late final $PageTable page = $PageTable(this);
  late final $AyahTable ayah = $AyahTable(this);
  late final $JapaneseTable japanese = $JapaneseTable(this);
  late final $EnglishTable english = $EnglishTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    surah,
    juzu,
    ruku,
    page,
    ayah,
    japanese,
    english,
  ];
}

typedef $$SurahTableCreateCompanionBuilder =
    SurahCompanion Function({
      Value<int> surahNumber,
      required String nameEnglish,
      Value<String?> nameTranslated,
      Value<String?> nameArabic,
      required int totalVerses,
      Value<String?> revelationPlace,
      Value<int?> revelationOrder,
      Value<String?> shortExcerpt,
      Value<String?> summary,
    });
typedef $$SurahTableUpdateCompanionBuilder =
    SurahCompanion Function({
      Value<int> surahNumber,
      Value<String> nameEnglish,
      Value<String?> nameTranslated,
      Value<String?> nameArabic,
      Value<int> totalVerses,
      Value<String?> revelationPlace,
      Value<int?> revelationOrder,
      Value<String?> shortExcerpt,
      Value<String?> summary,
    });

final class $$SurahTableReferences
    extends BaseReferences<_$AppDatabase, $SurahTable, SurahData> {
  $$SurahTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$RukuTable, List<RukuData>> _rukuRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.ruku,
    aliasName: $_aliasNameGenerator(db.surah.surahNumber, db.ruku.surahNumber),
  );

  $$RukuTableProcessedTableManager get rukuRefs {
    final manager = $$RukuTableTableManager($_db, $_db.ruku).filter(
      (f) => f.surahNumber.surahNumber.sqlEquals(
        $_itemColumn<int>('surah_number')!,
      ),
    );

    final cache = $_typedResult.readTableOrNull(_rukuRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$AyahTable, List<AyahData>> _ayahRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.ayah,
    aliasName: $_aliasNameGenerator(db.surah.surahNumber, db.ayah.surahNumber),
  );

  $$AyahTableProcessedTableManager get ayahRefs {
    final manager = $$AyahTableTableManager($_db, $_db.ayah).filter(
      (f) => f.surahNumber.surahNumber.sqlEquals(
        $_itemColumn<int>('surah_number')!,
      ),
    );

    final cache = $_typedResult.readTableOrNull(_ayahRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SurahTableFilterComposer extends Composer<_$AppDatabase, $SurahTable> {
  $$SurahTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get surahNumber => $composableBuilder(
    column: $table.surahNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameEnglish => $composableBuilder(
    column: $table.nameEnglish,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameTranslated => $composableBuilder(
    column: $table.nameTranslated,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameArabic => $composableBuilder(
    column: $table.nameArabic,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalVerses => $composableBuilder(
    column: $table.totalVerses,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get revelationPlace => $composableBuilder(
    column: $table.revelationPlace,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get revelationOrder => $composableBuilder(
    column: $table.revelationOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get shortExcerpt => $composableBuilder(
    column: $table.shortExcerpt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get summary => $composableBuilder(
    column: $table.summary,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> rukuRefs(
    Expression<bool> Function($$RukuTableFilterComposer f) f,
  ) {
    final $$RukuTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.surahNumber,
      referencedTable: $db.ruku,
      getReferencedColumn: (t) => t.surahNumber,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RukuTableFilterComposer(
            $db: $db,
            $table: $db.ruku,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> ayahRefs(
    Expression<bool> Function($$AyahTableFilterComposer f) f,
  ) {
    final $$AyahTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.surahNumber,
      referencedTable: $db.ayah,
      getReferencedColumn: (t) => t.surahNumber,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AyahTableFilterComposer(
            $db: $db,
            $table: $db.ayah,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SurahTableOrderingComposer
    extends Composer<_$AppDatabase, $SurahTable> {
  $$SurahTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get surahNumber => $composableBuilder(
    column: $table.surahNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameEnglish => $composableBuilder(
    column: $table.nameEnglish,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameTranslated => $composableBuilder(
    column: $table.nameTranslated,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameArabic => $composableBuilder(
    column: $table.nameArabic,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalVerses => $composableBuilder(
    column: $table.totalVerses,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get revelationPlace => $composableBuilder(
    column: $table.revelationPlace,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get revelationOrder => $composableBuilder(
    column: $table.revelationOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get shortExcerpt => $composableBuilder(
    column: $table.shortExcerpt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get summary => $composableBuilder(
    column: $table.summary,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SurahTableAnnotationComposer
    extends Composer<_$AppDatabase, $SurahTable> {
  $$SurahTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get surahNumber => $composableBuilder(
    column: $table.surahNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get nameEnglish => $composableBuilder(
    column: $table.nameEnglish,
    builder: (column) => column,
  );

  GeneratedColumn<String> get nameTranslated => $composableBuilder(
    column: $table.nameTranslated,
    builder: (column) => column,
  );

  GeneratedColumn<String> get nameArabic => $composableBuilder(
    column: $table.nameArabic,
    builder: (column) => column,
  );

  GeneratedColumn<int> get totalVerses => $composableBuilder(
    column: $table.totalVerses,
    builder: (column) => column,
  );

  GeneratedColumn<String> get revelationPlace => $composableBuilder(
    column: $table.revelationPlace,
    builder: (column) => column,
  );

  GeneratedColumn<int> get revelationOrder => $composableBuilder(
    column: $table.revelationOrder,
    builder: (column) => column,
  );

  GeneratedColumn<String> get shortExcerpt => $composableBuilder(
    column: $table.shortExcerpt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get summary =>
      $composableBuilder(column: $table.summary, builder: (column) => column);

  Expression<T> rukuRefs<T extends Object>(
    Expression<T> Function($$RukuTableAnnotationComposer a) f,
  ) {
    final $$RukuTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.surahNumber,
      referencedTable: $db.ruku,
      getReferencedColumn: (t) => t.surahNumber,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RukuTableAnnotationComposer(
            $db: $db,
            $table: $db.ruku,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> ayahRefs<T extends Object>(
    Expression<T> Function($$AyahTableAnnotationComposer a) f,
  ) {
    final $$AyahTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.surahNumber,
      referencedTable: $db.ayah,
      getReferencedColumn: (t) => t.surahNumber,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AyahTableAnnotationComposer(
            $db: $db,
            $table: $db.ayah,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SurahTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SurahTable,
          SurahData,
          $$SurahTableFilterComposer,
          $$SurahTableOrderingComposer,
          $$SurahTableAnnotationComposer,
          $$SurahTableCreateCompanionBuilder,
          $$SurahTableUpdateCompanionBuilder,
          (SurahData, $$SurahTableReferences),
          SurahData,
          PrefetchHooks Function({bool rukuRefs, bool ayahRefs})
        > {
  $$SurahTableTableManager(_$AppDatabase db, $SurahTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SurahTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SurahTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SurahTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> surahNumber = const Value.absent(),
                Value<String> nameEnglish = const Value.absent(),
                Value<String?> nameTranslated = const Value.absent(),
                Value<String?> nameArabic = const Value.absent(),
                Value<int> totalVerses = const Value.absent(),
                Value<String?> revelationPlace = const Value.absent(),
                Value<int?> revelationOrder = const Value.absent(),
                Value<String?> shortExcerpt = const Value.absent(),
                Value<String?> summary = const Value.absent(),
              }) => SurahCompanion(
                surahNumber: surahNumber,
                nameEnglish: nameEnglish,
                nameTranslated: nameTranslated,
                nameArabic: nameArabic,
                totalVerses: totalVerses,
                revelationPlace: revelationPlace,
                revelationOrder: revelationOrder,
                shortExcerpt: shortExcerpt,
                summary: summary,
              ),
          createCompanionCallback:
              ({
                Value<int> surahNumber = const Value.absent(),
                required String nameEnglish,
                Value<String?> nameTranslated = const Value.absent(),
                Value<String?> nameArabic = const Value.absent(),
                required int totalVerses,
                Value<String?> revelationPlace = const Value.absent(),
                Value<int?> revelationOrder = const Value.absent(),
                Value<String?> shortExcerpt = const Value.absent(),
                Value<String?> summary = const Value.absent(),
              }) => SurahCompanion.insert(
                surahNumber: surahNumber,
                nameEnglish: nameEnglish,
                nameTranslated: nameTranslated,
                nameArabic: nameArabic,
                totalVerses: totalVerses,
                revelationPlace: revelationPlace,
                revelationOrder: revelationOrder,
                shortExcerpt: shortExcerpt,
                summary: summary,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$SurahTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({rukuRefs = false, ayahRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (rukuRefs) db.ruku,
                if (ayahRefs) db.ayah,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (rukuRefs)
                    await $_getPrefetchedData<SurahData, $SurahTable, RukuData>(
                      currentTable: table,
                      referencedTable: $$SurahTableReferences._rukuRefsTable(
                        db,
                      ),
                      managerFromTypedResult: (p0) =>
                          $$SurahTableReferences(db, table, p0).rukuRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.surahNumber == item.surahNumber,
                          ),
                      typedResults: items,
                    ),
                  if (ayahRefs)
                    await $_getPrefetchedData<SurahData, $SurahTable, AyahData>(
                      currentTable: table,
                      referencedTable: $$SurahTableReferences._ayahRefsTable(
                        db,
                      ),
                      managerFromTypedResult: (p0) =>
                          $$SurahTableReferences(db, table, p0).ayahRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.surahNumber == item.surahNumber,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$SurahTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SurahTable,
      SurahData,
      $$SurahTableFilterComposer,
      $$SurahTableOrderingComposer,
      $$SurahTableAnnotationComposer,
      $$SurahTableCreateCompanionBuilder,
      $$SurahTableUpdateCompanionBuilder,
      (SurahData, $$SurahTableReferences),
      SurahData,
      PrefetchHooks Function({bool rukuRefs, bool ayahRefs})
    >;
typedef $$JuzuTableCreateCompanionBuilder =
    JuzuCompanion Function({
      Value<int> juzuNumber,
      required String arabicName,
      required int startSurah,
      required int startVerse,
      required int endSurah,
      required int endVerse,
    });
typedef $$JuzuTableUpdateCompanionBuilder =
    JuzuCompanion Function({
      Value<int> juzuNumber,
      Value<String> arabicName,
      Value<int> startSurah,
      Value<int> startVerse,
      Value<int> endSurah,
      Value<int> endVerse,
    });

final class $$JuzuTableReferences
    extends BaseReferences<_$AppDatabase, $JuzuTable, JuzuData> {
  $$JuzuTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$AyahTable, List<AyahData>> _ayahRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.ayah,
    aliasName: $_aliasNameGenerator(db.juzu.juzuNumber, db.ayah.juzuNumber),
  );

  $$AyahTableProcessedTableManager get ayahRefs {
    final manager = $$AyahTableTableManager($_db, $_db.ayah).filter(
      (f) =>
          f.juzuNumber.juzuNumber.sqlEquals($_itemColumn<int>('juzu_number')!),
    );

    final cache = $_typedResult.readTableOrNull(_ayahRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$JuzuTableFilterComposer extends Composer<_$AppDatabase, $JuzuTable> {
  $$JuzuTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get juzuNumber => $composableBuilder(
    column: $table.juzuNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get arabicName => $composableBuilder(
    column: $table.arabicName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get startSurah => $composableBuilder(
    column: $table.startSurah,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get startVerse => $composableBuilder(
    column: $table.startVerse,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get endSurah => $composableBuilder(
    column: $table.endSurah,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get endVerse => $composableBuilder(
    column: $table.endVerse,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> ayahRefs(
    Expression<bool> Function($$AyahTableFilterComposer f) f,
  ) {
    final $$AyahTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.juzuNumber,
      referencedTable: $db.ayah,
      getReferencedColumn: (t) => t.juzuNumber,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AyahTableFilterComposer(
            $db: $db,
            $table: $db.ayah,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$JuzuTableOrderingComposer extends Composer<_$AppDatabase, $JuzuTable> {
  $$JuzuTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get juzuNumber => $composableBuilder(
    column: $table.juzuNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get arabicName => $composableBuilder(
    column: $table.arabicName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get startSurah => $composableBuilder(
    column: $table.startSurah,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get startVerse => $composableBuilder(
    column: $table.startVerse,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get endSurah => $composableBuilder(
    column: $table.endSurah,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get endVerse => $composableBuilder(
    column: $table.endVerse,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$JuzuTableAnnotationComposer
    extends Composer<_$AppDatabase, $JuzuTable> {
  $$JuzuTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get juzuNumber => $composableBuilder(
    column: $table.juzuNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get arabicName => $composableBuilder(
    column: $table.arabicName,
    builder: (column) => column,
  );

  GeneratedColumn<int> get startSurah => $composableBuilder(
    column: $table.startSurah,
    builder: (column) => column,
  );

  GeneratedColumn<int> get startVerse => $composableBuilder(
    column: $table.startVerse,
    builder: (column) => column,
  );

  GeneratedColumn<int> get endSurah =>
      $composableBuilder(column: $table.endSurah, builder: (column) => column);

  GeneratedColumn<int> get endVerse =>
      $composableBuilder(column: $table.endVerse, builder: (column) => column);

  Expression<T> ayahRefs<T extends Object>(
    Expression<T> Function($$AyahTableAnnotationComposer a) f,
  ) {
    final $$AyahTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.juzuNumber,
      referencedTable: $db.ayah,
      getReferencedColumn: (t) => t.juzuNumber,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AyahTableAnnotationComposer(
            $db: $db,
            $table: $db.ayah,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$JuzuTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $JuzuTable,
          JuzuData,
          $$JuzuTableFilterComposer,
          $$JuzuTableOrderingComposer,
          $$JuzuTableAnnotationComposer,
          $$JuzuTableCreateCompanionBuilder,
          $$JuzuTableUpdateCompanionBuilder,
          (JuzuData, $$JuzuTableReferences),
          JuzuData,
          PrefetchHooks Function({bool ayahRefs})
        > {
  $$JuzuTableTableManager(_$AppDatabase db, $JuzuTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$JuzuTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$JuzuTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$JuzuTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> juzuNumber = const Value.absent(),
                Value<String> arabicName = const Value.absent(),
                Value<int> startSurah = const Value.absent(),
                Value<int> startVerse = const Value.absent(),
                Value<int> endSurah = const Value.absent(),
                Value<int> endVerse = const Value.absent(),
              }) => JuzuCompanion(
                juzuNumber: juzuNumber,
                arabicName: arabicName,
                startSurah: startSurah,
                startVerse: startVerse,
                endSurah: endSurah,
                endVerse: endVerse,
              ),
          createCompanionCallback:
              ({
                Value<int> juzuNumber = const Value.absent(),
                required String arabicName,
                required int startSurah,
                required int startVerse,
                required int endSurah,
                required int endVerse,
              }) => JuzuCompanion.insert(
                juzuNumber: juzuNumber,
                arabicName: arabicName,
                startSurah: startSurah,
                startVerse: startVerse,
                endSurah: endSurah,
                endVerse: endVerse,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$JuzuTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({ayahRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (ayahRefs) db.ayah],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (ayahRefs)
                    await $_getPrefetchedData<JuzuData, $JuzuTable, AyahData>(
                      currentTable: table,
                      referencedTable: $$JuzuTableReferences._ayahRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$JuzuTableReferences(db, table, p0).ayahRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.juzuNumber == item.juzuNumber,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$JuzuTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $JuzuTable,
      JuzuData,
      $$JuzuTableFilterComposer,
      $$JuzuTableOrderingComposer,
      $$JuzuTableAnnotationComposer,
      $$JuzuTableCreateCompanionBuilder,
      $$JuzuTableUpdateCompanionBuilder,
      (JuzuData, $$JuzuTableReferences),
      JuzuData,
      PrefetchHooks Function({bool ayahRefs})
    >;
typedef $$RukuTableCreateCompanionBuilder =
    RukuCompanion Function({
      Value<int> rukuNumber,
      required int surahNumber,
      Value<String?> surahNameArabic,
      required int firstAya,
      required int lastAya,
      Value<int> sajdaAya,
    });
typedef $$RukuTableUpdateCompanionBuilder =
    RukuCompanion Function({
      Value<int> rukuNumber,
      Value<int> surahNumber,
      Value<String?> surahNameArabic,
      Value<int> firstAya,
      Value<int> lastAya,
      Value<int> sajdaAya,
    });

final class $$RukuTableReferences
    extends BaseReferences<_$AppDatabase, $RukuTable, RukuData> {
  $$RukuTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $SurahTable _surahNumberTable(_$AppDatabase db) =>
      db.surah.createAlias(
        $_aliasNameGenerator(db.ruku.surahNumber, db.surah.surahNumber),
      );

  $$SurahTableProcessedTableManager get surahNumber {
    final $_column = $_itemColumn<int>('surah_number')!;

    final manager = $$SurahTableTableManager(
      $_db,
      $_db.surah,
    ).filter((f) => f.surahNumber.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_surahNumberTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$AyahTable, List<AyahData>> _ayahRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.ayah,
    aliasName: $_aliasNameGenerator(db.ruku.rukuNumber, db.ayah.rukuNumber),
  );

  $$AyahTableProcessedTableManager get ayahRefs {
    final manager = $$AyahTableTableManager($_db, $_db.ayah).filter(
      (f) =>
          f.rukuNumber.rukuNumber.sqlEquals($_itemColumn<int>('ruku_number')!),
    );

    final cache = $_typedResult.readTableOrNull(_ayahRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$RukuTableFilterComposer extends Composer<_$AppDatabase, $RukuTable> {
  $$RukuTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get rukuNumber => $composableBuilder(
    column: $table.rukuNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get surahNameArabic => $composableBuilder(
    column: $table.surahNameArabic,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get firstAya => $composableBuilder(
    column: $table.firstAya,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get lastAya => $composableBuilder(
    column: $table.lastAya,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sajdaAya => $composableBuilder(
    column: $table.sajdaAya,
    builder: (column) => ColumnFilters(column),
  );

  $$SurahTableFilterComposer get surahNumber {
    final $$SurahTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.surahNumber,
      referencedTable: $db.surah,
      getReferencedColumn: (t) => t.surahNumber,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SurahTableFilterComposer(
            $db: $db,
            $table: $db.surah,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> ayahRefs(
    Expression<bool> Function($$AyahTableFilterComposer f) f,
  ) {
    final $$AyahTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.rukuNumber,
      referencedTable: $db.ayah,
      getReferencedColumn: (t) => t.rukuNumber,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AyahTableFilterComposer(
            $db: $db,
            $table: $db.ayah,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RukuTableOrderingComposer extends Composer<_$AppDatabase, $RukuTable> {
  $$RukuTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get rukuNumber => $composableBuilder(
    column: $table.rukuNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get surahNameArabic => $composableBuilder(
    column: $table.surahNameArabic,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get firstAya => $composableBuilder(
    column: $table.firstAya,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get lastAya => $composableBuilder(
    column: $table.lastAya,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sajdaAya => $composableBuilder(
    column: $table.sajdaAya,
    builder: (column) => ColumnOrderings(column),
  );

  $$SurahTableOrderingComposer get surahNumber {
    final $$SurahTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.surahNumber,
      referencedTable: $db.surah,
      getReferencedColumn: (t) => t.surahNumber,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SurahTableOrderingComposer(
            $db: $db,
            $table: $db.surah,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RukuTableAnnotationComposer
    extends Composer<_$AppDatabase, $RukuTable> {
  $$RukuTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get rukuNumber => $composableBuilder(
    column: $table.rukuNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get surahNameArabic => $composableBuilder(
    column: $table.surahNameArabic,
    builder: (column) => column,
  );

  GeneratedColumn<int> get firstAya =>
      $composableBuilder(column: $table.firstAya, builder: (column) => column);

  GeneratedColumn<int> get lastAya =>
      $composableBuilder(column: $table.lastAya, builder: (column) => column);

  GeneratedColumn<int> get sajdaAya =>
      $composableBuilder(column: $table.sajdaAya, builder: (column) => column);

  $$SurahTableAnnotationComposer get surahNumber {
    final $$SurahTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.surahNumber,
      referencedTable: $db.surah,
      getReferencedColumn: (t) => t.surahNumber,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SurahTableAnnotationComposer(
            $db: $db,
            $table: $db.surah,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> ayahRefs<T extends Object>(
    Expression<T> Function($$AyahTableAnnotationComposer a) f,
  ) {
    final $$AyahTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.rukuNumber,
      referencedTable: $db.ayah,
      getReferencedColumn: (t) => t.rukuNumber,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AyahTableAnnotationComposer(
            $db: $db,
            $table: $db.ayah,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RukuTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RukuTable,
          RukuData,
          $$RukuTableFilterComposer,
          $$RukuTableOrderingComposer,
          $$RukuTableAnnotationComposer,
          $$RukuTableCreateCompanionBuilder,
          $$RukuTableUpdateCompanionBuilder,
          (RukuData, $$RukuTableReferences),
          RukuData,
          PrefetchHooks Function({bool surahNumber, bool ayahRefs})
        > {
  $$RukuTableTableManager(_$AppDatabase db, $RukuTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RukuTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RukuTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RukuTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> rukuNumber = const Value.absent(),
                Value<int> surahNumber = const Value.absent(),
                Value<String?> surahNameArabic = const Value.absent(),
                Value<int> firstAya = const Value.absent(),
                Value<int> lastAya = const Value.absent(),
                Value<int> sajdaAya = const Value.absent(),
              }) => RukuCompanion(
                rukuNumber: rukuNumber,
                surahNumber: surahNumber,
                surahNameArabic: surahNameArabic,
                firstAya: firstAya,
                lastAya: lastAya,
                sajdaAya: sajdaAya,
              ),
          createCompanionCallback:
              ({
                Value<int> rukuNumber = const Value.absent(),
                required int surahNumber,
                Value<String?> surahNameArabic = const Value.absent(),
                required int firstAya,
                required int lastAya,
                Value<int> sajdaAya = const Value.absent(),
              }) => RukuCompanion.insert(
                rukuNumber: rukuNumber,
                surahNumber: surahNumber,
                surahNameArabic: surahNameArabic,
                firstAya: firstAya,
                lastAya: lastAya,
                sajdaAya: sajdaAya,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$RukuTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({surahNumber = false, ayahRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (ayahRefs) db.ayah],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (surahNumber) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.surahNumber,
                                referencedTable: $$RukuTableReferences
                                    ._surahNumberTable(db),
                                referencedColumn: $$RukuTableReferences
                                    ._surahNumberTable(db)
                                    .surahNumber,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (ayahRefs)
                    await $_getPrefetchedData<RukuData, $RukuTable, AyahData>(
                      currentTable: table,
                      referencedTable: $$RukuTableReferences._ayahRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$RukuTableReferences(db, table, p0).ayahRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.rukuNumber == item.rukuNumber,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$RukuTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RukuTable,
      RukuData,
      $$RukuTableFilterComposer,
      $$RukuTableOrderingComposer,
      $$RukuTableAnnotationComposer,
      $$RukuTableCreateCompanionBuilder,
      $$RukuTableUpdateCompanionBuilder,
      (RukuData, $$RukuTableReferences),
      RukuData,
      PrefetchHooks Function({bool surahNumber, bool ayahRefs})
    >;
typedef $$PageTableCreateCompanionBuilder =
    PageCompanion Function({
      Value<int> pageNumber,
      Value<int?> juzuNumber,
      Value<String?> firstVerseKey,
      Value<int?> verseCount,
    });
typedef $$PageTableUpdateCompanionBuilder =
    PageCompanion Function({
      Value<int> pageNumber,
      Value<int?> juzuNumber,
      Value<String?> firstVerseKey,
      Value<int?> verseCount,
    });

class $$PageTableFilterComposer extends Composer<_$AppDatabase, $PageTable> {
  $$PageTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get pageNumber => $composableBuilder(
    column: $table.pageNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get juzuNumber => $composableBuilder(
    column: $table.juzuNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get firstVerseKey => $composableBuilder(
    column: $table.firstVerseKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get verseCount => $composableBuilder(
    column: $table.verseCount,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PageTableOrderingComposer extends Composer<_$AppDatabase, $PageTable> {
  $$PageTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get pageNumber => $composableBuilder(
    column: $table.pageNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get juzuNumber => $composableBuilder(
    column: $table.juzuNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get firstVerseKey => $composableBuilder(
    column: $table.firstVerseKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get verseCount => $composableBuilder(
    column: $table.verseCount,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PageTableAnnotationComposer
    extends Composer<_$AppDatabase, $PageTable> {
  $$PageTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get pageNumber => $composableBuilder(
    column: $table.pageNumber,
    builder: (column) => column,
  );

  GeneratedColumn<int> get juzuNumber => $composableBuilder(
    column: $table.juzuNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get firstVerseKey => $composableBuilder(
    column: $table.firstVerseKey,
    builder: (column) => column,
  );

  GeneratedColumn<int> get verseCount => $composableBuilder(
    column: $table.verseCount,
    builder: (column) => column,
  );
}

class $$PageTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PageTable,
          PageData,
          $$PageTableFilterComposer,
          $$PageTableOrderingComposer,
          $$PageTableAnnotationComposer,
          $$PageTableCreateCompanionBuilder,
          $$PageTableUpdateCompanionBuilder,
          (PageData, BaseReferences<_$AppDatabase, $PageTable, PageData>),
          PageData,
          PrefetchHooks Function()
        > {
  $$PageTableTableManager(_$AppDatabase db, $PageTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PageTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PageTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PageTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> pageNumber = const Value.absent(),
                Value<int?> juzuNumber = const Value.absent(),
                Value<String?> firstVerseKey = const Value.absent(),
                Value<int?> verseCount = const Value.absent(),
              }) => PageCompanion(
                pageNumber: pageNumber,
                juzuNumber: juzuNumber,
                firstVerseKey: firstVerseKey,
                verseCount: verseCount,
              ),
          createCompanionCallback:
              ({
                Value<int> pageNumber = const Value.absent(),
                Value<int?> juzuNumber = const Value.absent(),
                Value<String?> firstVerseKey = const Value.absent(),
                Value<int?> verseCount = const Value.absent(),
              }) => PageCompanion.insert(
                pageNumber: pageNumber,
                juzuNumber: juzuNumber,
                firstVerseKey: firstVerseKey,
                verseCount: verseCount,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PageTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PageTable,
      PageData,
      $$PageTableFilterComposer,
      $$PageTableOrderingComposer,
      $$PageTableAnnotationComposer,
      $$PageTableCreateCompanionBuilder,
      $$PageTableUpdateCompanionBuilder,
      (PageData, BaseReferences<_$AppDatabase, $PageTable, PageData>),
      PageData,
      PrefetchHooks Function()
    >;
typedef $$AyahTableCreateCompanionBuilder =
    AyahCompanion Function({
      Value<int> id,
      required int surahNumber,
      required int verseNumber,
      required String verseKey,
      required String arabic,
      Value<int?> pageNumber,
      Value<int?> rukuNumber,
      Value<int?> juzuNumber,
    });
typedef $$AyahTableUpdateCompanionBuilder =
    AyahCompanion Function({
      Value<int> id,
      Value<int> surahNumber,
      Value<int> verseNumber,
      Value<String> verseKey,
      Value<String> arabic,
      Value<int?> pageNumber,
      Value<int?> rukuNumber,
      Value<int?> juzuNumber,
    });

final class $$AyahTableReferences
    extends BaseReferences<_$AppDatabase, $AyahTable, AyahData> {
  $$AyahTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $SurahTable _surahNumberTable(_$AppDatabase db) =>
      db.surah.createAlias(
        $_aliasNameGenerator(db.ayah.surahNumber, db.surah.surahNumber),
      );

  $$SurahTableProcessedTableManager get surahNumber {
    final $_column = $_itemColumn<int>('surah_number')!;

    final manager = $$SurahTableTableManager(
      $_db,
      $_db.surah,
    ).filter((f) => f.surahNumber.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_surahNumberTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $RukuTable _rukuNumberTable(_$AppDatabase db) => db.ruku.createAlias(
    $_aliasNameGenerator(db.ayah.rukuNumber, db.ruku.rukuNumber),
  );

  $$RukuTableProcessedTableManager? get rukuNumber {
    final $_column = $_itemColumn<int>('ruku_number');
    if ($_column == null) return null;
    final manager = $$RukuTableTableManager(
      $_db,
      $_db.ruku,
    ).filter((f) => f.rukuNumber.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_rukuNumberTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $JuzuTable _juzuNumberTable(_$AppDatabase db) => db.juzu.createAlias(
    $_aliasNameGenerator(db.ayah.juzuNumber, db.juzu.juzuNumber),
  );

  $$JuzuTableProcessedTableManager? get juzuNumber {
    final $_column = $_itemColumn<int>('juzu_number');
    if ($_column == null) return null;
    final manager = $$JuzuTableTableManager(
      $_db,
      $_db.juzu,
    ).filter((f) => f.juzuNumber.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_juzuNumberTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AyahTableFilterComposer extends Composer<_$AppDatabase, $AyahTable> {
  $$AyahTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get verseNumber => $composableBuilder(
    column: $table.verseNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get verseKey => $composableBuilder(
    column: $table.verseKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get arabic => $composableBuilder(
    column: $table.arabic,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get pageNumber => $composableBuilder(
    column: $table.pageNumber,
    builder: (column) => ColumnFilters(column),
  );

  $$SurahTableFilterComposer get surahNumber {
    final $$SurahTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.surahNumber,
      referencedTable: $db.surah,
      getReferencedColumn: (t) => t.surahNumber,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SurahTableFilterComposer(
            $db: $db,
            $table: $db.surah,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RukuTableFilterComposer get rukuNumber {
    final $$RukuTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.rukuNumber,
      referencedTable: $db.ruku,
      getReferencedColumn: (t) => t.rukuNumber,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RukuTableFilterComposer(
            $db: $db,
            $table: $db.ruku,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$JuzuTableFilterComposer get juzuNumber {
    final $$JuzuTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.juzuNumber,
      referencedTable: $db.juzu,
      getReferencedColumn: (t) => t.juzuNumber,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$JuzuTableFilterComposer(
            $db: $db,
            $table: $db.juzu,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AyahTableOrderingComposer extends Composer<_$AppDatabase, $AyahTable> {
  $$AyahTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get verseNumber => $composableBuilder(
    column: $table.verseNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get verseKey => $composableBuilder(
    column: $table.verseKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get arabic => $composableBuilder(
    column: $table.arabic,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pageNumber => $composableBuilder(
    column: $table.pageNumber,
    builder: (column) => ColumnOrderings(column),
  );

  $$SurahTableOrderingComposer get surahNumber {
    final $$SurahTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.surahNumber,
      referencedTable: $db.surah,
      getReferencedColumn: (t) => t.surahNumber,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SurahTableOrderingComposer(
            $db: $db,
            $table: $db.surah,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RukuTableOrderingComposer get rukuNumber {
    final $$RukuTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.rukuNumber,
      referencedTable: $db.ruku,
      getReferencedColumn: (t) => t.rukuNumber,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RukuTableOrderingComposer(
            $db: $db,
            $table: $db.ruku,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$JuzuTableOrderingComposer get juzuNumber {
    final $$JuzuTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.juzuNumber,
      referencedTable: $db.juzu,
      getReferencedColumn: (t) => t.juzuNumber,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$JuzuTableOrderingComposer(
            $db: $db,
            $table: $db.juzu,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AyahTableAnnotationComposer
    extends Composer<_$AppDatabase, $AyahTable> {
  $$AyahTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get verseNumber => $composableBuilder(
    column: $table.verseNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get verseKey =>
      $composableBuilder(column: $table.verseKey, builder: (column) => column);

  GeneratedColumn<String> get arabic =>
      $composableBuilder(column: $table.arabic, builder: (column) => column);

  GeneratedColumn<int> get pageNumber => $composableBuilder(
    column: $table.pageNumber,
    builder: (column) => column,
  );

  $$SurahTableAnnotationComposer get surahNumber {
    final $$SurahTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.surahNumber,
      referencedTable: $db.surah,
      getReferencedColumn: (t) => t.surahNumber,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SurahTableAnnotationComposer(
            $db: $db,
            $table: $db.surah,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RukuTableAnnotationComposer get rukuNumber {
    final $$RukuTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.rukuNumber,
      referencedTable: $db.ruku,
      getReferencedColumn: (t) => t.rukuNumber,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RukuTableAnnotationComposer(
            $db: $db,
            $table: $db.ruku,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$JuzuTableAnnotationComposer get juzuNumber {
    final $$JuzuTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.juzuNumber,
      referencedTable: $db.juzu,
      getReferencedColumn: (t) => t.juzuNumber,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$JuzuTableAnnotationComposer(
            $db: $db,
            $table: $db.juzu,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AyahTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AyahTable,
          AyahData,
          $$AyahTableFilterComposer,
          $$AyahTableOrderingComposer,
          $$AyahTableAnnotationComposer,
          $$AyahTableCreateCompanionBuilder,
          $$AyahTableUpdateCompanionBuilder,
          (AyahData, $$AyahTableReferences),
          AyahData,
          PrefetchHooks Function({
            bool surahNumber,
            bool rukuNumber,
            bool juzuNumber,
          })
        > {
  $$AyahTableTableManager(_$AppDatabase db, $AyahTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AyahTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AyahTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AyahTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> surahNumber = const Value.absent(),
                Value<int> verseNumber = const Value.absent(),
                Value<String> verseKey = const Value.absent(),
                Value<String> arabic = const Value.absent(),
                Value<int?> pageNumber = const Value.absent(),
                Value<int?> rukuNumber = const Value.absent(),
                Value<int?> juzuNumber = const Value.absent(),
              }) => AyahCompanion(
                id: id,
                surahNumber: surahNumber,
                verseNumber: verseNumber,
                verseKey: verseKey,
                arabic: arabic,
                pageNumber: pageNumber,
                rukuNumber: rukuNumber,
                juzuNumber: juzuNumber,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int surahNumber,
                required int verseNumber,
                required String verseKey,
                required String arabic,
                Value<int?> pageNumber = const Value.absent(),
                Value<int?> rukuNumber = const Value.absent(),
                Value<int?> juzuNumber = const Value.absent(),
              }) => AyahCompanion.insert(
                id: id,
                surahNumber: surahNumber,
                verseNumber: verseNumber,
                verseKey: verseKey,
                arabic: arabic,
                pageNumber: pageNumber,
                rukuNumber: rukuNumber,
                juzuNumber: juzuNumber,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$AyahTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({surahNumber = false, rukuNumber = false, juzuNumber = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (surahNumber) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.surahNumber,
                                    referencedTable: $$AyahTableReferences
                                        ._surahNumberTable(db),
                                    referencedColumn: $$AyahTableReferences
                                        ._surahNumberTable(db)
                                        .surahNumber,
                                  )
                                  as T;
                        }
                        if (rukuNumber) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.rukuNumber,
                                    referencedTable: $$AyahTableReferences
                                        ._rukuNumberTable(db),
                                    referencedColumn: $$AyahTableReferences
                                        ._rukuNumberTable(db)
                                        .rukuNumber,
                                  )
                                  as T;
                        }
                        if (juzuNumber) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.juzuNumber,
                                    referencedTable: $$AyahTableReferences
                                        ._juzuNumberTable(db),
                                    referencedColumn: $$AyahTableReferences
                                        ._juzuNumberTable(db)
                                        .juzuNumber,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$AyahTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AyahTable,
      AyahData,
      $$AyahTableFilterComposer,
      $$AyahTableOrderingComposer,
      $$AyahTableAnnotationComposer,
      $$AyahTableCreateCompanionBuilder,
      $$AyahTableUpdateCompanionBuilder,
      (AyahData, $$AyahTableReferences),
      AyahData,
      PrefetchHooks Function({
        bool surahNumber,
        bool rukuNumber,
        bool juzuNumber,
      })
    >;
typedef $$JapaneseTableCreateCompanionBuilder =
    JapaneseCompanion Function({
      Value<int> id,
      required int surahNumber,
      required int verseNumber,
      required String verseKey,
      Value<String?> textPlain,
      Value<String?> textWithFurigana,
    });
typedef $$JapaneseTableUpdateCompanionBuilder =
    JapaneseCompanion Function({
      Value<int> id,
      Value<int> surahNumber,
      Value<int> verseNumber,
      Value<String> verseKey,
      Value<String?> textPlain,
      Value<String?> textWithFurigana,
    });

class $$JapaneseTableFilterComposer
    extends Composer<_$AppDatabase, $JapaneseTable> {
  $$JapaneseTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get surahNumber => $composableBuilder(
    column: $table.surahNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get verseNumber => $composableBuilder(
    column: $table.verseNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get verseKey => $composableBuilder(
    column: $table.verseKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get textPlain => $composableBuilder(
    column: $table.textPlain,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get textWithFurigana => $composableBuilder(
    column: $table.textWithFurigana,
    builder: (column) => ColumnFilters(column),
  );
}

class $$JapaneseTableOrderingComposer
    extends Composer<_$AppDatabase, $JapaneseTable> {
  $$JapaneseTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get surahNumber => $composableBuilder(
    column: $table.surahNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get verseNumber => $composableBuilder(
    column: $table.verseNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get verseKey => $composableBuilder(
    column: $table.verseKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get textPlain => $composableBuilder(
    column: $table.textPlain,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get textWithFurigana => $composableBuilder(
    column: $table.textWithFurigana,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$JapaneseTableAnnotationComposer
    extends Composer<_$AppDatabase, $JapaneseTable> {
  $$JapaneseTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get surahNumber => $composableBuilder(
    column: $table.surahNumber,
    builder: (column) => column,
  );

  GeneratedColumn<int> get verseNumber => $composableBuilder(
    column: $table.verseNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get verseKey =>
      $composableBuilder(column: $table.verseKey, builder: (column) => column);

  GeneratedColumn<String> get textPlain =>
      $composableBuilder(column: $table.textPlain, builder: (column) => column);

  GeneratedColumn<String> get textWithFurigana => $composableBuilder(
    column: $table.textWithFurigana,
    builder: (column) => column,
  );
}

class $$JapaneseTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $JapaneseTable,
          JapaneseData,
          $$JapaneseTableFilterComposer,
          $$JapaneseTableOrderingComposer,
          $$JapaneseTableAnnotationComposer,
          $$JapaneseTableCreateCompanionBuilder,
          $$JapaneseTableUpdateCompanionBuilder,
          (
            JapaneseData,
            BaseReferences<_$AppDatabase, $JapaneseTable, JapaneseData>,
          ),
          JapaneseData,
          PrefetchHooks Function()
        > {
  $$JapaneseTableTableManager(_$AppDatabase db, $JapaneseTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$JapaneseTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$JapaneseTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$JapaneseTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> surahNumber = const Value.absent(),
                Value<int> verseNumber = const Value.absent(),
                Value<String> verseKey = const Value.absent(),
                Value<String?> textPlain = const Value.absent(),
                Value<String?> textWithFurigana = const Value.absent(),
              }) => JapaneseCompanion(
                id: id,
                surahNumber: surahNumber,
                verseNumber: verseNumber,
                verseKey: verseKey,
                textPlain: textPlain,
                textWithFurigana: textWithFurigana,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int surahNumber,
                required int verseNumber,
                required String verseKey,
                Value<String?> textPlain = const Value.absent(),
                Value<String?> textWithFurigana = const Value.absent(),
              }) => JapaneseCompanion.insert(
                id: id,
                surahNumber: surahNumber,
                verseNumber: verseNumber,
                verseKey: verseKey,
                textPlain: textPlain,
                textWithFurigana: textWithFurigana,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$JapaneseTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $JapaneseTable,
      JapaneseData,
      $$JapaneseTableFilterComposer,
      $$JapaneseTableOrderingComposer,
      $$JapaneseTableAnnotationComposer,
      $$JapaneseTableCreateCompanionBuilder,
      $$JapaneseTableUpdateCompanionBuilder,
      (
        JapaneseData,
        BaseReferences<_$AppDatabase, $JapaneseTable, JapaneseData>,
      ),
      JapaneseData,
      PrefetchHooks Function()
    >;
typedef $$EnglishTableCreateCompanionBuilder =
    EnglishCompanion Function({
      Value<int> id,
      required int surahNumber,
      required int verseNumber,
      required String verseKey,
      required String translationText,
    });
typedef $$EnglishTableUpdateCompanionBuilder =
    EnglishCompanion Function({
      Value<int> id,
      Value<int> surahNumber,
      Value<int> verseNumber,
      Value<String> verseKey,
      Value<String> translationText,
    });

class $$EnglishTableFilterComposer
    extends Composer<_$AppDatabase, $EnglishTable> {
  $$EnglishTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get surahNumber => $composableBuilder(
    column: $table.surahNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get verseNumber => $composableBuilder(
    column: $table.verseNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get verseKey => $composableBuilder(
    column: $table.verseKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get translationText => $composableBuilder(
    column: $table.translationText,
    builder: (column) => ColumnFilters(column),
  );
}

class $$EnglishTableOrderingComposer
    extends Composer<_$AppDatabase, $EnglishTable> {
  $$EnglishTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get surahNumber => $composableBuilder(
    column: $table.surahNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get verseNumber => $composableBuilder(
    column: $table.verseNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get verseKey => $composableBuilder(
    column: $table.verseKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get translationText => $composableBuilder(
    column: $table.translationText,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$EnglishTableAnnotationComposer
    extends Composer<_$AppDatabase, $EnglishTable> {
  $$EnglishTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get surahNumber => $composableBuilder(
    column: $table.surahNumber,
    builder: (column) => column,
  );

  GeneratedColumn<int> get verseNumber => $composableBuilder(
    column: $table.verseNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get verseKey =>
      $composableBuilder(column: $table.verseKey, builder: (column) => column);

  GeneratedColumn<String> get translationText => $composableBuilder(
    column: $table.translationText,
    builder: (column) => column,
  );
}

class $$EnglishTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EnglishTable,
          EnglishData,
          $$EnglishTableFilterComposer,
          $$EnglishTableOrderingComposer,
          $$EnglishTableAnnotationComposer,
          $$EnglishTableCreateCompanionBuilder,
          $$EnglishTableUpdateCompanionBuilder,
          (
            EnglishData,
            BaseReferences<_$AppDatabase, $EnglishTable, EnglishData>,
          ),
          EnglishData,
          PrefetchHooks Function()
        > {
  $$EnglishTableTableManager(_$AppDatabase db, $EnglishTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EnglishTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EnglishTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EnglishTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> surahNumber = const Value.absent(),
                Value<int> verseNumber = const Value.absent(),
                Value<String> verseKey = const Value.absent(),
                Value<String> translationText = const Value.absent(),
              }) => EnglishCompanion(
                id: id,
                surahNumber: surahNumber,
                verseNumber: verseNumber,
                verseKey: verseKey,
                translationText: translationText,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int surahNumber,
                required int verseNumber,
                required String verseKey,
                required String translationText,
              }) => EnglishCompanion.insert(
                id: id,
                surahNumber: surahNumber,
                verseNumber: verseNumber,
                verseKey: verseKey,
                translationText: translationText,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$EnglishTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EnglishTable,
      EnglishData,
      $$EnglishTableFilterComposer,
      $$EnglishTableOrderingComposer,
      $$EnglishTableAnnotationComposer,
      $$EnglishTableCreateCompanionBuilder,
      $$EnglishTableUpdateCompanionBuilder,
      (EnglishData, BaseReferences<_$AppDatabase, $EnglishTable, EnglishData>),
      EnglishData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SurahTableTableManager get surah =>
      $$SurahTableTableManager(_db, _db.surah);
  $$JuzuTableTableManager get juzu => $$JuzuTableTableManager(_db, _db.juzu);
  $$RukuTableTableManager get ruku => $$RukuTableTableManager(_db, _db.ruku);
  $$PageTableTableManager get page => $$PageTableTableManager(_db, _db.page);
  $$AyahTableTableManager get ayah => $$AyahTableTableManager(_db, _db.ayah);
  $$JapaneseTableTableManager get japanese =>
      $$JapaneseTableTableManager(_db, _db.japanese);
  $$EnglishTableTableManager get english =>
      $$EnglishTableTableManager(_db, _db.english);
}
