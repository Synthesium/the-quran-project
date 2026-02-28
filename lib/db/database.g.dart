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
  static const VerificationMeta _nameArabicMeta = const VerificationMeta(
    'nameArabic',
  );
  @override
  late final GeneratedColumn<String> nameArabic = GeneratedColumn<String>(
    'name_arabic',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
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
  static const VerificationMeta _nameTransliterationMeta =
      const VerificationMeta('nameTransliteration');
  @override
  late final GeneratedColumn<String> nameTransliteration =
      GeneratedColumn<String>(
        'name_transliteration',
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
  static const VerificationMeta _bismillahPreMeta = const VerificationMeta(
    'bismillahPre',
  );
  @override
  late final GeneratedColumn<int> bismillahPre = GeneratedColumn<int>(
    'bismillah_pre',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionShortMeta = const VerificationMeta(
    'descriptionShort',
  );
  @override
  late final GeneratedColumn<String> descriptionShort = GeneratedColumn<String>(
    'description_short',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    surahNumber,
    nameArabic,
    nameEnglish,
    nameTransliteration,
    totalVerses,
    revelationPlace,
    revelationOrder,
    bismillahPre,
    description,
    descriptionShort,
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
    if (data.containsKey('name_arabic')) {
      context.handle(
        _nameArabicMeta,
        nameArabic.isAcceptableOrUnknown(data['name_arabic']!, _nameArabicMeta),
      );
    } else if (isInserting) {
      context.missing(_nameArabicMeta);
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
    if (data.containsKey('name_transliteration')) {
      context.handle(
        _nameTransliterationMeta,
        nameTransliteration.isAcceptableOrUnknown(
          data['name_transliteration']!,
          _nameTransliterationMeta,
        ),
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
    if (data.containsKey('bismillah_pre')) {
      context.handle(
        _bismillahPreMeta,
        bismillahPre.isAcceptableOrUnknown(
          data['bismillah_pre']!,
          _bismillahPreMeta,
        ),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('description_short')) {
      context.handle(
        _descriptionShortMeta,
        descriptionShort.isAcceptableOrUnknown(
          data['description_short']!,
          _descriptionShortMeta,
        ),
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
      nameArabic: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_arabic'],
      )!,
      nameEnglish: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_english'],
      )!,
      nameTransliteration: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_transliteration'],
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
      bismillahPre: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}bismillah_pre'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      descriptionShort: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description_short'],
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
  final String nameArabic;
  final String nameEnglish;
  final String? nameTransliteration;
  final int totalVerses;
  final String? revelationPlace;
  final int? revelationOrder;
  final int bismillahPre;
  final String? description;
  final String? descriptionShort;
  const SurahData({
    required this.surahNumber,
    required this.nameArabic,
    required this.nameEnglish,
    this.nameTransliteration,
    required this.totalVerses,
    this.revelationPlace,
    this.revelationOrder,
    required this.bismillahPre,
    this.description,
    this.descriptionShort,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['surah_number'] = Variable<int>(surahNumber);
    map['name_arabic'] = Variable<String>(nameArabic);
    map['name_english'] = Variable<String>(nameEnglish);
    if (!nullToAbsent || nameTransliteration != null) {
      map['name_transliteration'] = Variable<String>(nameTransliteration);
    }
    map['total_verses'] = Variable<int>(totalVerses);
    if (!nullToAbsent || revelationPlace != null) {
      map['revelation_place'] = Variable<String>(revelationPlace);
    }
    if (!nullToAbsent || revelationOrder != null) {
      map['revelation_order'] = Variable<int>(revelationOrder);
    }
    map['bismillah_pre'] = Variable<int>(bismillahPre);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || descriptionShort != null) {
      map['description_short'] = Variable<String>(descriptionShort);
    }
    return map;
  }

  SurahCompanion toCompanion(bool nullToAbsent) {
    return SurahCompanion(
      surahNumber: Value(surahNumber),
      nameArabic: Value(nameArabic),
      nameEnglish: Value(nameEnglish),
      nameTransliteration: nameTransliteration == null && nullToAbsent
          ? const Value.absent()
          : Value(nameTransliteration),
      totalVerses: Value(totalVerses),
      revelationPlace: revelationPlace == null && nullToAbsent
          ? const Value.absent()
          : Value(revelationPlace),
      revelationOrder: revelationOrder == null && nullToAbsent
          ? const Value.absent()
          : Value(revelationOrder),
      bismillahPre: Value(bismillahPre),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      descriptionShort: descriptionShort == null && nullToAbsent
          ? const Value.absent()
          : Value(descriptionShort),
    );
  }

  factory SurahData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SurahData(
      surahNumber: serializer.fromJson<int>(json['surahNumber']),
      nameArabic: serializer.fromJson<String>(json['nameArabic']),
      nameEnglish: serializer.fromJson<String>(json['nameEnglish']),
      nameTransliteration: serializer.fromJson<String?>(
        json['nameTransliteration'],
      ),
      totalVerses: serializer.fromJson<int>(json['totalVerses']),
      revelationPlace: serializer.fromJson<String?>(json['revelationPlace']),
      revelationOrder: serializer.fromJson<int?>(json['revelationOrder']),
      bismillahPre: serializer.fromJson<int>(json['bismillahPre']),
      description: serializer.fromJson<String?>(json['description']),
      descriptionShort: serializer.fromJson<String?>(json['descriptionShort']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'surahNumber': serializer.toJson<int>(surahNumber),
      'nameArabic': serializer.toJson<String>(nameArabic),
      'nameEnglish': serializer.toJson<String>(nameEnglish),
      'nameTransliteration': serializer.toJson<String?>(nameTransliteration),
      'totalVerses': serializer.toJson<int>(totalVerses),
      'revelationPlace': serializer.toJson<String?>(revelationPlace),
      'revelationOrder': serializer.toJson<int?>(revelationOrder),
      'bismillahPre': serializer.toJson<int>(bismillahPre),
      'description': serializer.toJson<String?>(description),
      'descriptionShort': serializer.toJson<String?>(descriptionShort),
    };
  }

  SurahData copyWith({
    int? surahNumber,
    String? nameArabic,
    String? nameEnglish,
    Value<String?> nameTransliteration = const Value.absent(),
    int? totalVerses,
    Value<String?> revelationPlace = const Value.absent(),
    Value<int?> revelationOrder = const Value.absent(),
    int? bismillahPre,
    Value<String?> description = const Value.absent(),
    Value<String?> descriptionShort = const Value.absent(),
  }) => SurahData(
    surahNumber: surahNumber ?? this.surahNumber,
    nameArabic: nameArabic ?? this.nameArabic,
    nameEnglish: nameEnglish ?? this.nameEnglish,
    nameTransliteration: nameTransliteration.present
        ? nameTransliteration.value
        : this.nameTransliteration,
    totalVerses: totalVerses ?? this.totalVerses,
    revelationPlace: revelationPlace.present
        ? revelationPlace.value
        : this.revelationPlace,
    revelationOrder: revelationOrder.present
        ? revelationOrder.value
        : this.revelationOrder,
    bismillahPre: bismillahPre ?? this.bismillahPre,
    description: description.present ? description.value : this.description,
    descriptionShort: descriptionShort.present
        ? descriptionShort.value
        : this.descriptionShort,
  );
  SurahData copyWithCompanion(SurahCompanion data) {
    return SurahData(
      surahNumber: data.surahNumber.present
          ? data.surahNumber.value
          : this.surahNumber,
      nameArabic: data.nameArabic.present
          ? data.nameArabic.value
          : this.nameArabic,
      nameEnglish: data.nameEnglish.present
          ? data.nameEnglish.value
          : this.nameEnglish,
      nameTransliteration: data.nameTransliteration.present
          ? data.nameTransliteration.value
          : this.nameTransliteration,
      totalVerses: data.totalVerses.present
          ? data.totalVerses.value
          : this.totalVerses,
      revelationPlace: data.revelationPlace.present
          ? data.revelationPlace.value
          : this.revelationPlace,
      revelationOrder: data.revelationOrder.present
          ? data.revelationOrder.value
          : this.revelationOrder,
      bismillahPre: data.bismillahPre.present
          ? data.bismillahPre.value
          : this.bismillahPre,
      description: data.description.present
          ? data.description.value
          : this.description,
      descriptionShort: data.descriptionShort.present
          ? data.descriptionShort.value
          : this.descriptionShort,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SurahData(')
          ..write('surahNumber: $surahNumber, ')
          ..write('nameArabic: $nameArabic, ')
          ..write('nameEnglish: $nameEnglish, ')
          ..write('nameTransliteration: $nameTransliteration, ')
          ..write('totalVerses: $totalVerses, ')
          ..write('revelationPlace: $revelationPlace, ')
          ..write('revelationOrder: $revelationOrder, ')
          ..write('bismillahPre: $bismillahPre, ')
          ..write('description: $description, ')
          ..write('descriptionShort: $descriptionShort')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    surahNumber,
    nameArabic,
    nameEnglish,
    nameTransliteration,
    totalVerses,
    revelationPlace,
    revelationOrder,
    bismillahPre,
    description,
    descriptionShort,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SurahData &&
          other.surahNumber == this.surahNumber &&
          other.nameArabic == this.nameArabic &&
          other.nameEnglish == this.nameEnglish &&
          other.nameTransliteration == this.nameTransliteration &&
          other.totalVerses == this.totalVerses &&
          other.revelationPlace == this.revelationPlace &&
          other.revelationOrder == this.revelationOrder &&
          other.bismillahPre == this.bismillahPre &&
          other.description == this.description &&
          other.descriptionShort == this.descriptionShort);
}

class SurahCompanion extends UpdateCompanion<SurahData> {
  final Value<int> surahNumber;
  final Value<String> nameArabic;
  final Value<String> nameEnglish;
  final Value<String?> nameTransliteration;
  final Value<int> totalVerses;
  final Value<String?> revelationPlace;
  final Value<int?> revelationOrder;
  final Value<int> bismillahPre;
  final Value<String?> description;
  final Value<String?> descriptionShort;
  const SurahCompanion({
    this.surahNumber = const Value.absent(),
    this.nameArabic = const Value.absent(),
    this.nameEnglish = const Value.absent(),
    this.nameTransliteration = const Value.absent(),
    this.totalVerses = const Value.absent(),
    this.revelationPlace = const Value.absent(),
    this.revelationOrder = const Value.absent(),
    this.bismillahPre = const Value.absent(),
    this.description = const Value.absent(),
    this.descriptionShort = const Value.absent(),
  });
  SurahCompanion.insert({
    this.surahNumber = const Value.absent(),
    required String nameArabic,
    required String nameEnglish,
    this.nameTransliteration = const Value.absent(),
    required int totalVerses,
    this.revelationPlace = const Value.absent(),
    this.revelationOrder = const Value.absent(),
    this.bismillahPre = const Value.absent(),
    this.description = const Value.absent(),
    this.descriptionShort = const Value.absent(),
  }) : nameArabic = Value(nameArabic),
       nameEnglish = Value(nameEnglish),
       totalVerses = Value(totalVerses);
  static Insertable<SurahData> custom({
    Expression<int>? surahNumber,
    Expression<String>? nameArabic,
    Expression<String>? nameEnglish,
    Expression<String>? nameTransliteration,
    Expression<int>? totalVerses,
    Expression<String>? revelationPlace,
    Expression<int>? revelationOrder,
    Expression<int>? bismillahPre,
    Expression<String>? description,
    Expression<String>? descriptionShort,
  }) {
    return RawValuesInsertable({
      if (surahNumber != null) 'surah_number': surahNumber,
      if (nameArabic != null) 'name_arabic': nameArabic,
      if (nameEnglish != null) 'name_english': nameEnglish,
      if (nameTransliteration != null)
        'name_transliteration': nameTransliteration,
      if (totalVerses != null) 'total_verses': totalVerses,
      if (revelationPlace != null) 'revelation_place': revelationPlace,
      if (revelationOrder != null) 'revelation_order': revelationOrder,
      if (bismillahPre != null) 'bismillah_pre': bismillahPre,
      if (description != null) 'description': description,
      if (descriptionShort != null) 'description_short': descriptionShort,
    });
  }

  SurahCompanion copyWith({
    Value<int>? surahNumber,
    Value<String>? nameArabic,
    Value<String>? nameEnglish,
    Value<String?>? nameTransliteration,
    Value<int>? totalVerses,
    Value<String?>? revelationPlace,
    Value<int?>? revelationOrder,
    Value<int>? bismillahPre,
    Value<String?>? description,
    Value<String?>? descriptionShort,
  }) {
    return SurahCompanion(
      surahNumber: surahNumber ?? this.surahNumber,
      nameArabic: nameArabic ?? this.nameArabic,
      nameEnglish: nameEnglish ?? this.nameEnglish,
      nameTransliteration: nameTransliteration ?? this.nameTransliteration,
      totalVerses: totalVerses ?? this.totalVerses,
      revelationPlace: revelationPlace ?? this.revelationPlace,
      revelationOrder: revelationOrder ?? this.revelationOrder,
      bismillahPre: bismillahPre ?? this.bismillahPre,
      description: description ?? this.description,
      descriptionShort: descriptionShort ?? this.descriptionShort,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (surahNumber.present) {
      map['surah_number'] = Variable<int>(surahNumber.value);
    }
    if (nameArabic.present) {
      map['name_arabic'] = Variable<String>(nameArabic.value);
    }
    if (nameEnglish.present) {
      map['name_english'] = Variable<String>(nameEnglish.value);
    }
    if (nameTransliteration.present) {
      map['name_transliteration'] = Variable<String>(nameTransliteration.value);
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
    if (bismillahPre.present) {
      map['bismillah_pre'] = Variable<int>(bismillahPre.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (descriptionShort.present) {
      map['description_short'] = Variable<String>(descriptionShort.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SurahCompanion(')
          ..write('surahNumber: $surahNumber, ')
          ..write('nameArabic: $nameArabic, ')
          ..write('nameEnglish: $nameEnglish, ')
          ..write('nameTransliteration: $nameTransliteration, ')
          ..write('totalVerses: $totalVerses, ')
          ..write('revelationPlace: $revelationPlace, ')
          ..write('revelationOrder: $revelationOrder, ')
          ..write('bismillahPre: $bismillahPre, ')
          ..write('description: $description, ')
          ..write('descriptionShort: $descriptionShort')
          ..write(')'))
        .toString();
  }
}

class $JuzTable extends Juz with TableInfo<$JuzTable, JuzData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $JuzTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _juzNumberMeta = const VerificationMeta(
    'juzNumber',
  );
  @override
  late final GeneratedColumn<int> juzNumber = GeneratedColumn<int>(
    'juz_number',
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
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _firstVerseKeyMeta = const VerificationMeta(
    'firstVerseKey',
  );
  @override
  late final GeneratedColumn<String> firstVerseKey = GeneratedColumn<String>(
    'first_verse_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastVerseKeyMeta = const VerificationMeta(
    'lastVerseKey',
  );
  @override
  late final GeneratedColumn<String> lastVerseKey = GeneratedColumn<String>(
    'last_verse_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _versesCountMeta = const VerificationMeta(
    'versesCount',
  );
  @override
  late final GeneratedColumn<int> versesCount = GeneratedColumn<int>(
    'verses_count',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    juzNumber,
    arabicName,
    firstVerseKey,
    lastVerseKey,
    versesCount,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'juz';
  @override
  VerificationContext validateIntegrity(
    Insertable<JuzData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('juz_number')) {
      context.handle(
        _juzNumberMeta,
        juzNumber.isAcceptableOrUnknown(data['juz_number']!, _juzNumberMeta),
      );
    }
    if (data.containsKey('arabic_name')) {
      context.handle(
        _arabicNameMeta,
        arabicName.isAcceptableOrUnknown(data['arabic_name']!, _arabicNameMeta),
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
    } else if (isInserting) {
      context.missing(_firstVerseKeyMeta);
    }
    if (data.containsKey('last_verse_key')) {
      context.handle(
        _lastVerseKeyMeta,
        lastVerseKey.isAcceptableOrUnknown(
          data['last_verse_key']!,
          _lastVerseKeyMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lastVerseKeyMeta);
    }
    if (data.containsKey('verses_count')) {
      context.handle(
        _versesCountMeta,
        versesCount.isAcceptableOrUnknown(
          data['verses_count']!,
          _versesCountMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {juzNumber};
  @override
  JuzData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return JuzData(
      juzNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}juz_number'],
      )!,
      arabicName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}arabic_name'],
      ),
      firstVerseKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}first_verse_key'],
      )!,
      lastVerseKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_verse_key'],
      )!,
      versesCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}verses_count'],
      ),
    );
  }

  @override
  $JuzTable createAlias(String alias) {
    return $JuzTable(attachedDatabase, alias);
  }
}

class JuzData extends DataClass implements Insertable<JuzData> {
  final int juzNumber;
  final String? arabicName;
  final String firstVerseKey;
  final String lastVerseKey;
  final int? versesCount;
  const JuzData({
    required this.juzNumber,
    this.arabicName,
    required this.firstVerseKey,
    required this.lastVerseKey,
    this.versesCount,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['juz_number'] = Variable<int>(juzNumber);
    if (!nullToAbsent || arabicName != null) {
      map['arabic_name'] = Variable<String>(arabicName);
    }
    map['first_verse_key'] = Variable<String>(firstVerseKey);
    map['last_verse_key'] = Variable<String>(lastVerseKey);
    if (!nullToAbsent || versesCount != null) {
      map['verses_count'] = Variable<int>(versesCount);
    }
    return map;
  }

  JuzCompanion toCompanion(bool nullToAbsent) {
    return JuzCompanion(
      juzNumber: Value(juzNumber),
      arabicName: arabicName == null && nullToAbsent
          ? const Value.absent()
          : Value(arabicName),
      firstVerseKey: Value(firstVerseKey),
      lastVerseKey: Value(lastVerseKey),
      versesCount: versesCount == null && nullToAbsent
          ? const Value.absent()
          : Value(versesCount),
    );
  }

  factory JuzData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return JuzData(
      juzNumber: serializer.fromJson<int>(json['juzNumber']),
      arabicName: serializer.fromJson<String?>(json['arabicName']),
      firstVerseKey: serializer.fromJson<String>(json['firstVerseKey']),
      lastVerseKey: serializer.fromJson<String>(json['lastVerseKey']),
      versesCount: serializer.fromJson<int?>(json['versesCount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'juzNumber': serializer.toJson<int>(juzNumber),
      'arabicName': serializer.toJson<String?>(arabicName),
      'firstVerseKey': serializer.toJson<String>(firstVerseKey),
      'lastVerseKey': serializer.toJson<String>(lastVerseKey),
      'versesCount': serializer.toJson<int?>(versesCount),
    };
  }

  JuzData copyWith({
    int? juzNumber,
    Value<String?> arabicName = const Value.absent(),
    String? firstVerseKey,
    String? lastVerseKey,
    Value<int?> versesCount = const Value.absent(),
  }) => JuzData(
    juzNumber: juzNumber ?? this.juzNumber,
    arabicName: arabicName.present ? arabicName.value : this.arabicName,
    firstVerseKey: firstVerseKey ?? this.firstVerseKey,
    lastVerseKey: lastVerseKey ?? this.lastVerseKey,
    versesCount: versesCount.present ? versesCount.value : this.versesCount,
  );
  JuzData copyWithCompanion(JuzCompanion data) {
    return JuzData(
      juzNumber: data.juzNumber.present ? data.juzNumber.value : this.juzNumber,
      arabicName: data.arabicName.present
          ? data.arabicName.value
          : this.arabicName,
      firstVerseKey: data.firstVerseKey.present
          ? data.firstVerseKey.value
          : this.firstVerseKey,
      lastVerseKey: data.lastVerseKey.present
          ? data.lastVerseKey.value
          : this.lastVerseKey,
      versesCount: data.versesCount.present
          ? data.versesCount.value
          : this.versesCount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('JuzData(')
          ..write('juzNumber: $juzNumber, ')
          ..write('arabicName: $arabicName, ')
          ..write('firstVerseKey: $firstVerseKey, ')
          ..write('lastVerseKey: $lastVerseKey, ')
          ..write('versesCount: $versesCount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    juzNumber,
    arabicName,
    firstVerseKey,
    lastVerseKey,
    versesCount,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is JuzData &&
          other.juzNumber == this.juzNumber &&
          other.arabicName == this.arabicName &&
          other.firstVerseKey == this.firstVerseKey &&
          other.lastVerseKey == this.lastVerseKey &&
          other.versesCount == this.versesCount);
}

class JuzCompanion extends UpdateCompanion<JuzData> {
  final Value<int> juzNumber;
  final Value<String?> arabicName;
  final Value<String> firstVerseKey;
  final Value<String> lastVerseKey;
  final Value<int?> versesCount;
  const JuzCompanion({
    this.juzNumber = const Value.absent(),
    this.arabicName = const Value.absent(),
    this.firstVerseKey = const Value.absent(),
    this.lastVerseKey = const Value.absent(),
    this.versesCount = const Value.absent(),
  });
  JuzCompanion.insert({
    this.juzNumber = const Value.absent(),
    this.arabicName = const Value.absent(),
    required String firstVerseKey,
    required String lastVerseKey,
    this.versesCount = const Value.absent(),
  }) : firstVerseKey = Value(firstVerseKey),
       lastVerseKey = Value(lastVerseKey);
  static Insertable<JuzData> custom({
    Expression<int>? juzNumber,
    Expression<String>? arabicName,
    Expression<String>? firstVerseKey,
    Expression<String>? lastVerseKey,
    Expression<int>? versesCount,
  }) {
    return RawValuesInsertable({
      if (juzNumber != null) 'juz_number': juzNumber,
      if (arabicName != null) 'arabic_name': arabicName,
      if (firstVerseKey != null) 'first_verse_key': firstVerseKey,
      if (lastVerseKey != null) 'last_verse_key': lastVerseKey,
      if (versesCount != null) 'verses_count': versesCount,
    });
  }

  JuzCompanion copyWith({
    Value<int>? juzNumber,
    Value<String?>? arabicName,
    Value<String>? firstVerseKey,
    Value<String>? lastVerseKey,
    Value<int?>? versesCount,
  }) {
    return JuzCompanion(
      juzNumber: juzNumber ?? this.juzNumber,
      arabicName: arabicName ?? this.arabicName,
      firstVerseKey: firstVerseKey ?? this.firstVerseKey,
      lastVerseKey: lastVerseKey ?? this.lastVerseKey,
      versesCount: versesCount ?? this.versesCount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (juzNumber.present) {
      map['juz_number'] = Variable<int>(juzNumber.value);
    }
    if (arabicName.present) {
      map['arabic_name'] = Variable<String>(arabicName.value);
    }
    if (firstVerseKey.present) {
      map['first_verse_key'] = Variable<String>(firstVerseKey.value);
    }
    if (lastVerseKey.present) {
      map['last_verse_key'] = Variable<String>(lastVerseKey.value);
    }
    if (versesCount.present) {
      map['verses_count'] = Variable<int>(versesCount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JuzCompanion(')
          ..write('juzNumber: $juzNumber, ')
          ..write('arabicName: $arabicName, ')
          ..write('firstVerseKey: $firstVerseKey, ')
          ..write('lastVerseKey: $lastVerseKey, ')
          ..write('versesCount: $versesCount')
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
  static const VerificationMeta _surahRukuNumberMeta = const VerificationMeta(
    'surahRukuNumber',
  );
  @override
  late final GeneratedColumn<int> surahRukuNumber = GeneratedColumn<int>(
    'surah_ruku_number',
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
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastVerseKeyMeta = const VerificationMeta(
    'lastVerseKey',
  );
  @override
  late final GeneratedColumn<String> lastVerseKey = GeneratedColumn<String>(
    'last_verse_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _versesCountMeta = const VerificationMeta(
    'versesCount',
  );
  @override
  late final GeneratedColumn<int> versesCount = GeneratedColumn<int>(
    'verses_count',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    rukuNumber,
    surahNumber,
    surahRukuNumber,
    firstVerseKey,
    lastVerseKey,
    versesCount,
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
    if (data.containsKey('surah_ruku_number')) {
      context.handle(
        _surahRukuNumberMeta,
        surahRukuNumber.isAcceptableOrUnknown(
          data['surah_ruku_number']!,
          _surahRukuNumberMeta,
        ),
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
    } else if (isInserting) {
      context.missing(_firstVerseKeyMeta);
    }
    if (data.containsKey('last_verse_key')) {
      context.handle(
        _lastVerseKeyMeta,
        lastVerseKey.isAcceptableOrUnknown(
          data['last_verse_key']!,
          _lastVerseKeyMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lastVerseKeyMeta);
    }
    if (data.containsKey('verses_count')) {
      context.handle(
        _versesCountMeta,
        versesCount.isAcceptableOrUnknown(
          data['verses_count']!,
          _versesCountMeta,
        ),
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
      surahRukuNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}surah_ruku_number'],
      ),
      firstVerseKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}first_verse_key'],
      )!,
      lastVerseKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_verse_key'],
      )!,
      versesCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}verses_count'],
      ),
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
  final int? surahRukuNumber;
  final String firstVerseKey;
  final String lastVerseKey;
  final int? versesCount;
  const RukuData({
    required this.rukuNumber,
    required this.surahNumber,
    this.surahRukuNumber,
    required this.firstVerseKey,
    required this.lastVerseKey,
    this.versesCount,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['ruku_number'] = Variable<int>(rukuNumber);
    map['surah_number'] = Variable<int>(surahNumber);
    if (!nullToAbsent || surahRukuNumber != null) {
      map['surah_ruku_number'] = Variable<int>(surahRukuNumber);
    }
    map['first_verse_key'] = Variable<String>(firstVerseKey);
    map['last_verse_key'] = Variable<String>(lastVerseKey);
    if (!nullToAbsent || versesCount != null) {
      map['verses_count'] = Variable<int>(versesCount);
    }
    return map;
  }

  RukuCompanion toCompanion(bool nullToAbsent) {
    return RukuCompanion(
      rukuNumber: Value(rukuNumber),
      surahNumber: Value(surahNumber),
      surahRukuNumber: surahRukuNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(surahRukuNumber),
      firstVerseKey: Value(firstVerseKey),
      lastVerseKey: Value(lastVerseKey),
      versesCount: versesCount == null && nullToAbsent
          ? const Value.absent()
          : Value(versesCount),
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
      surahRukuNumber: serializer.fromJson<int?>(json['surahRukuNumber']),
      firstVerseKey: serializer.fromJson<String>(json['firstVerseKey']),
      lastVerseKey: serializer.fromJson<String>(json['lastVerseKey']),
      versesCount: serializer.fromJson<int?>(json['versesCount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'rukuNumber': serializer.toJson<int>(rukuNumber),
      'surahNumber': serializer.toJson<int>(surahNumber),
      'surahRukuNumber': serializer.toJson<int?>(surahRukuNumber),
      'firstVerseKey': serializer.toJson<String>(firstVerseKey),
      'lastVerseKey': serializer.toJson<String>(lastVerseKey),
      'versesCount': serializer.toJson<int?>(versesCount),
    };
  }

  RukuData copyWith({
    int? rukuNumber,
    int? surahNumber,
    Value<int?> surahRukuNumber = const Value.absent(),
    String? firstVerseKey,
    String? lastVerseKey,
    Value<int?> versesCount = const Value.absent(),
  }) => RukuData(
    rukuNumber: rukuNumber ?? this.rukuNumber,
    surahNumber: surahNumber ?? this.surahNumber,
    surahRukuNumber: surahRukuNumber.present
        ? surahRukuNumber.value
        : this.surahRukuNumber,
    firstVerseKey: firstVerseKey ?? this.firstVerseKey,
    lastVerseKey: lastVerseKey ?? this.lastVerseKey,
    versesCount: versesCount.present ? versesCount.value : this.versesCount,
  );
  RukuData copyWithCompanion(RukuCompanion data) {
    return RukuData(
      rukuNumber: data.rukuNumber.present
          ? data.rukuNumber.value
          : this.rukuNumber,
      surahNumber: data.surahNumber.present
          ? data.surahNumber.value
          : this.surahNumber,
      surahRukuNumber: data.surahRukuNumber.present
          ? data.surahRukuNumber.value
          : this.surahRukuNumber,
      firstVerseKey: data.firstVerseKey.present
          ? data.firstVerseKey.value
          : this.firstVerseKey,
      lastVerseKey: data.lastVerseKey.present
          ? data.lastVerseKey.value
          : this.lastVerseKey,
      versesCount: data.versesCount.present
          ? data.versesCount.value
          : this.versesCount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RukuData(')
          ..write('rukuNumber: $rukuNumber, ')
          ..write('surahNumber: $surahNumber, ')
          ..write('surahRukuNumber: $surahRukuNumber, ')
          ..write('firstVerseKey: $firstVerseKey, ')
          ..write('lastVerseKey: $lastVerseKey, ')
          ..write('versesCount: $versesCount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    rukuNumber,
    surahNumber,
    surahRukuNumber,
    firstVerseKey,
    lastVerseKey,
    versesCount,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RukuData &&
          other.rukuNumber == this.rukuNumber &&
          other.surahNumber == this.surahNumber &&
          other.surahRukuNumber == this.surahRukuNumber &&
          other.firstVerseKey == this.firstVerseKey &&
          other.lastVerseKey == this.lastVerseKey &&
          other.versesCount == this.versesCount);
}

class RukuCompanion extends UpdateCompanion<RukuData> {
  final Value<int> rukuNumber;
  final Value<int> surahNumber;
  final Value<int?> surahRukuNumber;
  final Value<String> firstVerseKey;
  final Value<String> lastVerseKey;
  final Value<int?> versesCount;
  const RukuCompanion({
    this.rukuNumber = const Value.absent(),
    this.surahNumber = const Value.absent(),
    this.surahRukuNumber = const Value.absent(),
    this.firstVerseKey = const Value.absent(),
    this.lastVerseKey = const Value.absent(),
    this.versesCount = const Value.absent(),
  });
  RukuCompanion.insert({
    this.rukuNumber = const Value.absent(),
    required int surahNumber,
    this.surahRukuNumber = const Value.absent(),
    required String firstVerseKey,
    required String lastVerseKey,
    this.versesCount = const Value.absent(),
  }) : surahNumber = Value(surahNumber),
       firstVerseKey = Value(firstVerseKey),
       lastVerseKey = Value(lastVerseKey);
  static Insertable<RukuData> custom({
    Expression<int>? rukuNumber,
    Expression<int>? surahNumber,
    Expression<int>? surahRukuNumber,
    Expression<String>? firstVerseKey,
    Expression<String>? lastVerseKey,
    Expression<int>? versesCount,
  }) {
    return RawValuesInsertable({
      if (rukuNumber != null) 'ruku_number': rukuNumber,
      if (surahNumber != null) 'surah_number': surahNumber,
      if (surahRukuNumber != null) 'surah_ruku_number': surahRukuNumber,
      if (firstVerseKey != null) 'first_verse_key': firstVerseKey,
      if (lastVerseKey != null) 'last_verse_key': lastVerseKey,
      if (versesCount != null) 'verses_count': versesCount,
    });
  }

  RukuCompanion copyWith({
    Value<int>? rukuNumber,
    Value<int>? surahNumber,
    Value<int?>? surahRukuNumber,
    Value<String>? firstVerseKey,
    Value<String>? lastVerseKey,
    Value<int?>? versesCount,
  }) {
    return RukuCompanion(
      rukuNumber: rukuNumber ?? this.rukuNumber,
      surahNumber: surahNumber ?? this.surahNumber,
      surahRukuNumber: surahRukuNumber ?? this.surahRukuNumber,
      firstVerseKey: firstVerseKey ?? this.firstVerseKey,
      lastVerseKey: lastVerseKey ?? this.lastVerseKey,
      versesCount: versesCount ?? this.versesCount,
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
    if (surahRukuNumber.present) {
      map['surah_ruku_number'] = Variable<int>(surahRukuNumber.value);
    }
    if (firstVerseKey.present) {
      map['first_verse_key'] = Variable<String>(firstVerseKey.value);
    }
    if (lastVerseKey.present) {
      map['last_verse_key'] = Variable<String>(lastVerseKey.value);
    }
    if (versesCount.present) {
      map['verses_count'] = Variable<int>(versesCount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RukuCompanion(')
          ..write('rukuNumber: $rukuNumber, ')
          ..write('surahNumber: $surahNumber, ')
          ..write('surahRukuNumber: $surahRukuNumber, ')
          ..write('firstVerseKey: $firstVerseKey, ')
          ..write('lastVerseKey: $lastVerseKey, ')
          ..write('versesCount: $versesCount')
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
  static const VerificationMeta _juzNumberMeta = const VerificationMeta(
    'juzNumber',
  );
  @override
  late final GeneratedColumn<int> juzNumber = GeneratedColumn<int>(
    'juz_number',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES juz (juz_number)',
    ),
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
  @override
  List<GeneratedColumn> get $columns => [
    id,
    surahNumber,
    verseNumber,
    verseKey,
    arabic,
    pageNumber,
    juzNumber,
    rukuNumber,
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
    if (data.containsKey('juz_number')) {
      context.handle(
        _juzNumberMeta,
        juzNumber.isAcceptableOrUnknown(data['juz_number']!, _juzNumberMeta),
      );
    }
    if (data.containsKey('ruku_number')) {
      context.handle(
        _rukuNumberMeta,
        rukuNumber.isAcceptableOrUnknown(data['ruku_number']!, _rukuNumberMeta),
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
      juzNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}juz_number'],
      ),
      rukuNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ruku_number'],
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
  final int? juzNumber;
  final int? rukuNumber;
  const AyahData({
    required this.id,
    required this.surahNumber,
    required this.verseNumber,
    required this.verseKey,
    required this.arabic,
    this.pageNumber,
    this.juzNumber,
    this.rukuNumber,
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
    if (!nullToAbsent || juzNumber != null) {
      map['juz_number'] = Variable<int>(juzNumber);
    }
    if (!nullToAbsent || rukuNumber != null) {
      map['ruku_number'] = Variable<int>(rukuNumber);
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
      juzNumber: juzNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(juzNumber),
      rukuNumber: rukuNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(rukuNumber),
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
      juzNumber: serializer.fromJson<int?>(json['juzNumber']),
      rukuNumber: serializer.fromJson<int?>(json['rukuNumber']),
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
      'juzNumber': serializer.toJson<int?>(juzNumber),
      'rukuNumber': serializer.toJson<int?>(rukuNumber),
    };
  }

  AyahData copyWith({
    int? id,
    int? surahNumber,
    int? verseNumber,
    String? verseKey,
    String? arabic,
    Value<int?> pageNumber = const Value.absent(),
    Value<int?> juzNumber = const Value.absent(),
    Value<int?> rukuNumber = const Value.absent(),
  }) => AyahData(
    id: id ?? this.id,
    surahNumber: surahNumber ?? this.surahNumber,
    verseNumber: verseNumber ?? this.verseNumber,
    verseKey: verseKey ?? this.verseKey,
    arabic: arabic ?? this.arabic,
    pageNumber: pageNumber.present ? pageNumber.value : this.pageNumber,
    juzNumber: juzNumber.present ? juzNumber.value : this.juzNumber,
    rukuNumber: rukuNumber.present ? rukuNumber.value : this.rukuNumber,
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
      juzNumber: data.juzNumber.present ? data.juzNumber.value : this.juzNumber,
      rukuNumber: data.rukuNumber.present
          ? data.rukuNumber.value
          : this.rukuNumber,
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
          ..write('juzNumber: $juzNumber, ')
          ..write('rukuNumber: $rukuNumber')
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
    juzNumber,
    rukuNumber,
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
          other.juzNumber == this.juzNumber &&
          other.rukuNumber == this.rukuNumber);
}

class AyahCompanion extends UpdateCompanion<AyahData> {
  final Value<int> id;
  final Value<int> surahNumber;
  final Value<int> verseNumber;
  final Value<String> verseKey;
  final Value<String> arabic;
  final Value<int?> pageNumber;
  final Value<int?> juzNumber;
  final Value<int?> rukuNumber;
  const AyahCompanion({
    this.id = const Value.absent(),
    this.surahNumber = const Value.absent(),
    this.verseNumber = const Value.absent(),
    this.verseKey = const Value.absent(),
    this.arabic = const Value.absent(),
    this.pageNumber = const Value.absent(),
    this.juzNumber = const Value.absent(),
    this.rukuNumber = const Value.absent(),
  });
  AyahCompanion.insert({
    this.id = const Value.absent(),
    required int surahNumber,
    required int verseNumber,
    required String verseKey,
    required String arabic,
    this.pageNumber = const Value.absent(),
    this.juzNumber = const Value.absent(),
    this.rukuNumber = const Value.absent(),
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
    Expression<int>? juzNumber,
    Expression<int>? rukuNumber,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (surahNumber != null) 'surah_number': surahNumber,
      if (verseNumber != null) 'verse_number': verseNumber,
      if (verseKey != null) 'verse_key': verseKey,
      if (arabic != null) 'arabic': arabic,
      if (pageNumber != null) 'page_number': pageNumber,
      if (juzNumber != null) 'juz_number': juzNumber,
      if (rukuNumber != null) 'ruku_number': rukuNumber,
    });
  }

  AyahCompanion copyWith({
    Value<int>? id,
    Value<int>? surahNumber,
    Value<int>? verseNumber,
    Value<String>? verseKey,
    Value<String>? arabic,
    Value<int?>? pageNumber,
    Value<int?>? juzNumber,
    Value<int?>? rukuNumber,
  }) {
    return AyahCompanion(
      id: id ?? this.id,
      surahNumber: surahNumber ?? this.surahNumber,
      verseNumber: verseNumber ?? this.verseNumber,
      verseKey: verseKey ?? this.verseKey,
      arabic: arabic ?? this.arabic,
      pageNumber: pageNumber ?? this.pageNumber,
      juzNumber: juzNumber ?? this.juzNumber,
      rukuNumber: rukuNumber ?? this.rukuNumber,
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
    if (juzNumber.present) {
      map['juz_number'] = Variable<int>(juzNumber.value);
    }
    if (rukuNumber.present) {
      map['ruku_number'] = Variable<int>(rukuNumber.value);
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
          ..write('juzNumber: $juzNumber, ')
          ..write('rukuNumber: $rukuNumber')
          ..write(')'))
        .toString();
  }
}

class $WordTable extends Word with TableInfo<$WordTable, WordData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WordTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
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
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES ayah (verse_key)',
    ),
  );
  static const VerificationMeta _wordNumberMeta = const VerificationMeta(
    'wordNumber',
  );
  @override
  late final GeneratedColumn<int> wordNumber = GeneratedColumn<int>(
    'word_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _wordTextMeta = const VerificationMeta(
    'wordText',
  );
  @override
  late final GeneratedColumn<String> wordText = GeneratedColumn<String>(
    'text',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, verseKey, wordNumber, wordText];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'word';
  @override
  VerificationContext validateIntegrity(
    Insertable<WordData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('verse_key')) {
      context.handle(
        _verseKeyMeta,
        verseKey.isAcceptableOrUnknown(data['verse_key']!, _verseKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_verseKeyMeta);
    }
    if (data.containsKey('word_number')) {
      context.handle(
        _wordNumberMeta,
        wordNumber.isAcceptableOrUnknown(data['word_number']!, _wordNumberMeta),
      );
    } else if (isInserting) {
      context.missing(_wordNumberMeta);
    }
    if (data.containsKey('text')) {
      context.handle(
        _wordTextMeta,
        wordText.isAcceptableOrUnknown(data['text']!, _wordTextMeta),
      );
    } else if (isInserting) {
      context.missing(_wordTextMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WordData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WordData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      verseKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}verse_key'],
      )!,
      wordNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}word_number'],
      )!,
      wordText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}text'],
      )!,
    );
  }

  @override
  $WordTable createAlias(String alias) {
    return $WordTable(attachedDatabase, alias);
  }
}

class WordData extends DataClass implements Insertable<WordData> {
  final int id;
  final String verseKey;
  final int wordNumber;
  final String wordText;
  const WordData({
    required this.id,
    required this.verseKey,
    required this.wordNumber,
    required this.wordText,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['verse_key'] = Variable<String>(verseKey);
    map['word_number'] = Variable<int>(wordNumber);
    map['text'] = Variable<String>(wordText);
    return map;
  }

  WordCompanion toCompanion(bool nullToAbsent) {
    return WordCompanion(
      id: Value(id),
      verseKey: Value(verseKey),
      wordNumber: Value(wordNumber),
      wordText: Value(wordText),
    );
  }

  factory WordData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WordData(
      id: serializer.fromJson<int>(json['id']),
      verseKey: serializer.fromJson<String>(json['verseKey']),
      wordNumber: serializer.fromJson<int>(json['wordNumber']),
      wordText: serializer.fromJson<String>(json['wordText']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'verseKey': serializer.toJson<String>(verseKey),
      'wordNumber': serializer.toJson<int>(wordNumber),
      'wordText': serializer.toJson<String>(wordText),
    };
  }

  WordData copyWith({
    int? id,
    String? verseKey,
    int? wordNumber,
    String? wordText,
  }) => WordData(
    id: id ?? this.id,
    verseKey: verseKey ?? this.verseKey,
    wordNumber: wordNumber ?? this.wordNumber,
    wordText: wordText ?? this.wordText,
  );
  WordData copyWithCompanion(WordCompanion data) {
    return WordData(
      id: data.id.present ? data.id.value : this.id,
      verseKey: data.verseKey.present ? data.verseKey.value : this.verseKey,
      wordNumber: data.wordNumber.present
          ? data.wordNumber.value
          : this.wordNumber,
      wordText: data.wordText.present ? data.wordText.value : this.wordText,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WordData(')
          ..write('id: $id, ')
          ..write('verseKey: $verseKey, ')
          ..write('wordNumber: $wordNumber, ')
          ..write('wordText: $wordText')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, verseKey, wordNumber, wordText);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WordData &&
          other.id == this.id &&
          other.verseKey == this.verseKey &&
          other.wordNumber == this.wordNumber &&
          other.wordText == this.wordText);
}

class WordCompanion extends UpdateCompanion<WordData> {
  final Value<int> id;
  final Value<String> verseKey;
  final Value<int> wordNumber;
  final Value<String> wordText;
  const WordCompanion({
    this.id = const Value.absent(),
    this.verseKey = const Value.absent(),
    this.wordNumber = const Value.absent(),
    this.wordText = const Value.absent(),
  });
  WordCompanion.insert({
    this.id = const Value.absent(),
    required String verseKey,
    required int wordNumber,
    required String wordText,
  }) : verseKey = Value(verseKey),
       wordNumber = Value(wordNumber),
       wordText = Value(wordText);
  static Insertable<WordData> custom({
    Expression<int>? id,
    Expression<String>? verseKey,
    Expression<int>? wordNumber,
    Expression<String>? wordText,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (verseKey != null) 'verse_key': verseKey,
      if (wordNumber != null) 'word_number': wordNumber,
      if (wordText != null) 'text': wordText,
    });
  }

  WordCompanion copyWith({
    Value<int>? id,
    Value<String>? verseKey,
    Value<int>? wordNumber,
    Value<String>? wordText,
  }) {
    return WordCompanion(
      id: id ?? this.id,
      verseKey: verseKey ?? this.verseKey,
      wordNumber: wordNumber ?? this.wordNumber,
      wordText: wordText ?? this.wordText,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (verseKey.present) {
      map['verse_key'] = Variable<String>(verseKey.value);
    }
    if (wordNumber.present) {
      map['word_number'] = Variable<int>(wordNumber.value);
    }
    if (wordText.present) {
      map['text'] = Variable<String>(wordText.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WordCompanion(')
          ..write('id: $id, ')
          ..write('verseKey: $verseKey, ')
          ..write('wordNumber: $wordNumber, ')
          ..write('wordText: $wordText')
          ..write(')'))
        .toString();
  }
}

class $PageLineTable extends PageLine
    with TableInfo<$PageLineTable, PageLineData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PageLineTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _pageNumberMeta = const VerificationMeta(
    'pageNumber',
  );
  @override
  late final GeneratedColumn<int> pageNumber = GeneratedColumn<int>(
    'page_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lineNumberMeta = const VerificationMeta(
    'lineNumber',
  );
  @override
  late final GeneratedColumn<int> lineNumber = GeneratedColumn<int>(
    'line_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lineTypeMeta = const VerificationMeta(
    'lineType',
  );
  @override
  late final GeneratedColumn<String> lineType = GeneratedColumn<String>(
    'line_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isCenteredMeta = const VerificationMeta(
    'isCentered',
  );
  @override
  late final GeneratedColumn<int> isCentered = GeneratedColumn<int>(
    'is_centered',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _lineTextMeta = const VerificationMeta(
    'lineText',
  );
  @override
  late final GeneratedColumn<String> lineText = GeneratedColumn<String>(
    'line_text',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _surahNumberMeta = const VerificationMeta(
    'surahNumber',
  );
  @override
  late final GeneratedColumn<int> surahNumber = GeneratedColumn<int>(
    'surah_number',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    pageNumber,
    lineNumber,
    lineType,
    isCentered,
    lineText,
    surahNumber,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'page_line';
  @override
  VerificationContext validateIntegrity(
    Insertable<PageLineData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('page_number')) {
      context.handle(
        _pageNumberMeta,
        pageNumber.isAcceptableOrUnknown(data['page_number']!, _pageNumberMeta),
      );
    } else if (isInserting) {
      context.missing(_pageNumberMeta);
    }
    if (data.containsKey('line_number')) {
      context.handle(
        _lineNumberMeta,
        lineNumber.isAcceptableOrUnknown(data['line_number']!, _lineNumberMeta),
      );
    } else if (isInserting) {
      context.missing(_lineNumberMeta);
    }
    if (data.containsKey('line_type')) {
      context.handle(
        _lineTypeMeta,
        lineType.isAcceptableOrUnknown(data['line_type']!, _lineTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_lineTypeMeta);
    }
    if (data.containsKey('is_centered')) {
      context.handle(
        _isCenteredMeta,
        isCentered.isAcceptableOrUnknown(data['is_centered']!, _isCenteredMeta),
      );
    }
    if (data.containsKey('line_text')) {
      context.handle(
        _lineTextMeta,
        lineText.isAcceptableOrUnknown(data['line_text']!, _lineTextMeta),
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
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {pageNumber, lineNumber};
  @override
  PageLineData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PageLineData(
      pageNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}page_number'],
      )!,
      lineNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}line_number'],
      )!,
      lineType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}line_type'],
      )!,
      isCentered: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}is_centered'],
      )!,
      lineText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}line_text'],
      ),
      surahNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}surah_number'],
      ),
    );
  }

  @override
  $PageLineTable createAlias(String alias) {
    return $PageLineTable(attachedDatabase, alias);
  }
}

class PageLineData extends DataClass implements Insertable<PageLineData> {
  final int pageNumber;
  final int lineNumber;
  final String lineType;
  final int isCentered;

  /// The actual Arabic text to render for this line
  final String? lineText;
  final int? surahNumber;
  const PageLineData({
    required this.pageNumber,
    required this.lineNumber,
    required this.lineType,
    required this.isCentered,
    this.lineText,
    this.surahNumber,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['page_number'] = Variable<int>(pageNumber);
    map['line_number'] = Variable<int>(lineNumber);
    map['line_type'] = Variable<String>(lineType);
    map['is_centered'] = Variable<int>(isCentered);
    if (!nullToAbsent || lineText != null) {
      map['line_text'] = Variable<String>(lineText);
    }
    if (!nullToAbsent || surahNumber != null) {
      map['surah_number'] = Variable<int>(surahNumber);
    }
    return map;
  }

  PageLineCompanion toCompanion(bool nullToAbsent) {
    return PageLineCompanion(
      pageNumber: Value(pageNumber),
      lineNumber: Value(lineNumber),
      lineType: Value(lineType),
      isCentered: Value(isCentered),
      lineText: lineText == null && nullToAbsent
          ? const Value.absent()
          : Value(lineText),
      surahNumber: surahNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(surahNumber),
    );
  }

  factory PageLineData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PageLineData(
      pageNumber: serializer.fromJson<int>(json['pageNumber']),
      lineNumber: serializer.fromJson<int>(json['lineNumber']),
      lineType: serializer.fromJson<String>(json['lineType']),
      isCentered: serializer.fromJson<int>(json['isCentered']),
      lineText: serializer.fromJson<String?>(json['lineText']),
      surahNumber: serializer.fromJson<int?>(json['surahNumber']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'pageNumber': serializer.toJson<int>(pageNumber),
      'lineNumber': serializer.toJson<int>(lineNumber),
      'lineType': serializer.toJson<String>(lineType),
      'isCentered': serializer.toJson<int>(isCentered),
      'lineText': serializer.toJson<String?>(lineText),
      'surahNumber': serializer.toJson<int?>(surahNumber),
    };
  }

  PageLineData copyWith({
    int? pageNumber,
    int? lineNumber,
    String? lineType,
    int? isCentered,
    Value<String?> lineText = const Value.absent(),
    Value<int?> surahNumber = const Value.absent(),
  }) => PageLineData(
    pageNumber: pageNumber ?? this.pageNumber,
    lineNumber: lineNumber ?? this.lineNumber,
    lineType: lineType ?? this.lineType,
    isCentered: isCentered ?? this.isCentered,
    lineText: lineText.present ? lineText.value : this.lineText,
    surahNumber: surahNumber.present ? surahNumber.value : this.surahNumber,
  );
  PageLineData copyWithCompanion(PageLineCompanion data) {
    return PageLineData(
      pageNumber: data.pageNumber.present
          ? data.pageNumber.value
          : this.pageNumber,
      lineNumber: data.lineNumber.present
          ? data.lineNumber.value
          : this.lineNumber,
      lineType: data.lineType.present ? data.lineType.value : this.lineType,
      isCentered: data.isCentered.present
          ? data.isCentered.value
          : this.isCentered,
      lineText: data.lineText.present ? data.lineText.value : this.lineText,
      surahNumber: data.surahNumber.present
          ? data.surahNumber.value
          : this.surahNumber,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PageLineData(')
          ..write('pageNumber: $pageNumber, ')
          ..write('lineNumber: $lineNumber, ')
          ..write('lineType: $lineType, ')
          ..write('isCentered: $isCentered, ')
          ..write('lineText: $lineText, ')
          ..write('surahNumber: $surahNumber')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    pageNumber,
    lineNumber,
    lineType,
    isCentered,
    lineText,
    surahNumber,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PageLineData &&
          other.pageNumber == this.pageNumber &&
          other.lineNumber == this.lineNumber &&
          other.lineType == this.lineType &&
          other.isCentered == this.isCentered &&
          other.lineText == this.lineText &&
          other.surahNumber == this.surahNumber);
}

class PageLineCompanion extends UpdateCompanion<PageLineData> {
  final Value<int> pageNumber;
  final Value<int> lineNumber;
  final Value<String> lineType;
  final Value<int> isCentered;
  final Value<String?> lineText;
  final Value<int?> surahNumber;
  final Value<int> rowid;
  const PageLineCompanion({
    this.pageNumber = const Value.absent(),
    this.lineNumber = const Value.absent(),
    this.lineType = const Value.absent(),
    this.isCentered = const Value.absent(),
    this.lineText = const Value.absent(),
    this.surahNumber = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PageLineCompanion.insert({
    required int pageNumber,
    required int lineNumber,
    required String lineType,
    this.isCentered = const Value.absent(),
    this.lineText = const Value.absent(),
    this.surahNumber = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : pageNumber = Value(pageNumber),
       lineNumber = Value(lineNumber),
       lineType = Value(lineType);
  static Insertable<PageLineData> custom({
    Expression<int>? pageNumber,
    Expression<int>? lineNumber,
    Expression<String>? lineType,
    Expression<int>? isCentered,
    Expression<String>? lineText,
    Expression<int>? surahNumber,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (pageNumber != null) 'page_number': pageNumber,
      if (lineNumber != null) 'line_number': lineNumber,
      if (lineType != null) 'line_type': lineType,
      if (isCentered != null) 'is_centered': isCentered,
      if (lineText != null) 'line_text': lineText,
      if (surahNumber != null) 'surah_number': surahNumber,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PageLineCompanion copyWith({
    Value<int>? pageNumber,
    Value<int>? lineNumber,
    Value<String>? lineType,
    Value<int>? isCentered,
    Value<String?>? lineText,
    Value<int?>? surahNumber,
    Value<int>? rowid,
  }) {
    return PageLineCompanion(
      pageNumber: pageNumber ?? this.pageNumber,
      lineNumber: lineNumber ?? this.lineNumber,
      lineType: lineType ?? this.lineType,
      isCentered: isCentered ?? this.isCentered,
      lineText: lineText ?? this.lineText,
      surahNumber: surahNumber ?? this.surahNumber,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (pageNumber.present) {
      map['page_number'] = Variable<int>(pageNumber.value);
    }
    if (lineNumber.present) {
      map['line_number'] = Variable<int>(lineNumber.value);
    }
    if (lineType.present) {
      map['line_type'] = Variable<String>(lineType.value);
    }
    if (isCentered.present) {
      map['is_centered'] = Variable<int>(isCentered.value);
    }
    if (lineText.present) {
      map['line_text'] = Variable<String>(lineText.value);
    }
    if (surahNumber.present) {
      map['surah_number'] = Variable<int>(surahNumber.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PageLineCompanion(')
          ..write('pageNumber: $pageNumber, ')
          ..write('lineNumber: $lineNumber, ')
          ..write('lineType: $lineType, ')
          ..write('isCentered: $isCentered, ')
          ..write('lineText: $lineText, ')
          ..write('surahNumber: $surahNumber, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SajdaTable extends Sajda with TableInfo<$SajdaTable, SajdaData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SajdaTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _sajdaNumberMeta = const VerificationMeta(
    'sajdaNumber',
  );
  @override
  late final GeneratedColumn<int> sajdaNumber = GeneratedColumn<int>(
    'sajda_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
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
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'UNIQUE REFERENCES ayah (verse_key)',
    ),
  );
  static const VerificationMeta _sajdaTypeMeta = const VerificationMeta(
    'sajdaType',
  );
  @override
  late final GeneratedColumn<String> sajdaType = GeneratedColumn<String>(
    'sajda_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [sajdaNumber, verseKey, sajdaType];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sajda';
  @override
  VerificationContext validateIntegrity(
    Insertable<SajdaData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('sajda_number')) {
      context.handle(
        _sajdaNumberMeta,
        sajdaNumber.isAcceptableOrUnknown(
          data['sajda_number']!,
          _sajdaNumberMeta,
        ),
      );
    }
    if (data.containsKey('verse_key')) {
      context.handle(
        _verseKeyMeta,
        verseKey.isAcceptableOrUnknown(data['verse_key']!, _verseKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_verseKeyMeta);
    }
    if (data.containsKey('sajda_type')) {
      context.handle(
        _sajdaTypeMeta,
        sajdaType.isAcceptableOrUnknown(data['sajda_type']!, _sajdaTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_sajdaTypeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {sajdaNumber};
  @override
  SajdaData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SajdaData(
      sajdaNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sajda_number'],
      )!,
      verseKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}verse_key'],
      )!,
      sajdaType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sajda_type'],
      )!,
    );
  }

  @override
  $SajdaTable createAlias(String alias) {
    return $SajdaTable(attachedDatabase, alias);
  }
}

class SajdaData extends DataClass implements Insertable<SajdaData> {
  final int sajdaNumber;
  final String verseKey;
  final String sajdaType;
  const SajdaData({
    required this.sajdaNumber,
    required this.verseKey,
    required this.sajdaType,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['sajda_number'] = Variable<int>(sajdaNumber);
    map['verse_key'] = Variable<String>(verseKey);
    map['sajda_type'] = Variable<String>(sajdaType);
    return map;
  }

  SajdaCompanion toCompanion(bool nullToAbsent) {
    return SajdaCompanion(
      sajdaNumber: Value(sajdaNumber),
      verseKey: Value(verseKey),
      sajdaType: Value(sajdaType),
    );
  }

  factory SajdaData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SajdaData(
      sajdaNumber: serializer.fromJson<int>(json['sajdaNumber']),
      verseKey: serializer.fromJson<String>(json['verseKey']),
      sajdaType: serializer.fromJson<String>(json['sajdaType']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'sajdaNumber': serializer.toJson<int>(sajdaNumber),
      'verseKey': serializer.toJson<String>(verseKey),
      'sajdaType': serializer.toJson<String>(sajdaType),
    };
  }

  SajdaData copyWith({int? sajdaNumber, String? verseKey, String? sajdaType}) =>
      SajdaData(
        sajdaNumber: sajdaNumber ?? this.sajdaNumber,
        verseKey: verseKey ?? this.verseKey,
        sajdaType: sajdaType ?? this.sajdaType,
      );
  SajdaData copyWithCompanion(SajdaCompanion data) {
    return SajdaData(
      sajdaNumber: data.sajdaNumber.present
          ? data.sajdaNumber.value
          : this.sajdaNumber,
      verseKey: data.verseKey.present ? data.verseKey.value : this.verseKey,
      sajdaType: data.sajdaType.present ? data.sajdaType.value : this.sajdaType,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SajdaData(')
          ..write('sajdaNumber: $sajdaNumber, ')
          ..write('verseKey: $verseKey, ')
          ..write('sajdaType: $sajdaType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(sajdaNumber, verseKey, sajdaType);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SajdaData &&
          other.sajdaNumber == this.sajdaNumber &&
          other.verseKey == this.verseKey &&
          other.sajdaType == this.sajdaType);
}

class SajdaCompanion extends UpdateCompanion<SajdaData> {
  final Value<int> sajdaNumber;
  final Value<String> verseKey;
  final Value<String> sajdaType;
  const SajdaCompanion({
    this.sajdaNumber = const Value.absent(),
    this.verseKey = const Value.absent(),
    this.sajdaType = const Value.absent(),
  });
  SajdaCompanion.insert({
    this.sajdaNumber = const Value.absent(),
    required String verseKey,
    required String sajdaType,
  }) : verseKey = Value(verseKey),
       sajdaType = Value(sajdaType);
  static Insertable<SajdaData> custom({
    Expression<int>? sajdaNumber,
    Expression<String>? verseKey,
    Expression<String>? sajdaType,
  }) {
    return RawValuesInsertable({
      if (sajdaNumber != null) 'sajda_number': sajdaNumber,
      if (verseKey != null) 'verse_key': verseKey,
      if (sajdaType != null) 'sajda_type': sajdaType,
    });
  }

  SajdaCompanion copyWith({
    Value<int>? sajdaNumber,
    Value<String>? verseKey,
    Value<String>? sajdaType,
  }) {
    return SajdaCompanion(
      sajdaNumber: sajdaNumber ?? this.sajdaNumber,
      verseKey: verseKey ?? this.verseKey,
      sajdaType: sajdaType ?? this.sajdaType,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (sajdaNumber.present) {
      map['sajda_number'] = Variable<int>(sajdaNumber.value);
    }
    if (verseKey.present) {
      map['verse_key'] = Variable<String>(verseKey.value);
    }
    if (sajdaType.present) {
      map['sajda_type'] = Variable<String>(sajdaType.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SajdaCompanion(')
          ..write('sajdaNumber: $sajdaNumber, ')
          ..write('verseKey: $verseKey, ')
          ..write('sajdaType: $sajdaType')
          ..write(')'))
        .toString();
  }
}

class $SourceTable extends Source with TableInfo<$SourceTable, SourceData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SourceTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _sourceIdMeta = const VerificationMeta(
    'sourceId',
  );
  @override
  late final GeneratedColumn<String> sourceId = GeneratedColumn<String>(
    'source_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sourceTypeMeta = const VerificationMeta(
    'sourceType',
  );
  @override
  late final GeneratedColumn<String> sourceType = GeneratedColumn<String>(
    'source_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _languageMeta = const VerificationMeta(
    'language',
  );
  @override
  late final GeneratedColumn<String> language = GeneratedColumn<String>(
    'language',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _authorMeta = const VerificationMeta('author');
  @override
  late final GeneratedColumn<String> author = GeneratedColumn<String>(
    'author',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    sourceId,
    sourceType,
    language,
    name,
    author,
    description,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'source';
  @override
  VerificationContext validateIntegrity(
    Insertable<SourceData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('source_id')) {
      context.handle(
        _sourceIdMeta,
        sourceId.isAcceptableOrUnknown(data['source_id']!, _sourceIdMeta),
      );
    } else if (isInserting) {
      context.missing(_sourceIdMeta);
    }
    if (data.containsKey('source_type')) {
      context.handle(
        _sourceTypeMeta,
        sourceType.isAcceptableOrUnknown(data['source_type']!, _sourceTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_sourceTypeMeta);
    }
    if (data.containsKey('language')) {
      context.handle(
        _languageMeta,
        language.isAcceptableOrUnknown(data['language']!, _languageMeta),
      );
    } else if (isInserting) {
      context.missing(_languageMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('author')) {
      context.handle(
        _authorMeta,
        author.isAcceptableOrUnknown(data['author']!, _authorMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {sourceId};
  @override
  SourceData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SourceData(
      sourceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_id'],
      )!,
      sourceType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_type'],
      )!,
      language: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}language'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      author: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}author'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
    );
  }

  @override
  $SourceTable createAlias(String alias) {
    return $SourceTable(attachedDatabase, alias);
  }
}

class SourceData extends DataClass implements Insertable<SourceData> {
  final String sourceId;
  final String sourceType;
  final String language;
  final String name;
  final String? author;
  final String? description;
  const SourceData({
    required this.sourceId,
    required this.sourceType,
    required this.language,
    required this.name,
    this.author,
    this.description,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['source_id'] = Variable<String>(sourceId);
    map['source_type'] = Variable<String>(sourceType);
    map['language'] = Variable<String>(language);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || author != null) {
      map['author'] = Variable<String>(author);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    return map;
  }

  SourceCompanion toCompanion(bool nullToAbsent) {
    return SourceCompanion(
      sourceId: Value(sourceId),
      sourceType: Value(sourceType),
      language: Value(language),
      name: Value(name),
      author: author == null && nullToAbsent
          ? const Value.absent()
          : Value(author),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
    );
  }

  factory SourceData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SourceData(
      sourceId: serializer.fromJson<String>(json['sourceId']),
      sourceType: serializer.fromJson<String>(json['sourceType']),
      language: serializer.fromJson<String>(json['language']),
      name: serializer.fromJson<String>(json['name']),
      author: serializer.fromJson<String?>(json['author']),
      description: serializer.fromJson<String?>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'sourceId': serializer.toJson<String>(sourceId),
      'sourceType': serializer.toJson<String>(sourceType),
      'language': serializer.toJson<String>(language),
      'name': serializer.toJson<String>(name),
      'author': serializer.toJson<String?>(author),
      'description': serializer.toJson<String?>(description),
    };
  }

  SourceData copyWith({
    String? sourceId,
    String? sourceType,
    String? language,
    String? name,
    Value<String?> author = const Value.absent(),
    Value<String?> description = const Value.absent(),
  }) => SourceData(
    sourceId: sourceId ?? this.sourceId,
    sourceType: sourceType ?? this.sourceType,
    language: language ?? this.language,
    name: name ?? this.name,
    author: author.present ? author.value : this.author,
    description: description.present ? description.value : this.description,
  );
  SourceData copyWithCompanion(SourceCompanion data) {
    return SourceData(
      sourceId: data.sourceId.present ? data.sourceId.value : this.sourceId,
      sourceType: data.sourceType.present
          ? data.sourceType.value
          : this.sourceType,
      language: data.language.present ? data.language.value : this.language,
      name: data.name.present ? data.name.value : this.name,
      author: data.author.present ? data.author.value : this.author,
      description: data.description.present
          ? data.description.value
          : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SourceData(')
          ..write('sourceId: $sourceId, ')
          ..write('sourceType: $sourceType, ')
          ..write('language: $language, ')
          ..write('name: $name, ')
          ..write('author: $author, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(sourceId, sourceType, language, name, author, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SourceData &&
          other.sourceId == this.sourceId &&
          other.sourceType == this.sourceType &&
          other.language == this.language &&
          other.name == this.name &&
          other.author == this.author &&
          other.description == this.description);
}

class SourceCompanion extends UpdateCompanion<SourceData> {
  final Value<String> sourceId;
  final Value<String> sourceType;
  final Value<String> language;
  final Value<String> name;
  final Value<String?> author;
  final Value<String?> description;
  final Value<int> rowid;
  const SourceCompanion({
    this.sourceId = const Value.absent(),
    this.sourceType = const Value.absent(),
    this.language = const Value.absent(),
    this.name = const Value.absent(),
    this.author = const Value.absent(),
    this.description = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SourceCompanion.insert({
    required String sourceId,
    required String sourceType,
    required String language,
    required String name,
    this.author = const Value.absent(),
    this.description = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : sourceId = Value(sourceId),
       sourceType = Value(sourceType),
       language = Value(language),
       name = Value(name);
  static Insertable<SourceData> custom({
    Expression<String>? sourceId,
    Expression<String>? sourceType,
    Expression<String>? language,
    Expression<String>? name,
    Expression<String>? author,
    Expression<String>? description,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (sourceId != null) 'source_id': sourceId,
      if (sourceType != null) 'source_type': sourceType,
      if (language != null) 'language': language,
      if (name != null) 'name': name,
      if (author != null) 'author': author,
      if (description != null) 'description': description,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SourceCompanion copyWith({
    Value<String>? sourceId,
    Value<String>? sourceType,
    Value<String>? language,
    Value<String>? name,
    Value<String?>? author,
    Value<String?>? description,
    Value<int>? rowid,
  }) {
    return SourceCompanion(
      sourceId: sourceId ?? this.sourceId,
      sourceType: sourceType ?? this.sourceType,
      language: language ?? this.language,
      name: name ?? this.name,
      author: author ?? this.author,
      description: description ?? this.description,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (sourceId.present) {
      map['source_id'] = Variable<String>(sourceId.value);
    }
    if (sourceType.present) {
      map['source_type'] = Variable<String>(sourceType.value);
    }
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SourceCompanion(')
          ..write('sourceId: $sourceId, ')
          ..write('sourceType: $sourceType, ')
          ..write('language: $language, ')
          ..write('name: $name, ')
          ..write('author: $author, ')
          ..write('description: $description, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TranslationTable extends Translation
    with TableInfo<$TranslationTable, TranslationData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TranslationTable(this.attachedDatabase, [this._alias]);
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
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES ayah (verse_key)',
    ),
  );
  static const VerificationMeta _sourceIdMeta = const VerificationMeta(
    'sourceId',
  );
  @override
  late final GeneratedColumn<String> sourceId = GeneratedColumn<String>(
    'source_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES source (source_id)',
    ),
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
    verseKey,
    sourceId,
    translationText,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'translation';
  @override
  VerificationContext validateIntegrity(
    Insertable<TranslationData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('verse_key')) {
      context.handle(
        _verseKeyMeta,
        verseKey.isAcceptableOrUnknown(data['verse_key']!, _verseKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_verseKeyMeta);
    }
    if (data.containsKey('source_id')) {
      context.handle(
        _sourceIdMeta,
        sourceId.isAcceptableOrUnknown(data['source_id']!, _sourceIdMeta),
      );
    } else if (isInserting) {
      context.missing(_sourceIdMeta);
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
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {verseKey, sourceId},
  ];
  @override
  TranslationData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TranslationData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      verseKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}verse_key'],
      )!,
      sourceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_id'],
      )!,
      translationText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}text'],
      )!,
    );
  }

  @override
  $TranslationTable createAlias(String alias) {
    return $TranslationTable(attachedDatabase, alias);
  }
}

class TranslationData extends DataClass implements Insertable<TranslationData> {
  final int id;
  final String verseKey;
  final String sourceId;
  final String translationText;
  const TranslationData({
    required this.id,
    required this.verseKey,
    required this.sourceId,
    required this.translationText,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['verse_key'] = Variable<String>(verseKey);
    map['source_id'] = Variable<String>(sourceId);
    map['text'] = Variable<String>(translationText);
    return map;
  }

  TranslationCompanion toCompanion(bool nullToAbsent) {
    return TranslationCompanion(
      id: Value(id),
      verseKey: Value(verseKey),
      sourceId: Value(sourceId),
      translationText: Value(translationText),
    );
  }

  factory TranslationData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TranslationData(
      id: serializer.fromJson<int>(json['id']),
      verseKey: serializer.fromJson<String>(json['verseKey']),
      sourceId: serializer.fromJson<String>(json['sourceId']),
      translationText: serializer.fromJson<String>(json['translationText']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'verseKey': serializer.toJson<String>(verseKey),
      'sourceId': serializer.toJson<String>(sourceId),
      'translationText': serializer.toJson<String>(translationText),
    };
  }

  TranslationData copyWith({
    int? id,
    String? verseKey,
    String? sourceId,
    String? translationText,
  }) => TranslationData(
    id: id ?? this.id,
    verseKey: verseKey ?? this.verseKey,
    sourceId: sourceId ?? this.sourceId,
    translationText: translationText ?? this.translationText,
  );
  TranslationData copyWithCompanion(TranslationCompanion data) {
    return TranslationData(
      id: data.id.present ? data.id.value : this.id,
      verseKey: data.verseKey.present ? data.verseKey.value : this.verseKey,
      sourceId: data.sourceId.present ? data.sourceId.value : this.sourceId,
      translationText: data.translationText.present
          ? data.translationText.value
          : this.translationText,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TranslationData(')
          ..write('id: $id, ')
          ..write('verseKey: $verseKey, ')
          ..write('sourceId: $sourceId, ')
          ..write('translationText: $translationText')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, verseKey, sourceId, translationText);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TranslationData &&
          other.id == this.id &&
          other.verseKey == this.verseKey &&
          other.sourceId == this.sourceId &&
          other.translationText == this.translationText);
}

class TranslationCompanion extends UpdateCompanion<TranslationData> {
  final Value<int> id;
  final Value<String> verseKey;
  final Value<String> sourceId;
  final Value<String> translationText;
  const TranslationCompanion({
    this.id = const Value.absent(),
    this.verseKey = const Value.absent(),
    this.sourceId = const Value.absent(),
    this.translationText = const Value.absent(),
  });
  TranslationCompanion.insert({
    this.id = const Value.absent(),
    required String verseKey,
    required String sourceId,
    required String translationText,
  }) : verseKey = Value(verseKey),
       sourceId = Value(sourceId),
       translationText = Value(translationText);
  static Insertable<TranslationData> custom({
    Expression<int>? id,
    Expression<String>? verseKey,
    Expression<String>? sourceId,
    Expression<String>? translationText,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (verseKey != null) 'verse_key': verseKey,
      if (sourceId != null) 'source_id': sourceId,
      if (translationText != null) 'text': translationText,
    });
  }

  TranslationCompanion copyWith({
    Value<int>? id,
    Value<String>? verseKey,
    Value<String>? sourceId,
    Value<String>? translationText,
  }) {
    return TranslationCompanion(
      id: id ?? this.id,
      verseKey: verseKey ?? this.verseKey,
      sourceId: sourceId ?? this.sourceId,
      translationText: translationText ?? this.translationText,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (verseKey.present) {
      map['verse_key'] = Variable<String>(verseKey.value);
    }
    if (sourceId.present) {
      map['source_id'] = Variable<String>(sourceId.value);
    }
    if (translationText.present) {
      map['text'] = Variable<String>(translationText.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TranslationCompanion(')
          ..write('id: $id, ')
          ..write('verseKey: $verseKey, ')
          ..write('sourceId: $sourceId, ')
          ..write('translationText: $translationText')
          ..write(')'))
        .toString();
  }
}

class $TafsirTable extends Tafsir with TableInfo<$TafsirTable, TafsirData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TafsirTable(this.attachedDatabase, [this._alias]);
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
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES ayah (verse_key)',
    ),
  );
  static const VerificationMeta _sourceIdMeta = const VerificationMeta(
    'sourceId',
  );
  @override
  late final GeneratedColumn<String> sourceId = GeneratedColumn<String>(
    'source_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES source (source_id)',
    ),
  );
  static const VerificationMeta _groupVerseKeyMeta = const VerificationMeta(
    'groupVerseKey',
  );
  @override
  late final GeneratedColumn<String> groupVerseKey = GeneratedColumn<String>(
    'group_verse_key',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tafsirTextMeta = const VerificationMeta(
    'tafsirText',
  );
  @override
  late final GeneratedColumn<String> tafsirText = GeneratedColumn<String>(
    'text',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    verseKey,
    sourceId,
    groupVerseKey,
    tafsirText,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tafsir';
  @override
  VerificationContext validateIntegrity(
    Insertable<TafsirData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('verse_key')) {
      context.handle(
        _verseKeyMeta,
        verseKey.isAcceptableOrUnknown(data['verse_key']!, _verseKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_verseKeyMeta);
    }
    if (data.containsKey('source_id')) {
      context.handle(
        _sourceIdMeta,
        sourceId.isAcceptableOrUnknown(data['source_id']!, _sourceIdMeta),
      );
    } else if (isInserting) {
      context.missing(_sourceIdMeta);
    }
    if (data.containsKey('group_verse_key')) {
      context.handle(
        _groupVerseKeyMeta,
        groupVerseKey.isAcceptableOrUnknown(
          data['group_verse_key']!,
          _groupVerseKeyMeta,
        ),
      );
    }
    if (data.containsKey('text')) {
      context.handle(
        _tafsirTextMeta,
        tafsirText.isAcceptableOrUnknown(data['text']!, _tafsirTextMeta),
      );
    } else if (isInserting) {
      context.missing(_tafsirTextMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {verseKey, sourceId},
  ];
  @override
  TafsirData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TafsirData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      verseKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}verse_key'],
      )!,
      sourceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_id'],
      )!,
      groupVerseKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}group_verse_key'],
      ),
      tafsirText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}text'],
      )!,
    );
  }

  @override
  $TafsirTable createAlias(String alias) {
    return $TafsirTable(attachedDatabase, alias);
  }
}

class TafsirData extends DataClass implements Insertable<TafsirData> {
  final int id;
  final String verseKey;
  final String sourceId;
  final String? groupVerseKey;
  final String tafsirText;
  const TafsirData({
    required this.id,
    required this.verseKey,
    required this.sourceId,
    this.groupVerseKey,
    required this.tafsirText,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['verse_key'] = Variable<String>(verseKey);
    map['source_id'] = Variable<String>(sourceId);
    if (!nullToAbsent || groupVerseKey != null) {
      map['group_verse_key'] = Variable<String>(groupVerseKey);
    }
    map['text'] = Variable<String>(tafsirText);
    return map;
  }

  TafsirCompanion toCompanion(bool nullToAbsent) {
    return TafsirCompanion(
      id: Value(id),
      verseKey: Value(verseKey),
      sourceId: Value(sourceId),
      groupVerseKey: groupVerseKey == null && nullToAbsent
          ? const Value.absent()
          : Value(groupVerseKey),
      tafsirText: Value(tafsirText),
    );
  }

  factory TafsirData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TafsirData(
      id: serializer.fromJson<int>(json['id']),
      verseKey: serializer.fromJson<String>(json['verseKey']),
      sourceId: serializer.fromJson<String>(json['sourceId']),
      groupVerseKey: serializer.fromJson<String?>(json['groupVerseKey']),
      tafsirText: serializer.fromJson<String>(json['tafsirText']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'verseKey': serializer.toJson<String>(verseKey),
      'sourceId': serializer.toJson<String>(sourceId),
      'groupVerseKey': serializer.toJson<String?>(groupVerseKey),
      'tafsirText': serializer.toJson<String>(tafsirText),
    };
  }

  TafsirData copyWith({
    int? id,
    String? verseKey,
    String? sourceId,
    Value<String?> groupVerseKey = const Value.absent(),
    String? tafsirText,
  }) => TafsirData(
    id: id ?? this.id,
    verseKey: verseKey ?? this.verseKey,
    sourceId: sourceId ?? this.sourceId,
    groupVerseKey: groupVerseKey.present
        ? groupVerseKey.value
        : this.groupVerseKey,
    tafsirText: tafsirText ?? this.tafsirText,
  );
  TafsirData copyWithCompanion(TafsirCompanion data) {
    return TafsirData(
      id: data.id.present ? data.id.value : this.id,
      verseKey: data.verseKey.present ? data.verseKey.value : this.verseKey,
      sourceId: data.sourceId.present ? data.sourceId.value : this.sourceId,
      groupVerseKey: data.groupVerseKey.present
          ? data.groupVerseKey.value
          : this.groupVerseKey,
      tafsirText: data.tafsirText.present
          ? data.tafsirText.value
          : this.tafsirText,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TafsirData(')
          ..write('id: $id, ')
          ..write('verseKey: $verseKey, ')
          ..write('sourceId: $sourceId, ')
          ..write('groupVerseKey: $groupVerseKey, ')
          ..write('tafsirText: $tafsirText')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, verseKey, sourceId, groupVerseKey, tafsirText);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TafsirData &&
          other.id == this.id &&
          other.verseKey == this.verseKey &&
          other.sourceId == this.sourceId &&
          other.groupVerseKey == this.groupVerseKey &&
          other.tafsirText == this.tafsirText);
}

class TafsirCompanion extends UpdateCompanion<TafsirData> {
  final Value<int> id;
  final Value<String> verseKey;
  final Value<String> sourceId;
  final Value<String?> groupVerseKey;
  final Value<String> tafsirText;
  const TafsirCompanion({
    this.id = const Value.absent(),
    this.verseKey = const Value.absent(),
    this.sourceId = const Value.absent(),
    this.groupVerseKey = const Value.absent(),
    this.tafsirText = const Value.absent(),
  });
  TafsirCompanion.insert({
    this.id = const Value.absent(),
    required String verseKey,
    required String sourceId,
    this.groupVerseKey = const Value.absent(),
    required String tafsirText,
  }) : verseKey = Value(verseKey),
       sourceId = Value(sourceId),
       tafsirText = Value(tafsirText);
  static Insertable<TafsirData> custom({
    Expression<int>? id,
    Expression<String>? verseKey,
    Expression<String>? sourceId,
    Expression<String>? groupVerseKey,
    Expression<String>? tafsirText,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (verseKey != null) 'verse_key': verseKey,
      if (sourceId != null) 'source_id': sourceId,
      if (groupVerseKey != null) 'group_verse_key': groupVerseKey,
      if (tafsirText != null) 'text': tafsirText,
    });
  }

  TafsirCompanion copyWith({
    Value<int>? id,
    Value<String>? verseKey,
    Value<String>? sourceId,
    Value<String?>? groupVerseKey,
    Value<String>? tafsirText,
  }) {
    return TafsirCompanion(
      id: id ?? this.id,
      verseKey: verseKey ?? this.verseKey,
      sourceId: sourceId ?? this.sourceId,
      groupVerseKey: groupVerseKey ?? this.groupVerseKey,
      tafsirText: tafsirText ?? this.tafsirText,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (verseKey.present) {
      map['verse_key'] = Variable<String>(verseKey.value);
    }
    if (sourceId.present) {
      map['source_id'] = Variable<String>(sourceId.value);
    }
    if (groupVerseKey.present) {
      map['group_verse_key'] = Variable<String>(groupVerseKey.value);
    }
    if (tafsirText.present) {
      map['text'] = Variable<String>(tafsirText.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TafsirCompanion(')
          ..write('id: $id, ')
          ..write('verseKey: $verseKey, ')
          ..write('sourceId: $sourceId, ')
          ..write('groupVerseKey: $groupVerseKey, ')
          ..write('tafsirText: $tafsirText')
          ..write(')'))
        .toString();
  }
}

class $FootnoteTable extends Footnote
    with TableInfo<$FootnoteTable, FootnoteData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FootnoteTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _footnoteIdMeta = const VerificationMeta(
    'footnoteId',
  );
  @override
  late final GeneratedColumn<int> footnoteId = GeneratedColumn<int>(
    'footnote_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _footnoteTextMeta = const VerificationMeta(
    'footnoteText',
  );
  @override
  late final GeneratedColumn<String> footnoteText = GeneratedColumn<String>(
    'text',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, footnoteId, footnoteText];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'footnote';
  @override
  VerificationContext validateIntegrity(
    Insertable<FootnoteData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('footnote_id')) {
      context.handle(
        _footnoteIdMeta,
        footnoteId.isAcceptableOrUnknown(data['footnote_id']!, _footnoteIdMeta),
      );
    } else if (isInserting) {
      context.missing(_footnoteIdMeta);
    }
    if (data.containsKey('text')) {
      context.handle(
        _footnoteTextMeta,
        footnoteText.isAcceptableOrUnknown(data['text']!, _footnoteTextMeta),
      );
    } else if (isInserting) {
      context.missing(_footnoteTextMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FootnoteData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FootnoteData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      footnoteId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}footnote_id'],
      )!,
      footnoteText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}text'],
      )!,
    );
  }

  @override
  $FootnoteTable createAlias(String alias) {
    return $FootnoteTable(attachedDatabase, alias);
  }
}

class FootnoteData extends DataClass implements Insertable<FootnoteData> {
  final int id;
  final int footnoteId;
  final String footnoteText;
  const FootnoteData({
    required this.id,
    required this.footnoteId,
    required this.footnoteText,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['footnote_id'] = Variable<int>(footnoteId);
    map['text'] = Variable<String>(footnoteText);
    return map;
  }

  FootnoteCompanion toCompanion(bool nullToAbsent) {
    return FootnoteCompanion(
      id: Value(id),
      footnoteId: Value(footnoteId),
      footnoteText: Value(footnoteText),
    );
  }

  factory FootnoteData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FootnoteData(
      id: serializer.fromJson<int>(json['id']),
      footnoteId: serializer.fromJson<int>(json['footnoteId']),
      footnoteText: serializer.fromJson<String>(json['footnoteText']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'footnoteId': serializer.toJson<int>(footnoteId),
      'footnoteText': serializer.toJson<String>(footnoteText),
    };
  }

  FootnoteData copyWith({int? id, int? footnoteId, String? footnoteText}) =>
      FootnoteData(
        id: id ?? this.id,
        footnoteId: footnoteId ?? this.footnoteId,
        footnoteText: footnoteText ?? this.footnoteText,
      );
  FootnoteData copyWithCompanion(FootnoteCompanion data) {
    return FootnoteData(
      id: data.id.present ? data.id.value : this.id,
      footnoteId: data.footnoteId.present
          ? data.footnoteId.value
          : this.footnoteId,
      footnoteText: data.footnoteText.present
          ? data.footnoteText.value
          : this.footnoteText,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FootnoteData(')
          ..write('id: $id, ')
          ..write('footnoteId: $footnoteId, ')
          ..write('footnoteText: $footnoteText')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, footnoteId, footnoteText);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FootnoteData &&
          other.id == this.id &&
          other.footnoteId == this.footnoteId &&
          other.footnoteText == this.footnoteText);
}

class FootnoteCompanion extends UpdateCompanion<FootnoteData> {
  final Value<int> id;
  final Value<int> footnoteId;
  final Value<String> footnoteText;
  const FootnoteCompanion({
    this.id = const Value.absent(),
    this.footnoteId = const Value.absent(),
    this.footnoteText = const Value.absent(),
  });
  FootnoteCompanion.insert({
    this.id = const Value.absent(),
    required int footnoteId,
    required String footnoteText,
  }) : footnoteId = Value(footnoteId),
       footnoteText = Value(footnoteText);
  static Insertable<FootnoteData> custom({
    Expression<int>? id,
    Expression<int>? footnoteId,
    Expression<String>? footnoteText,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (footnoteId != null) 'footnote_id': footnoteId,
      if (footnoteText != null) 'text': footnoteText,
    });
  }

  FootnoteCompanion copyWith({
    Value<int>? id,
    Value<int>? footnoteId,
    Value<String>? footnoteText,
  }) {
    return FootnoteCompanion(
      id: id ?? this.id,
      footnoteId: footnoteId ?? this.footnoteId,
      footnoteText: footnoteText ?? this.footnoteText,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (footnoteId.present) {
      map['footnote_id'] = Variable<int>(footnoteId.value);
    }
    if (footnoteText.present) {
      map['text'] = Variable<String>(footnoteText.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FootnoteCompanion(')
          ..write('id: $id, ')
          ..write('footnoteId: $footnoteId, ')
          ..write('footnoteText: $footnoteText')
          ..write(')'))
        .toString();
  }
}

class $AyahFootnoteTable extends AyahFootnote
    with TableInfo<$AyahFootnoteTable, AyahFootnoteData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AyahFootnoteTable(this.attachedDatabase, [this._alias]);
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
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES ayah (verse_key)',
    ),
  );
  static const VerificationMeta _footnoteNumberMeta = const VerificationMeta(
    'footnoteNumber',
  );
  @override
  late final GeneratedColumn<int> footnoteNumber = GeneratedColumn<int>(
    'footnote_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _footnoteIdMeta = const VerificationMeta(
    'footnoteId',
  );
  @override
  late final GeneratedColumn<int> footnoteId = GeneratedColumn<int>(
    'footnote_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES footnote (footnote_id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    verseKey,
    footnoteNumber,
    footnoteId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ayah_footnote';
  @override
  VerificationContext validateIntegrity(
    Insertable<AyahFootnoteData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('verse_key')) {
      context.handle(
        _verseKeyMeta,
        verseKey.isAcceptableOrUnknown(data['verse_key']!, _verseKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_verseKeyMeta);
    }
    if (data.containsKey('footnote_number')) {
      context.handle(
        _footnoteNumberMeta,
        footnoteNumber.isAcceptableOrUnknown(
          data['footnote_number']!,
          _footnoteNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_footnoteNumberMeta);
    }
    if (data.containsKey('footnote_id')) {
      context.handle(
        _footnoteIdMeta,
        footnoteId.isAcceptableOrUnknown(data['footnote_id']!, _footnoteIdMeta),
      );
    } else if (isInserting) {
      context.missing(_footnoteIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AyahFootnoteData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AyahFootnoteData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      verseKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}verse_key'],
      )!,
      footnoteNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}footnote_number'],
      )!,
      footnoteId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}footnote_id'],
      )!,
    );
  }

  @override
  $AyahFootnoteTable createAlias(String alias) {
    return $AyahFootnoteTable(attachedDatabase, alias);
  }
}

class AyahFootnoteData extends DataClass
    implements Insertable<AyahFootnoteData> {
  final int id;
  final String verseKey;
  final int footnoteNumber;
  final int footnoteId;
  const AyahFootnoteData({
    required this.id,
    required this.verseKey,
    required this.footnoteNumber,
    required this.footnoteId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['verse_key'] = Variable<String>(verseKey);
    map['footnote_number'] = Variable<int>(footnoteNumber);
    map['footnote_id'] = Variable<int>(footnoteId);
    return map;
  }

  AyahFootnoteCompanion toCompanion(bool nullToAbsent) {
    return AyahFootnoteCompanion(
      id: Value(id),
      verseKey: Value(verseKey),
      footnoteNumber: Value(footnoteNumber),
      footnoteId: Value(footnoteId),
    );
  }

  factory AyahFootnoteData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AyahFootnoteData(
      id: serializer.fromJson<int>(json['id']),
      verseKey: serializer.fromJson<String>(json['verseKey']),
      footnoteNumber: serializer.fromJson<int>(json['footnoteNumber']),
      footnoteId: serializer.fromJson<int>(json['footnoteId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'verseKey': serializer.toJson<String>(verseKey),
      'footnoteNumber': serializer.toJson<int>(footnoteNumber),
      'footnoteId': serializer.toJson<int>(footnoteId),
    };
  }

  AyahFootnoteData copyWith({
    int? id,
    String? verseKey,
    int? footnoteNumber,
    int? footnoteId,
  }) => AyahFootnoteData(
    id: id ?? this.id,
    verseKey: verseKey ?? this.verseKey,
    footnoteNumber: footnoteNumber ?? this.footnoteNumber,
    footnoteId: footnoteId ?? this.footnoteId,
  );
  AyahFootnoteData copyWithCompanion(AyahFootnoteCompanion data) {
    return AyahFootnoteData(
      id: data.id.present ? data.id.value : this.id,
      verseKey: data.verseKey.present ? data.verseKey.value : this.verseKey,
      footnoteNumber: data.footnoteNumber.present
          ? data.footnoteNumber.value
          : this.footnoteNumber,
      footnoteId: data.footnoteId.present
          ? data.footnoteId.value
          : this.footnoteId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AyahFootnoteData(')
          ..write('id: $id, ')
          ..write('verseKey: $verseKey, ')
          ..write('footnoteNumber: $footnoteNumber, ')
          ..write('footnoteId: $footnoteId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, verseKey, footnoteNumber, footnoteId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AyahFootnoteData &&
          other.id == this.id &&
          other.verseKey == this.verseKey &&
          other.footnoteNumber == this.footnoteNumber &&
          other.footnoteId == this.footnoteId);
}

class AyahFootnoteCompanion extends UpdateCompanion<AyahFootnoteData> {
  final Value<int> id;
  final Value<String> verseKey;
  final Value<int> footnoteNumber;
  final Value<int> footnoteId;
  const AyahFootnoteCompanion({
    this.id = const Value.absent(),
    this.verseKey = const Value.absent(),
    this.footnoteNumber = const Value.absent(),
    this.footnoteId = const Value.absent(),
  });
  AyahFootnoteCompanion.insert({
    this.id = const Value.absent(),
    required String verseKey,
    required int footnoteNumber,
    required int footnoteId,
  }) : verseKey = Value(verseKey),
       footnoteNumber = Value(footnoteNumber),
       footnoteId = Value(footnoteId);
  static Insertable<AyahFootnoteData> custom({
    Expression<int>? id,
    Expression<String>? verseKey,
    Expression<int>? footnoteNumber,
    Expression<int>? footnoteId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (verseKey != null) 'verse_key': verseKey,
      if (footnoteNumber != null) 'footnote_number': footnoteNumber,
      if (footnoteId != null) 'footnote_id': footnoteId,
    });
  }

  AyahFootnoteCompanion copyWith({
    Value<int>? id,
    Value<String>? verseKey,
    Value<int>? footnoteNumber,
    Value<int>? footnoteId,
  }) {
    return AyahFootnoteCompanion(
      id: id ?? this.id,
      verseKey: verseKey ?? this.verseKey,
      footnoteNumber: footnoteNumber ?? this.footnoteNumber,
      footnoteId: footnoteId ?? this.footnoteId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (verseKey.present) {
      map['verse_key'] = Variable<String>(verseKey.value);
    }
    if (footnoteNumber.present) {
      map['footnote_number'] = Variable<int>(footnoteNumber.value);
    }
    if (footnoteId.present) {
      map['footnote_id'] = Variable<int>(footnoteId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AyahFootnoteCompanion(')
          ..write('id: $id, ')
          ..write('verseKey: $verseKey, ')
          ..write('footnoteNumber: $footnoteNumber, ')
          ..write('footnoteId: $footnoteId')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SurahTable surah = $SurahTable(this);
  late final $JuzTable juz = $JuzTable(this);
  late final $RukuTable ruku = $RukuTable(this);
  late final $AyahTable ayah = $AyahTable(this);
  late final $WordTable word = $WordTable(this);
  late final $PageLineTable pageLine = $PageLineTable(this);
  late final $SajdaTable sajda = $SajdaTable(this);
  late final $SourceTable source = $SourceTable(this);
  late final $TranslationTable translation = $TranslationTable(this);
  late final $TafsirTable tafsir = $TafsirTable(this);
  late final $FootnoteTable footnote = $FootnoteTable(this);
  late final $AyahFootnoteTable ayahFootnote = $AyahFootnoteTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    surah,
    juz,
    ruku,
    ayah,
    word,
    pageLine,
    sajda,
    source,
    translation,
    tafsir,
    footnote,
    ayahFootnote,
  ];
}

typedef $$SurahTableCreateCompanionBuilder =
    SurahCompanion Function({
      Value<int> surahNumber,
      required String nameArabic,
      required String nameEnglish,
      Value<String?> nameTransliteration,
      required int totalVerses,
      Value<String?> revelationPlace,
      Value<int?> revelationOrder,
      Value<int> bismillahPre,
      Value<String?> description,
      Value<String?> descriptionShort,
    });
typedef $$SurahTableUpdateCompanionBuilder =
    SurahCompanion Function({
      Value<int> surahNumber,
      Value<String> nameArabic,
      Value<String> nameEnglish,
      Value<String?> nameTransliteration,
      Value<int> totalVerses,
      Value<String?> revelationPlace,
      Value<int?> revelationOrder,
      Value<int> bismillahPre,
      Value<String?> description,
      Value<String?> descriptionShort,
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

  ColumnFilters<String> get nameArabic => $composableBuilder(
    column: $table.nameArabic,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameEnglish => $composableBuilder(
    column: $table.nameEnglish,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameTransliteration => $composableBuilder(
    column: $table.nameTransliteration,
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

  ColumnFilters<int> get bismillahPre => $composableBuilder(
    column: $table.bismillahPre,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get descriptionShort => $composableBuilder(
    column: $table.descriptionShort,
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

  ColumnOrderings<String> get nameArabic => $composableBuilder(
    column: $table.nameArabic,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameEnglish => $composableBuilder(
    column: $table.nameEnglish,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameTransliteration => $composableBuilder(
    column: $table.nameTransliteration,
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

  ColumnOrderings<int> get bismillahPre => $composableBuilder(
    column: $table.bismillahPre,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get descriptionShort => $composableBuilder(
    column: $table.descriptionShort,
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

  GeneratedColumn<String> get nameArabic => $composableBuilder(
    column: $table.nameArabic,
    builder: (column) => column,
  );

  GeneratedColumn<String> get nameEnglish => $composableBuilder(
    column: $table.nameEnglish,
    builder: (column) => column,
  );

  GeneratedColumn<String> get nameTransliteration => $composableBuilder(
    column: $table.nameTransliteration,
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

  GeneratedColumn<int> get bismillahPre => $composableBuilder(
    column: $table.bismillahPre,
    builder: (column) => column,
  );

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get descriptionShort => $composableBuilder(
    column: $table.descriptionShort,
    builder: (column) => column,
  );

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
                Value<String> nameArabic = const Value.absent(),
                Value<String> nameEnglish = const Value.absent(),
                Value<String?> nameTransliteration = const Value.absent(),
                Value<int> totalVerses = const Value.absent(),
                Value<String?> revelationPlace = const Value.absent(),
                Value<int?> revelationOrder = const Value.absent(),
                Value<int> bismillahPre = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> descriptionShort = const Value.absent(),
              }) => SurahCompanion(
                surahNumber: surahNumber,
                nameArabic: nameArabic,
                nameEnglish: nameEnglish,
                nameTransliteration: nameTransliteration,
                totalVerses: totalVerses,
                revelationPlace: revelationPlace,
                revelationOrder: revelationOrder,
                bismillahPre: bismillahPre,
                description: description,
                descriptionShort: descriptionShort,
              ),
          createCompanionCallback:
              ({
                Value<int> surahNumber = const Value.absent(),
                required String nameArabic,
                required String nameEnglish,
                Value<String?> nameTransliteration = const Value.absent(),
                required int totalVerses,
                Value<String?> revelationPlace = const Value.absent(),
                Value<int?> revelationOrder = const Value.absent(),
                Value<int> bismillahPre = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> descriptionShort = const Value.absent(),
              }) => SurahCompanion.insert(
                surahNumber: surahNumber,
                nameArabic: nameArabic,
                nameEnglish: nameEnglish,
                nameTransliteration: nameTransliteration,
                totalVerses: totalVerses,
                revelationPlace: revelationPlace,
                revelationOrder: revelationOrder,
                bismillahPre: bismillahPre,
                description: description,
                descriptionShort: descriptionShort,
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
typedef $$JuzTableCreateCompanionBuilder =
    JuzCompanion Function({
      Value<int> juzNumber,
      Value<String?> arabicName,
      required String firstVerseKey,
      required String lastVerseKey,
      Value<int?> versesCount,
    });
typedef $$JuzTableUpdateCompanionBuilder =
    JuzCompanion Function({
      Value<int> juzNumber,
      Value<String?> arabicName,
      Value<String> firstVerseKey,
      Value<String> lastVerseKey,
      Value<int?> versesCount,
    });

final class $$JuzTableReferences
    extends BaseReferences<_$AppDatabase, $JuzTable, JuzData> {
  $$JuzTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$AyahTable, List<AyahData>> _ayahRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.ayah,
    aliasName: $_aliasNameGenerator(db.juz.juzNumber, db.ayah.juzNumber),
  );

  $$AyahTableProcessedTableManager get ayahRefs {
    final manager = $$AyahTableTableManager($_db, $_db.ayah).filter(
      (f) => f.juzNumber.juzNumber.sqlEquals($_itemColumn<int>('juz_number')!),
    );

    final cache = $_typedResult.readTableOrNull(_ayahRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$JuzTableFilterComposer extends Composer<_$AppDatabase, $JuzTable> {
  $$JuzTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get juzNumber => $composableBuilder(
    column: $table.juzNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get arabicName => $composableBuilder(
    column: $table.arabicName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get firstVerseKey => $composableBuilder(
    column: $table.firstVerseKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastVerseKey => $composableBuilder(
    column: $table.lastVerseKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get versesCount => $composableBuilder(
    column: $table.versesCount,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> ayahRefs(
    Expression<bool> Function($$AyahTableFilterComposer f) f,
  ) {
    final $$AyahTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.juzNumber,
      referencedTable: $db.ayah,
      getReferencedColumn: (t) => t.juzNumber,
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

class $$JuzTableOrderingComposer extends Composer<_$AppDatabase, $JuzTable> {
  $$JuzTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get juzNumber => $composableBuilder(
    column: $table.juzNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get arabicName => $composableBuilder(
    column: $table.arabicName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get firstVerseKey => $composableBuilder(
    column: $table.firstVerseKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastVerseKey => $composableBuilder(
    column: $table.lastVerseKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get versesCount => $composableBuilder(
    column: $table.versesCount,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$JuzTableAnnotationComposer extends Composer<_$AppDatabase, $JuzTable> {
  $$JuzTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get juzNumber =>
      $composableBuilder(column: $table.juzNumber, builder: (column) => column);

  GeneratedColumn<String> get arabicName => $composableBuilder(
    column: $table.arabicName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get firstVerseKey => $composableBuilder(
    column: $table.firstVerseKey,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lastVerseKey => $composableBuilder(
    column: $table.lastVerseKey,
    builder: (column) => column,
  );

  GeneratedColumn<int> get versesCount => $composableBuilder(
    column: $table.versesCount,
    builder: (column) => column,
  );

  Expression<T> ayahRefs<T extends Object>(
    Expression<T> Function($$AyahTableAnnotationComposer a) f,
  ) {
    final $$AyahTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.juzNumber,
      referencedTable: $db.ayah,
      getReferencedColumn: (t) => t.juzNumber,
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

class $$JuzTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $JuzTable,
          JuzData,
          $$JuzTableFilterComposer,
          $$JuzTableOrderingComposer,
          $$JuzTableAnnotationComposer,
          $$JuzTableCreateCompanionBuilder,
          $$JuzTableUpdateCompanionBuilder,
          (JuzData, $$JuzTableReferences),
          JuzData,
          PrefetchHooks Function({bool ayahRefs})
        > {
  $$JuzTableTableManager(_$AppDatabase db, $JuzTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$JuzTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$JuzTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$JuzTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> juzNumber = const Value.absent(),
                Value<String?> arabicName = const Value.absent(),
                Value<String> firstVerseKey = const Value.absent(),
                Value<String> lastVerseKey = const Value.absent(),
                Value<int?> versesCount = const Value.absent(),
              }) => JuzCompanion(
                juzNumber: juzNumber,
                arabicName: arabicName,
                firstVerseKey: firstVerseKey,
                lastVerseKey: lastVerseKey,
                versesCount: versesCount,
              ),
          createCompanionCallback:
              ({
                Value<int> juzNumber = const Value.absent(),
                Value<String?> arabicName = const Value.absent(),
                required String firstVerseKey,
                required String lastVerseKey,
                Value<int?> versesCount = const Value.absent(),
              }) => JuzCompanion.insert(
                juzNumber: juzNumber,
                arabicName: arabicName,
                firstVerseKey: firstVerseKey,
                lastVerseKey: lastVerseKey,
                versesCount: versesCount,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (e.readTable(table), $$JuzTableReferences(db, table, e)),
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
                    await $_getPrefetchedData<JuzData, $JuzTable, AyahData>(
                      currentTable: table,
                      referencedTable: $$JuzTableReferences._ayahRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$JuzTableReferences(db, table, p0).ayahRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.juzNumber == item.juzNumber,
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

typedef $$JuzTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $JuzTable,
      JuzData,
      $$JuzTableFilterComposer,
      $$JuzTableOrderingComposer,
      $$JuzTableAnnotationComposer,
      $$JuzTableCreateCompanionBuilder,
      $$JuzTableUpdateCompanionBuilder,
      (JuzData, $$JuzTableReferences),
      JuzData,
      PrefetchHooks Function({bool ayahRefs})
    >;
typedef $$RukuTableCreateCompanionBuilder =
    RukuCompanion Function({
      Value<int> rukuNumber,
      required int surahNumber,
      Value<int?> surahRukuNumber,
      required String firstVerseKey,
      required String lastVerseKey,
      Value<int?> versesCount,
    });
typedef $$RukuTableUpdateCompanionBuilder =
    RukuCompanion Function({
      Value<int> rukuNumber,
      Value<int> surahNumber,
      Value<int?> surahRukuNumber,
      Value<String> firstVerseKey,
      Value<String> lastVerseKey,
      Value<int?> versesCount,
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

  ColumnFilters<int> get surahRukuNumber => $composableBuilder(
    column: $table.surahRukuNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get firstVerseKey => $composableBuilder(
    column: $table.firstVerseKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastVerseKey => $composableBuilder(
    column: $table.lastVerseKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get versesCount => $composableBuilder(
    column: $table.versesCount,
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

  ColumnOrderings<int> get surahRukuNumber => $composableBuilder(
    column: $table.surahRukuNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get firstVerseKey => $composableBuilder(
    column: $table.firstVerseKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastVerseKey => $composableBuilder(
    column: $table.lastVerseKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get versesCount => $composableBuilder(
    column: $table.versesCount,
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

  GeneratedColumn<int> get surahRukuNumber => $composableBuilder(
    column: $table.surahRukuNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get firstVerseKey => $composableBuilder(
    column: $table.firstVerseKey,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lastVerseKey => $composableBuilder(
    column: $table.lastVerseKey,
    builder: (column) => column,
  );

  GeneratedColumn<int> get versesCount => $composableBuilder(
    column: $table.versesCount,
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
                Value<int?> surahRukuNumber = const Value.absent(),
                Value<String> firstVerseKey = const Value.absent(),
                Value<String> lastVerseKey = const Value.absent(),
                Value<int?> versesCount = const Value.absent(),
              }) => RukuCompanion(
                rukuNumber: rukuNumber,
                surahNumber: surahNumber,
                surahRukuNumber: surahRukuNumber,
                firstVerseKey: firstVerseKey,
                lastVerseKey: lastVerseKey,
                versesCount: versesCount,
              ),
          createCompanionCallback:
              ({
                Value<int> rukuNumber = const Value.absent(),
                required int surahNumber,
                Value<int?> surahRukuNumber = const Value.absent(),
                required String firstVerseKey,
                required String lastVerseKey,
                Value<int?> versesCount = const Value.absent(),
              }) => RukuCompanion.insert(
                rukuNumber: rukuNumber,
                surahNumber: surahNumber,
                surahRukuNumber: surahRukuNumber,
                firstVerseKey: firstVerseKey,
                lastVerseKey: lastVerseKey,
                versesCount: versesCount,
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
typedef $$AyahTableCreateCompanionBuilder =
    AyahCompanion Function({
      Value<int> id,
      required int surahNumber,
      required int verseNumber,
      required String verseKey,
      required String arabic,
      Value<int?> pageNumber,
      Value<int?> juzNumber,
      Value<int?> rukuNumber,
    });
typedef $$AyahTableUpdateCompanionBuilder =
    AyahCompanion Function({
      Value<int> id,
      Value<int> surahNumber,
      Value<int> verseNumber,
      Value<String> verseKey,
      Value<String> arabic,
      Value<int?> pageNumber,
      Value<int?> juzNumber,
      Value<int?> rukuNumber,
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

  static $JuzTable _juzNumberTable(_$AppDatabase db) => db.juz.createAlias(
    $_aliasNameGenerator(db.ayah.juzNumber, db.juz.juzNumber),
  );

  $$JuzTableProcessedTableManager? get juzNumber {
    final $_column = $_itemColumn<int>('juz_number');
    if ($_column == null) return null;
    final manager = $$JuzTableTableManager(
      $_db,
      $_db.juz,
    ).filter((f) => f.juzNumber.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_juzNumberTable($_db));
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

  static MultiTypedResultKey<$WordTable, List<WordData>> _wordRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.word,
    aliasName: $_aliasNameGenerator(db.ayah.verseKey, db.word.verseKey),
  );

  $$WordTableProcessedTableManager get wordRefs {
    final manager = $$WordTableTableManager($_db, $_db.word).filter(
      (f) => f.verseKey.verseKey.sqlEquals($_itemColumn<String>('verse_key')!),
    );

    final cache = $_typedResult.readTableOrNull(_wordRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$SajdaTable, List<SajdaData>> _sajdaRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.sajda,
    aliasName: $_aliasNameGenerator(db.ayah.verseKey, db.sajda.verseKey),
  );

  $$SajdaTableProcessedTableManager get sajdaRefs {
    final manager = $$SajdaTableTableManager($_db, $_db.sajda).filter(
      (f) => f.verseKey.verseKey.sqlEquals($_itemColumn<String>('verse_key')!),
    );

    final cache = $_typedResult.readTableOrNull(_sajdaRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$TranslationTable, List<TranslationData>>
  _translationRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.translation,
    aliasName: $_aliasNameGenerator(db.ayah.verseKey, db.translation.verseKey),
  );

  $$TranslationTableProcessedTableManager get translationRefs {
    final manager = $$TranslationTableTableManager($_db, $_db.translation)
        .filter(
          (f) =>
              f.verseKey.verseKey.sqlEquals($_itemColumn<String>('verse_key')!),
        );

    final cache = $_typedResult.readTableOrNull(_translationRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$TafsirTable, List<TafsirData>> _tafsirRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.tafsir,
    aliasName: $_aliasNameGenerator(db.ayah.verseKey, db.tafsir.verseKey),
  );

  $$TafsirTableProcessedTableManager get tafsirRefs {
    final manager = $$TafsirTableTableManager($_db, $_db.tafsir).filter(
      (f) => f.verseKey.verseKey.sqlEquals($_itemColumn<String>('verse_key')!),
    );

    final cache = $_typedResult.readTableOrNull(_tafsirRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$AyahFootnoteTable, List<AyahFootnoteData>>
  _ayahFootnoteRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.ayahFootnote,
    aliasName: $_aliasNameGenerator(db.ayah.verseKey, db.ayahFootnote.verseKey),
  );

  $$AyahFootnoteTableProcessedTableManager get ayahFootnoteRefs {
    final manager = $$AyahFootnoteTableTableManager($_db, $_db.ayahFootnote)
        .filter(
          (f) =>
              f.verseKey.verseKey.sqlEquals($_itemColumn<String>('verse_key')!),
        );

    final cache = $_typedResult.readTableOrNull(_ayahFootnoteRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
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

  $$JuzTableFilterComposer get juzNumber {
    final $$JuzTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.juzNumber,
      referencedTable: $db.juz,
      getReferencedColumn: (t) => t.juzNumber,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$JuzTableFilterComposer(
            $db: $db,
            $table: $db.juz,
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

  Expression<bool> wordRefs(
    Expression<bool> Function($$WordTableFilterComposer f) f,
  ) {
    final $$WordTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.verseKey,
      referencedTable: $db.word,
      getReferencedColumn: (t) => t.verseKey,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WordTableFilterComposer(
            $db: $db,
            $table: $db.word,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> sajdaRefs(
    Expression<bool> Function($$SajdaTableFilterComposer f) f,
  ) {
    final $$SajdaTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.verseKey,
      referencedTable: $db.sajda,
      getReferencedColumn: (t) => t.verseKey,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SajdaTableFilterComposer(
            $db: $db,
            $table: $db.sajda,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> translationRefs(
    Expression<bool> Function($$TranslationTableFilterComposer f) f,
  ) {
    final $$TranslationTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.verseKey,
      referencedTable: $db.translation,
      getReferencedColumn: (t) => t.verseKey,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TranslationTableFilterComposer(
            $db: $db,
            $table: $db.translation,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> tafsirRefs(
    Expression<bool> Function($$TafsirTableFilterComposer f) f,
  ) {
    final $$TafsirTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.verseKey,
      referencedTable: $db.tafsir,
      getReferencedColumn: (t) => t.verseKey,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TafsirTableFilterComposer(
            $db: $db,
            $table: $db.tafsir,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> ayahFootnoteRefs(
    Expression<bool> Function($$AyahFootnoteTableFilterComposer f) f,
  ) {
    final $$AyahFootnoteTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.verseKey,
      referencedTable: $db.ayahFootnote,
      getReferencedColumn: (t) => t.verseKey,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AyahFootnoteTableFilterComposer(
            $db: $db,
            $table: $db.ayahFootnote,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
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

  $$JuzTableOrderingComposer get juzNumber {
    final $$JuzTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.juzNumber,
      referencedTable: $db.juz,
      getReferencedColumn: (t) => t.juzNumber,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$JuzTableOrderingComposer(
            $db: $db,
            $table: $db.juz,
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

  $$JuzTableAnnotationComposer get juzNumber {
    final $$JuzTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.juzNumber,
      referencedTable: $db.juz,
      getReferencedColumn: (t) => t.juzNumber,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$JuzTableAnnotationComposer(
            $db: $db,
            $table: $db.juz,
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

  Expression<T> wordRefs<T extends Object>(
    Expression<T> Function($$WordTableAnnotationComposer a) f,
  ) {
    final $$WordTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.verseKey,
      referencedTable: $db.word,
      getReferencedColumn: (t) => t.verseKey,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WordTableAnnotationComposer(
            $db: $db,
            $table: $db.word,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> sajdaRefs<T extends Object>(
    Expression<T> Function($$SajdaTableAnnotationComposer a) f,
  ) {
    final $$SajdaTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.verseKey,
      referencedTable: $db.sajda,
      getReferencedColumn: (t) => t.verseKey,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SajdaTableAnnotationComposer(
            $db: $db,
            $table: $db.sajda,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> translationRefs<T extends Object>(
    Expression<T> Function($$TranslationTableAnnotationComposer a) f,
  ) {
    final $$TranslationTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.verseKey,
      referencedTable: $db.translation,
      getReferencedColumn: (t) => t.verseKey,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TranslationTableAnnotationComposer(
            $db: $db,
            $table: $db.translation,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> tafsirRefs<T extends Object>(
    Expression<T> Function($$TafsirTableAnnotationComposer a) f,
  ) {
    final $$TafsirTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.verseKey,
      referencedTable: $db.tafsir,
      getReferencedColumn: (t) => t.verseKey,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TafsirTableAnnotationComposer(
            $db: $db,
            $table: $db.tafsir,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> ayahFootnoteRefs<T extends Object>(
    Expression<T> Function($$AyahFootnoteTableAnnotationComposer a) f,
  ) {
    final $$AyahFootnoteTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.verseKey,
      referencedTable: $db.ayahFootnote,
      getReferencedColumn: (t) => t.verseKey,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AyahFootnoteTableAnnotationComposer(
            $db: $db,
            $table: $db.ayahFootnote,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
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
            bool juzNumber,
            bool rukuNumber,
            bool wordRefs,
            bool sajdaRefs,
            bool translationRefs,
            bool tafsirRefs,
            bool ayahFootnoteRefs,
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
                Value<int?> juzNumber = const Value.absent(),
                Value<int?> rukuNumber = const Value.absent(),
              }) => AyahCompanion(
                id: id,
                surahNumber: surahNumber,
                verseNumber: verseNumber,
                verseKey: verseKey,
                arabic: arabic,
                pageNumber: pageNumber,
                juzNumber: juzNumber,
                rukuNumber: rukuNumber,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int surahNumber,
                required int verseNumber,
                required String verseKey,
                required String arabic,
                Value<int?> pageNumber = const Value.absent(),
                Value<int?> juzNumber = const Value.absent(),
                Value<int?> rukuNumber = const Value.absent(),
              }) => AyahCompanion.insert(
                id: id,
                surahNumber: surahNumber,
                verseNumber: verseNumber,
                verseKey: verseKey,
                arabic: arabic,
                pageNumber: pageNumber,
                juzNumber: juzNumber,
                rukuNumber: rukuNumber,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$AyahTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                surahNumber = false,
                juzNumber = false,
                rukuNumber = false,
                wordRefs = false,
                sajdaRefs = false,
                translationRefs = false,
                tafsirRefs = false,
                ayahFootnoteRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (wordRefs) db.word,
                    if (sajdaRefs) db.sajda,
                    if (translationRefs) db.translation,
                    if (tafsirRefs) db.tafsir,
                    if (ayahFootnoteRefs) db.ayahFootnote,
                  ],
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
                        if (juzNumber) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.juzNumber,
                                    referencedTable: $$AyahTableReferences
                                        ._juzNumberTable(db),
                                    referencedColumn: $$AyahTableReferences
                                        ._juzNumberTable(db)
                                        .juzNumber,
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

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (wordRefs)
                        await $_getPrefetchedData<
                          AyahData,
                          $AyahTable,
                          WordData
                        >(
                          currentTable: table,
                          referencedTable: $$AyahTableReferences._wordRefsTable(
                            db,
                          ),
                          managerFromTypedResult: (p0) =>
                              $$AyahTableReferences(db, table, p0).wordRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.verseKey == item.verseKey,
                              ),
                          typedResults: items,
                        ),
                      if (sajdaRefs)
                        await $_getPrefetchedData<
                          AyahData,
                          $AyahTable,
                          SajdaData
                        >(
                          currentTable: table,
                          referencedTable: $$AyahTableReferences
                              ._sajdaRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AyahTableReferences(db, table, p0).sajdaRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.verseKey == item.verseKey,
                              ),
                          typedResults: items,
                        ),
                      if (translationRefs)
                        await $_getPrefetchedData<
                          AyahData,
                          $AyahTable,
                          TranslationData
                        >(
                          currentTable: table,
                          referencedTable: $$AyahTableReferences
                              ._translationRefsTable(db),
                          managerFromTypedResult: (p0) => $$AyahTableReferences(
                            db,
                            table,
                            p0,
                          ).translationRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.verseKey == item.verseKey,
                              ),
                          typedResults: items,
                        ),
                      if (tafsirRefs)
                        await $_getPrefetchedData<
                          AyahData,
                          $AyahTable,
                          TafsirData
                        >(
                          currentTable: table,
                          referencedTable: $$AyahTableReferences
                              ._tafsirRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AyahTableReferences(db, table, p0).tafsirRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.verseKey == item.verseKey,
                              ),
                          typedResults: items,
                        ),
                      if (ayahFootnoteRefs)
                        await $_getPrefetchedData<
                          AyahData,
                          $AyahTable,
                          AyahFootnoteData
                        >(
                          currentTable: table,
                          referencedTable: $$AyahTableReferences
                              ._ayahFootnoteRefsTable(db),
                          managerFromTypedResult: (p0) => $$AyahTableReferences(
                            db,
                            table,
                            p0,
                          ).ayahFootnoteRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.verseKey == item.verseKey,
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
        bool juzNumber,
        bool rukuNumber,
        bool wordRefs,
        bool sajdaRefs,
        bool translationRefs,
        bool tafsirRefs,
        bool ayahFootnoteRefs,
      })
    >;
typedef $$WordTableCreateCompanionBuilder =
    WordCompanion Function({
      Value<int> id,
      required String verseKey,
      required int wordNumber,
      required String wordText,
    });
typedef $$WordTableUpdateCompanionBuilder =
    WordCompanion Function({
      Value<int> id,
      Value<String> verseKey,
      Value<int> wordNumber,
      Value<String> wordText,
    });

final class $$WordTableReferences
    extends BaseReferences<_$AppDatabase, $WordTable, WordData> {
  $$WordTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $AyahTable _verseKeyTable(_$AppDatabase db) => db.ayah.createAlias(
    $_aliasNameGenerator(db.word.verseKey, db.ayah.verseKey),
  );

  $$AyahTableProcessedTableManager get verseKey {
    final $_column = $_itemColumn<String>('verse_key')!;

    final manager = $$AyahTableTableManager(
      $_db,
      $_db.ayah,
    ).filter((f) => f.verseKey.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_verseKeyTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$WordTableFilterComposer extends Composer<_$AppDatabase, $WordTable> {
  $$WordTableFilterComposer({
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

  ColumnFilters<int> get wordNumber => $composableBuilder(
    column: $table.wordNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get wordText => $composableBuilder(
    column: $table.wordText,
    builder: (column) => ColumnFilters(column),
  );

  $$AyahTableFilterComposer get verseKey {
    final $$AyahTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.verseKey,
      referencedTable: $db.ayah,
      getReferencedColumn: (t) => t.verseKey,
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
    return composer;
  }
}

class $$WordTableOrderingComposer extends Composer<_$AppDatabase, $WordTable> {
  $$WordTableOrderingComposer({
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

  ColumnOrderings<int> get wordNumber => $composableBuilder(
    column: $table.wordNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get wordText => $composableBuilder(
    column: $table.wordText,
    builder: (column) => ColumnOrderings(column),
  );

  $$AyahTableOrderingComposer get verseKey {
    final $$AyahTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.verseKey,
      referencedTable: $db.ayah,
      getReferencedColumn: (t) => t.verseKey,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AyahTableOrderingComposer(
            $db: $db,
            $table: $db.ayah,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WordTableAnnotationComposer
    extends Composer<_$AppDatabase, $WordTable> {
  $$WordTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get wordNumber => $composableBuilder(
    column: $table.wordNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get wordText =>
      $composableBuilder(column: $table.wordText, builder: (column) => column);

  $$AyahTableAnnotationComposer get verseKey {
    final $$AyahTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.verseKey,
      referencedTable: $db.ayah,
      getReferencedColumn: (t) => t.verseKey,
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
    return composer;
  }
}

class $$WordTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WordTable,
          WordData,
          $$WordTableFilterComposer,
          $$WordTableOrderingComposer,
          $$WordTableAnnotationComposer,
          $$WordTableCreateCompanionBuilder,
          $$WordTableUpdateCompanionBuilder,
          (WordData, $$WordTableReferences),
          WordData,
          PrefetchHooks Function({bool verseKey})
        > {
  $$WordTableTableManager(_$AppDatabase db, $WordTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WordTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WordTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WordTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> verseKey = const Value.absent(),
                Value<int> wordNumber = const Value.absent(),
                Value<String> wordText = const Value.absent(),
              }) => WordCompanion(
                id: id,
                verseKey: verseKey,
                wordNumber: wordNumber,
                wordText: wordText,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String verseKey,
                required int wordNumber,
                required String wordText,
              }) => WordCompanion.insert(
                id: id,
                verseKey: verseKey,
                wordNumber: wordNumber,
                wordText: wordText,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$WordTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({verseKey = false}) {
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
                    if (verseKey) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.verseKey,
                                referencedTable: $$WordTableReferences
                                    ._verseKeyTable(db),
                                referencedColumn: $$WordTableReferences
                                    ._verseKeyTable(db)
                                    .verseKey,
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

typedef $$WordTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WordTable,
      WordData,
      $$WordTableFilterComposer,
      $$WordTableOrderingComposer,
      $$WordTableAnnotationComposer,
      $$WordTableCreateCompanionBuilder,
      $$WordTableUpdateCompanionBuilder,
      (WordData, $$WordTableReferences),
      WordData,
      PrefetchHooks Function({bool verseKey})
    >;
typedef $$PageLineTableCreateCompanionBuilder =
    PageLineCompanion Function({
      required int pageNumber,
      required int lineNumber,
      required String lineType,
      Value<int> isCentered,
      Value<String?> lineText,
      Value<int?> surahNumber,
      Value<int> rowid,
    });
typedef $$PageLineTableUpdateCompanionBuilder =
    PageLineCompanion Function({
      Value<int> pageNumber,
      Value<int> lineNumber,
      Value<String> lineType,
      Value<int> isCentered,
      Value<String?> lineText,
      Value<int?> surahNumber,
      Value<int> rowid,
    });

class $$PageLineTableFilterComposer
    extends Composer<_$AppDatabase, $PageLineTable> {
  $$PageLineTableFilterComposer({
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

  ColumnFilters<int> get lineNumber => $composableBuilder(
    column: $table.lineNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lineType => $composableBuilder(
    column: $table.lineType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get isCentered => $composableBuilder(
    column: $table.isCentered,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lineText => $composableBuilder(
    column: $table.lineText,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get surahNumber => $composableBuilder(
    column: $table.surahNumber,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PageLineTableOrderingComposer
    extends Composer<_$AppDatabase, $PageLineTable> {
  $$PageLineTableOrderingComposer({
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

  ColumnOrderings<int> get lineNumber => $composableBuilder(
    column: $table.lineNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lineType => $composableBuilder(
    column: $table.lineType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get isCentered => $composableBuilder(
    column: $table.isCentered,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lineText => $composableBuilder(
    column: $table.lineText,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get surahNumber => $composableBuilder(
    column: $table.surahNumber,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PageLineTableAnnotationComposer
    extends Composer<_$AppDatabase, $PageLineTable> {
  $$PageLineTableAnnotationComposer({
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

  GeneratedColumn<int> get lineNumber => $composableBuilder(
    column: $table.lineNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lineType =>
      $composableBuilder(column: $table.lineType, builder: (column) => column);

  GeneratedColumn<int> get isCentered => $composableBuilder(
    column: $table.isCentered,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lineText =>
      $composableBuilder(column: $table.lineText, builder: (column) => column);

  GeneratedColumn<int> get surahNumber => $composableBuilder(
    column: $table.surahNumber,
    builder: (column) => column,
  );
}

class $$PageLineTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PageLineTable,
          PageLineData,
          $$PageLineTableFilterComposer,
          $$PageLineTableOrderingComposer,
          $$PageLineTableAnnotationComposer,
          $$PageLineTableCreateCompanionBuilder,
          $$PageLineTableUpdateCompanionBuilder,
          (
            PageLineData,
            BaseReferences<_$AppDatabase, $PageLineTable, PageLineData>,
          ),
          PageLineData,
          PrefetchHooks Function()
        > {
  $$PageLineTableTableManager(_$AppDatabase db, $PageLineTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PageLineTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PageLineTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PageLineTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> pageNumber = const Value.absent(),
                Value<int> lineNumber = const Value.absent(),
                Value<String> lineType = const Value.absent(),
                Value<int> isCentered = const Value.absent(),
                Value<String?> lineText = const Value.absent(),
                Value<int?> surahNumber = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PageLineCompanion(
                pageNumber: pageNumber,
                lineNumber: lineNumber,
                lineType: lineType,
                isCentered: isCentered,
                lineText: lineText,
                surahNumber: surahNumber,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int pageNumber,
                required int lineNumber,
                required String lineType,
                Value<int> isCentered = const Value.absent(),
                Value<String?> lineText = const Value.absent(),
                Value<int?> surahNumber = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PageLineCompanion.insert(
                pageNumber: pageNumber,
                lineNumber: lineNumber,
                lineType: lineType,
                isCentered: isCentered,
                lineText: lineText,
                surahNumber: surahNumber,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PageLineTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PageLineTable,
      PageLineData,
      $$PageLineTableFilterComposer,
      $$PageLineTableOrderingComposer,
      $$PageLineTableAnnotationComposer,
      $$PageLineTableCreateCompanionBuilder,
      $$PageLineTableUpdateCompanionBuilder,
      (
        PageLineData,
        BaseReferences<_$AppDatabase, $PageLineTable, PageLineData>,
      ),
      PageLineData,
      PrefetchHooks Function()
    >;
typedef $$SajdaTableCreateCompanionBuilder =
    SajdaCompanion Function({
      Value<int> sajdaNumber,
      required String verseKey,
      required String sajdaType,
    });
typedef $$SajdaTableUpdateCompanionBuilder =
    SajdaCompanion Function({
      Value<int> sajdaNumber,
      Value<String> verseKey,
      Value<String> sajdaType,
    });

final class $$SajdaTableReferences
    extends BaseReferences<_$AppDatabase, $SajdaTable, SajdaData> {
  $$SajdaTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $AyahTable _verseKeyTable(_$AppDatabase db) => db.ayah.createAlias(
    $_aliasNameGenerator(db.sajda.verseKey, db.ayah.verseKey),
  );

  $$AyahTableProcessedTableManager get verseKey {
    final $_column = $_itemColumn<String>('verse_key')!;

    final manager = $$AyahTableTableManager(
      $_db,
      $_db.ayah,
    ).filter((f) => f.verseKey.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_verseKeyTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SajdaTableFilterComposer extends Composer<_$AppDatabase, $SajdaTable> {
  $$SajdaTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get sajdaNumber => $composableBuilder(
    column: $table.sajdaNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sajdaType => $composableBuilder(
    column: $table.sajdaType,
    builder: (column) => ColumnFilters(column),
  );

  $$AyahTableFilterComposer get verseKey {
    final $$AyahTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.verseKey,
      referencedTable: $db.ayah,
      getReferencedColumn: (t) => t.verseKey,
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
    return composer;
  }
}

class $$SajdaTableOrderingComposer
    extends Composer<_$AppDatabase, $SajdaTable> {
  $$SajdaTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get sajdaNumber => $composableBuilder(
    column: $table.sajdaNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sajdaType => $composableBuilder(
    column: $table.sajdaType,
    builder: (column) => ColumnOrderings(column),
  );

  $$AyahTableOrderingComposer get verseKey {
    final $$AyahTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.verseKey,
      referencedTable: $db.ayah,
      getReferencedColumn: (t) => t.verseKey,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AyahTableOrderingComposer(
            $db: $db,
            $table: $db.ayah,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SajdaTableAnnotationComposer
    extends Composer<_$AppDatabase, $SajdaTable> {
  $$SajdaTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get sajdaNumber => $composableBuilder(
    column: $table.sajdaNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sajdaType =>
      $composableBuilder(column: $table.sajdaType, builder: (column) => column);

  $$AyahTableAnnotationComposer get verseKey {
    final $$AyahTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.verseKey,
      referencedTable: $db.ayah,
      getReferencedColumn: (t) => t.verseKey,
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
    return composer;
  }
}

class $$SajdaTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SajdaTable,
          SajdaData,
          $$SajdaTableFilterComposer,
          $$SajdaTableOrderingComposer,
          $$SajdaTableAnnotationComposer,
          $$SajdaTableCreateCompanionBuilder,
          $$SajdaTableUpdateCompanionBuilder,
          (SajdaData, $$SajdaTableReferences),
          SajdaData,
          PrefetchHooks Function({bool verseKey})
        > {
  $$SajdaTableTableManager(_$AppDatabase db, $SajdaTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SajdaTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SajdaTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SajdaTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> sajdaNumber = const Value.absent(),
                Value<String> verseKey = const Value.absent(),
                Value<String> sajdaType = const Value.absent(),
              }) => SajdaCompanion(
                sajdaNumber: sajdaNumber,
                verseKey: verseKey,
                sajdaType: sajdaType,
              ),
          createCompanionCallback:
              ({
                Value<int> sajdaNumber = const Value.absent(),
                required String verseKey,
                required String sajdaType,
              }) => SajdaCompanion.insert(
                sajdaNumber: sajdaNumber,
                verseKey: verseKey,
                sajdaType: sajdaType,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$SajdaTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({verseKey = false}) {
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
                    if (verseKey) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.verseKey,
                                referencedTable: $$SajdaTableReferences
                                    ._verseKeyTable(db),
                                referencedColumn: $$SajdaTableReferences
                                    ._verseKeyTable(db)
                                    .verseKey,
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

typedef $$SajdaTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SajdaTable,
      SajdaData,
      $$SajdaTableFilterComposer,
      $$SajdaTableOrderingComposer,
      $$SajdaTableAnnotationComposer,
      $$SajdaTableCreateCompanionBuilder,
      $$SajdaTableUpdateCompanionBuilder,
      (SajdaData, $$SajdaTableReferences),
      SajdaData,
      PrefetchHooks Function({bool verseKey})
    >;
typedef $$SourceTableCreateCompanionBuilder =
    SourceCompanion Function({
      required String sourceId,
      required String sourceType,
      required String language,
      required String name,
      Value<String?> author,
      Value<String?> description,
      Value<int> rowid,
    });
typedef $$SourceTableUpdateCompanionBuilder =
    SourceCompanion Function({
      Value<String> sourceId,
      Value<String> sourceType,
      Value<String> language,
      Value<String> name,
      Value<String?> author,
      Value<String?> description,
      Value<int> rowid,
    });

final class $$SourceTableReferences
    extends BaseReferences<_$AppDatabase, $SourceTable, SourceData> {
  $$SourceTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$TranslationTable, List<TranslationData>>
  _translationRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.translation,
    aliasName: $_aliasNameGenerator(
      db.source.sourceId,
      db.translation.sourceId,
    ),
  );

  $$TranslationTableProcessedTableManager get translationRefs {
    final manager = $$TranslationTableTableManager($_db, $_db.translation)
        .filter(
          (f) =>
              f.sourceId.sourceId.sqlEquals($_itemColumn<String>('source_id')!),
        );

    final cache = $_typedResult.readTableOrNull(_translationRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$TafsirTable, List<TafsirData>> _tafsirRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.tafsir,
    aliasName: $_aliasNameGenerator(db.source.sourceId, db.tafsir.sourceId),
  );

  $$TafsirTableProcessedTableManager get tafsirRefs {
    final manager = $$TafsirTableTableManager($_db, $_db.tafsir).filter(
      (f) => f.sourceId.sourceId.sqlEquals($_itemColumn<String>('source_id')!),
    );

    final cache = $_typedResult.readTableOrNull(_tafsirRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SourceTableFilterComposer
    extends Composer<_$AppDatabase, $SourceTable> {
  $$SourceTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get sourceId => $composableBuilder(
    column: $table.sourceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourceType => $composableBuilder(
    column: $table.sourceType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get author => $composableBuilder(
    column: $table.author,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> translationRefs(
    Expression<bool> Function($$TranslationTableFilterComposer f) f,
  ) {
    final $$TranslationTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceId,
      referencedTable: $db.translation,
      getReferencedColumn: (t) => t.sourceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TranslationTableFilterComposer(
            $db: $db,
            $table: $db.translation,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> tafsirRefs(
    Expression<bool> Function($$TafsirTableFilterComposer f) f,
  ) {
    final $$TafsirTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceId,
      referencedTable: $db.tafsir,
      getReferencedColumn: (t) => t.sourceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TafsirTableFilterComposer(
            $db: $db,
            $table: $db.tafsir,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SourceTableOrderingComposer
    extends Composer<_$AppDatabase, $SourceTable> {
  $$SourceTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get sourceId => $composableBuilder(
    column: $table.sourceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourceType => $composableBuilder(
    column: $table.sourceType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get author => $composableBuilder(
    column: $table.author,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SourceTableAnnotationComposer
    extends Composer<_$AppDatabase, $SourceTable> {
  $$SourceTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get sourceId =>
      $composableBuilder(column: $table.sourceId, builder: (column) => column);

  GeneratedColumn<String> get sourceType => $composableBuilder(
    column: $table.sourceType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get language =>
      $composableBuilder(column: $table.language, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get author =>
      $composableBuilder(column: $table.author, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  Expression<T> translationRefs<T extends Object>(
    Expression<T> Function($$TranslationTableAnnotationComposer a) f,
  ) {
    final $$TranslationTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceId,
      referencedTable: $db.translation,
      getReferencedColumn: (t) => t.sourceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TranslationTableAnnotationComposer(
            $db: $db,
            $table: $db.translation,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> tafsirRefs<T extends Object>(
    Expression<T> Function($$TafsirTableAnnotationComposer a) f,
  ) {
    final $$TafsirTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceId,
      referencedTable: $db.tafsir,
      getReferencedColumn: (t) => t.sourceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TafsirTableAnnotationComposer(
            $db: $db,
            $table: $db.tafsir,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SourceTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SourceTable,
          SourceData,
          $$SourceTableFilterComposer,
          $$SourceTableOrderingComposer,
          $$SourceTableAnnotationComposer,
          $$SourceTableCreateCompanionBuilder,
          $$SourceTableUpdateCompanionBuilder,
          (SourceData, $$SourceTableReferences),
          SourceData,
          PrefetchHooks Function({bool translationRefs, bool tafsirRefs})
        > {
  $$SourceTableTableManager(_$AppDatabase db, $SourceTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SourceTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SourceTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SourceTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> sourceId = const Value.absent(),
                Value<String> sourceType = const Value.absent(),
                Value<String> language = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> author = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SourceCompanion(
                sourceId: sourceId,
                sourceType: sourceType,
                language: language,
                name: name,
                author: author,
                description: description,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String sourceId,
                required String sourceType,
                required String language,
                required String name,
                Value<String?> author = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SourceCompanion.insert(
                sourceId: sourceId,
                sourceType: sourceType,
                language: language,
                name: name,
                author: author,
                description: description,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$SourceTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({translationRefs = false, tafsirRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (translationRefs) db.translation,
                    if (tafsirRefs) db.tafsir,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (translationRefs)
                        await $_getPrefetchedData<
                          SourceData,
                          $SourceTable,
                          TranslationData
                        >(
                          currentTable: table,
                          referencedTable: $$SourceTableReferences
                              ._translationRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SourceTableReferences(
                                db,
                                table,
                                p0,
                              ).translationRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.sourceId == item.sourceId,
                              ),
                          typedResults: items,
                        ),
                      if (tafsirRefs)
                        await $_getPrefetchedData<
                          SourceData,
                          $SourceTable,
                          TafsirData
                        >(
                          currentTable: table,
                          referencedTable: $$SourceTableReferences
                              ._tafsirRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SourceTableReferences(db, table, p0).tafsirRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.sourceId == item.sourceId,
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

typedef $$SourceTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SourceTable,
      SourceData,
      $$SourceTableFilterComposer,
      $$SourceTableOrderingComposer,
      $$SourceTableAnnotationComposer,
      $$SourceTableCreateCompanionBuilder,
      $$SourceTableUpdateCompanionBuilder,
      (SourceData, $$SourceTableReferences),
      SourceData,
      PrefetchHooks Function({bool translationRefs, bool tafsirRefs})
    >;
typedef $$TranslationTableCreateCompanionBuilder =
    TranslationCompanion Function({
      Value<int> id,
      required String verseKey,
      required String sourceId,
      required String translationText,
    });
typedef $$TranslationTableUpdateCompanionBuilder =
    TranslationCompanion Function({
      Value<int> id,
      Value<String> verseKey,
      Value<String> sourceId,
      Value<String> translationText,
    });

final class $$TranslationTableReferences
    extends BaseReferences<_$AppDatabase, $TranslationTable, TranslationData> {
  $$TranslationTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $AyahTable _verseKeyTable(_$AppDatabase db) => db.ayah.createAlias(
    $_aliasNameGenerator(db.translation.verseKey, db.ayah.verseKey),
  );

  $$AyahTableProcessedTableManager get verseKey {
    final $_column = $_itemColumn<String>('verse_key')!;

    final manager = $$AyahTableTableManager(
      $_db,
      $_db.ayah,
    ).filter((f) => f.verseKey.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_verseKeyTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $SourceTable _sourceIdTable(_$AppDatabase db) => db.source.createAlias(
    $_aliasNameGenerator(db.translation.sourceId, db.source.sourceId),
  );

  $$SourceTableProcessedTableManager get sourceId {
    final $_column = $_itemColumn<String>('source_id')!;

    final manager = $$SourceTableTableManager(
      $_db,
      $_db.source,
    ).filter((f) => f.sourceId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sourceIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TranslationTableFilterComposer
    extends Composer<_$AppDatabase, $TranslationTable> {
  $$TranslationTableFilterComposer({
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

  ColumnFilters<String> get translationText => $composableBuilder(
    column: $table.translationText,
    builder: (column) => ColumnFilters(column),
  );

  $$AyahTableFilterComposer get verseKey {
    final $$AyahTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.verseKey,
      referencedTable: $db.ayah,
      getReferencedColumn: (t) => t.verseKey,
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
    return composer;
  }

  $$SourceTableFilterComposer get sourceId {
    final $$SourceTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceId,
      referencedTable: $db.source,
      getReferencedColumn: (t) => t.sourceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SourceTableFilterComposer(
            $db: $db,
            $table: $db.source,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TranslationTableOrderingComposer
    extends Composer<_$AppDatabase, $TranslationTable> {
  $$TranslationTableOrderingComposer({
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

  ColumnOrderings<String> get translationText => $composableBuilder(
    column: $table.translationText,
    builder: (column) => ColumnOrderings(column),
  );

  $$AyahTableOrderingComposer get verseKey {
    final $$AyahTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.verseKey,
      referencedTable: $db.ayah,
      getReferencedColumn: (t) => t.verseKey,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AyahTableOrderingComposer(
            $db: $db,
            $table: $db.ayah,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SourceTableOrderingComposer get sourceId {
    final $$SourceTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceId,
      referencedTable: $db.source,
      getReferencedColumn: (t) => t.sourceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SourceTableOrderingComposer(
            $db: $db,
            $table: $db.source,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TranslationTableAnnotationComposer
    extends Composer<_$AppDatabase, $TranslationTable> {
  $$TranslationTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get translationText => $composableBuilder(
    column: $table.translationText,
    builder: (column) => column,
  );

  $$AyahTableAnnotationComposer get verseKey {
    final $$AyahTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.verseKey,
      referencedTable: $db.ayah,
      getReferencedColumn: (t) => t.verseKey,
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
    return composer;
  }

  $$SourceTableAnnotationComposer get sourceId {
    final $$SourceTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceId,
      referencedTable: $db.source,
      getReferencedColumn: (t) => t.sourceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SourceTableAnnotationComposer(
            $db: $db,
            $table: $db.source,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TranslationTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TranslationTable,
          TranslationData,
          $$TranslationTableFilterComposer,
          $$TranslationTableOrderingComposer,
          $$TranslationTableAnnotationComposer,
          $$TranslationTableCreateCompanionBuilder,
          $$TranslationTableUpdateCompanionBuilder,
          (TranslationData, $$TranslationTableReferences),
          TranslationData,
          PrefetchHooks Function({bool verseKey, bool sourceId})
        > {
  $$TranslationTableTableManager(_$AppDatabase db, $TranslationTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TranslationTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TranslationTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TranslationTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> verseKey = const Value.absent(),
                Value<String> sourceId = const Value.absent(),
                Value<String> translationText = const Value.absent(),
              }) => TranslationCompanion(
                id: id,
                verseKey: verseKey,
                sourceId: sourceId,
                translationText: translationText,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String verseKey,
                required String sourceId,
                required String translationText,
              }) => TranslationCompanion.insert(
                id: id,
                verseKey: verseKey,
                sourceId: sourceId,
                translationText: translationText,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TranslationTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({verseKey = false, sourceId = false}) {
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
                    if (verseKey) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.verseKey,
                                referencedTable: $$TranslationTableReferences
                                    ._verseKeyTable(db),
                                referencedColumn: $$TranslationTableReferences
                                    ._verseKeyTable(db)
                                    .verseKey,
                              )
                              as T;
                    }
                    if (sourceId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.sourceId,
                                referencedTable: $$TranslationTableReferences
                                    ._sourceIdTable(db),
                                referencedColumn: $$TranslationTableReferences
                                    ._sourceIdTable(db)
                                    .sourceId,
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

typedef $$TranslationTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TranslationTable,
      TranslationData,
      $$TranslationTableFilterComposer,
      $$TranslationTableOrderingComposer,
      $$TranslationTableAnnotationComposer,
      $$TranslationTableCreateCompanionBuilder,
      $$TranslationTableUpdateCompanionBuilder,
      (TranslationData, $$TranslationTableReferences),
      TranslationData,
      PrefetchHooks Function({bool verseKey, bool sourceId})
    >;
typedef $$TafsirTableCreateCompanionBuilder =
    TafsirCompanion Function({
      Value<int> id,
      required String verseKey,
      required String sourceId,
      Value<String?> groupVerseKey,
      required String tafsirText,
    });
typedef $$TafsirTableUpdateCompanionBuilder =
    TafsirCompanion Function({
      Value<int> id,
      Value<String> verseKey,
      Value<String> sourceId,
      Value<String?> groupVerseKey,
      Value<String> tafsirText,
    });

final class $$TafsirTableReferences
    extends BaseReferences<_$AppDatabase, $TafsirTable, TafsirData> {
  $$TafsirTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $AyahTable _verseKeyTable(_$AppDatabase db) => db.ayah.createAlias(
    $_aliasNameGenerator(db.tafsir.verseKey, db.ayah.verseKey),
  );

  $$AyahTableProcessedTableManager get verseKey {
    final $_column = $_itemColumn<String>('verse_key')!;

    final manager = $$AyahTableTableManager(
      $_db,
      $_db.ayah,
    ).filter((f) => f.verseKey.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_verseKeyTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $SourceTable _sourceIdTable(_$AppDatabase db) => db.source.createAlias(
    $_aliasNameGenerator(db.tafsir.sourceId, db.source.sourceId),
  );

  $$SourceTableProcessedTableManager get sourceId {
    final $_column = $_itemColumn<String>('source_id')!;

    final manager = $$SourceTableTableManager(
      $_db,
      $_db.source,
    ).filter((f) => f.sourceId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sourceIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TafsirTableFilterComposer
    extends Composer<_$AppDatabase, $TafsirTable> {
  $$TafsirTableFilterComposer({
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

  ColumnFilters<String> get groupVerseKey => $composableBuilder(
    column: $table.groupVerseKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tafsirText => $composableBuilder(
    column: $table.tafsirText,
    builder: (column) => ColumnFilters(column),
  );

  $$AyahTableFilterComposer get verseKey {
    final $$AyahTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.verseKey,
      referencedTable: $db.ayah,
      getReferencedColumn: (t) => t.verseKey,
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
    return composer;
  }

  $$SourceTableFilterComposer get sourceId {
    final $$SourceTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceId,
      referencedTable: $db.source,
      getReferencedColumn: (t) => t.sourceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SourceTableFilterComposer(
            $db: $db,
            $table: $db.source,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TafsirTableOrderingComposer
    extends Composer<_$AppDatabase, $TafsirTable> {
  $$TafsirTableOrderingComposer({
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

  ColumnOrderings<String> get groupVerseKey => $composableBuilder(
    column: $table.groupVerseKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tafsirText => $composableBuilder(
    column: $table.tafsirText,
    builder: (column) => ColumnOrderings(column),
  );

  $$AyahTableOrderingComposer get verseKey {
    final $$AyahTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.verseKey,
      referencedTable: $db.ayah,
      getReferencedColumn: (t) => t.verseKey,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AyahTableOrderingComposer(
            $db: $db,
            $table: $db.ayah,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SourceTableOrderingComposer get sourceId {
    final $$SourceTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceId,
      referencedTable: $db.source,
      getReferencedColumn: (t) => t.sourceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SourceTableOrderingComposer(
            $db: $db,
            $table: $db.source,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TafsirTableAnnotationComposer
    extends Composer<_$AppDatabase, $TafsirTable> {
  $$TafsirTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get groupVerseKey => $composableBuilder(
    column: $table.groupVerseKey,
    builder: (column) => column,
  );

  GeneratedColumn<String> get tafsirText => $composableBuilder(
    column: $table.tafsirText,
    builder: (column) => column,
  );

  $$AyahTableAnnotationComposer get verseKey {
    final $$AyahTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.verseKey,
      referencedTable: $db.ayah,
      getReferencedColumn: (t) => t.verseKey,
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
    return composer;
  }

  $$SourceTableAnnotationComposer get sourceId {
    final $$SourceTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceId,
      referencedTable: $db.source,
      getReferencedColumn: (t) => t.sourceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SourceTableAnnotationComposer(
            $db: $db,
            $table: $db.source,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TafsirTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TafsirTable,
          TafsirData,
          $$TafsirTableFilterComposer,
          $$TafsirTableOrderingComposer,
          $$TafsirTableAnnotationComposer,
          $$TafsirTableCreateCompanionBuilder,
          $$TafsirTableUpdateCompanionBuilder,
          (TafsirData, $$TafsirTableReferences),
          TafsirData,
          PrefetchHooks Function({bool verseKey, bool sourceId})
        > {
  $$TafsirTableTableManager(_$AppDatabase db, $TafsirTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TafsirTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TafsirTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TafsirTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> verseKey = const Value.absent(),
                Value<String> sourceId = const Value.absent(),
                Value<String?> groupVerseKey = const Value.absent(),
                Value<String> tafsirText = const Value.absent(),
              }) => TafsirCompanion(
                id: id,
                verseKey: verseKey,
                sourceId: sourceId,
                groupVerseKey: groupVerseKey,
                tafsirText: tafsirText,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String verseKey,
                required String sourceId,
                Value<String?> groupVerseKey = const Value.absent(),
                required String tafsirText,
              }) => TafsirCompanion.insert(
                id: id,
                verseKey: verseKey,
                sourceId: sourceId,
                groupVerseKey: groupVerseKey,
                tafsirText: tafsirText,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$TafsirTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({verseKey = false, sourceId = false}) {
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
                    if (verseKey) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.verseKey,
                                referencedTable: $$TafsirTableReferences
                                    ._verseKeyTable(db),
                                referencedColumn: $$TafsirTableReferences
                                    ._verseKeyTable(db)
                                    .verseKey,
                              )
                              as T;
                    }
                    if (sourceId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.sourceId,
                                referencedTable: $$TafsirTableReferences
                                    ._sourceIdTable(db),
                                referencedColumn: $$TafsirTableReferences
                                    ._sourceIdTable(db)
                                    .sourceId,
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

typedef $$TafsirTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TafsirTable,
      TafsirData,
      $$TafsirTableFilterComposer,
      $$TafsirTableOrderingComposer,
      $$TafsirTableAnnotationComposer,
      $$TafsirTableCreateCompanionBuilder,
      $$TafsirTableUpdateCompanionBuilder,
      (TafsirData, $$TafsirTableReferences),
      TafsirData,
      PrefetchHooks Function({bool verseKey, bool sourceId})
    >;
typedef $$FootnoteTableCreateCompanionBuilder =
    FootnoteCompanion Function({
      Value<int> id,
      required int footnoteId,
      required String footnoteText,
    });
typedef $$FootnoteTableUpdateCompanionBuilder =
    FootnoteCompanion Function({
      Value<int> id,
      Value<int> footnoteId,
      Value<String> footnoteText,
    });

final class $$FootnoteTableReferences
    extends BaseReferences<_$AppDatabase, $FootnoteTable, FootnoteData> {
  $$FootnoteTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$AyahFootnoteTable, List<AyahFootnoteData>>
  _ayahFootnoteRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.ayahFootnote,
    aliasName: $_aliasNameGenerator(
      db.footnote.footnoteId,
      db.ayahFootnote.footnoteId,
    ),
  );

  $$AyahFootnoteTableProcessedTableManager get ayahFootnoteRefs {
    final manager = $$AyahFootnoteTableTableManager($_db, $_db.ayahFootnote)
        .filter(
          (f) => f.footnoteId.footnoteId.sqlEquals(
            $_itemColumn<int>('footnote_id')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(_ayahFootnoteRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$FootnoteTableFilterComposer
    extends Composer<_$AppDatabase, $FootnoteTable> {
  $$FootnoteTableFilterComposer({
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

  ColumnFilters<int> get footnoteId => $composableBuilder(
    column: $table.footnoteId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get footnoteText => $composableBuilder(
    column: $table.footnoteText,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> ayahFootnoteRefs(
    Expression<bool> Function($$AyahFootnoteTableFilterComposer f) f,
  ) {
    final $$AyahFootnoteTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.footnoteId,
      referencedTable: $db.ayahFootnote,
      getReferencedColumn: (t) => t.footnoteId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AyahFootnoteTableFilterComposer(
            $db: $db,
            $table: $db.ayahFootnote,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$FootnoteTableOrderingComposer
    extends Composer<_$AppDatabase, $FootnoteTable> {
  $$FootnoteTableOrderingComposer({
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

  ColumnOrderings<int> get footnoteId => $composableBuilder(
    column: $table.footnoteId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get footnoteText => $composableBuilder(
    column: $table.footnoteText,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FootnoteTableAnnotationComposer
    extends Composer<_$AppDatabase, $FootnoteTable> {
  $$FootnoteTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get footnoteId => $composableBuilder(
    column: $table.footnoteId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get footnoteText => $composableBuilder(
    column: $table.footnoteText,
    builder: (column) => column,
  );

  Expression<T> ayahFootnoteRefs<T extends Object>(
    Expression<T> Function($$AyahFootnoteTableAnnotationComposer a) f,
  ) {
    final $$AyahFootnoteTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.footnoteId,
      referencedTable: $db.ayahFootnote,
      getReferencedColumn: (t) => t.footnoteId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AyahFootnoteTableAnnotationComposer(
            $db: $db,
            $table: $db.ayahFootnote,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$FootnoteTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FootnoteTable,
          FootnoteData,
          $$FootnoteTableFilterComposer,
          $$FootnoteTableOrderingComposer,
          $$FootnoteTableAnnotationComposer,
          $$FootnoteTableCreateCompanionBuilder,
          $$FootnoteTableUpdateCompanionBuilder,
          (FootnoteData, $$FootnoteTableReferences),
          FootnoteData,
          PrefetchHooks Function({bool ayahFootnoteRefs})
        > {
  $$FootnoteTableTableManager(_$AppDatabase db, $FootnoteTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FootnoteTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FootnoteTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FootnoteTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> footnoteId = const Value.absent(),
                Value<String> footnoteText = const Value.absent(),
              }) => FootnoteCompanion(
                id: id,
                footnoteId: footnoteId,
                footnoteText: footnoteText,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int footnoteId,
                required String footnoteText,
              }) => FootnoteCompanion.insert(
                id: id,
                footnoteId: footnoteId,
                footnoteText: footnoteText,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$FootnoteTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({ayahFootnoteRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (ayahFootnoteRefs) db.ayahFootnote],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (ayahFootnoteRefs)
                    await $_getPrefetchedData<
                      FootnoteData,
                      $FootnoteTable,
                      AyahFootnoteData
                    >(
                      currentTable: table,
                      referencedTable: $$FootnoteTableReferences
                          ._ayahFootnoteRefsTable(db),
                      managerFromTypedResult: (p0) => $$FootnoteTableReferences(
                        db,
                        table,
                        p0,
                      ).ayahFootnoteRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.footnoteId == item.footnoteId,
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

typedef $$FootnoteTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FootnoteTable,
      FootnoteData,
      $$FootnoteTableFilterComposer,
      $$FootnoteTableOrderingComposer,
      $$FootnoteTableAnnotationComposer,
      $$FootnoteTableCreateCompanionBuilder,
      $$FootnoteTableUpdateCompanionBuilder,
      (FootnoteData, $$FootnoteTableReferences),
      FootnoteData,
      PrefetchHooks Function({bool ayahFootnoteRefs})
    >;
typedef $$AyahFootnoteTableCreateCompanionBuilder =
    AyahFootnoteCompanion Function({
      Value<int> id,
      required String verseKey,
      required int footnoteNumber,
      required int footnoteId,
    });
typedef $$AyahFootnoteTableUpdateCompanionBuilder =
    AyahFootnoteCompanion Function({
      Value<int> id,
      Value<String> verseKey,
      Value<int> footnoteNumber,
      Value<int> footnoteId,
    });

final class $$AyahFootnoteTableReferences
    extends
        BaseReferences<_$AppDatabase, $AyahFootnoteTable, AyahFootnoteData> {
  $$AyahFootnoteTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $AyahTable _verseKeyTable(_$AppDatabase db) => db.ayah.createAlias(
    $_aliasNameGenerator(db.ayahFootnote.verseKey, db.ayah.verseKey),
  );

  $$AyahTableProcessedTableManager get verseKey {
    final $_column = $_itemColumn<String>('verse_key')!;

    final manager = $$AyahTableTableManager(
      $_db,
      $_db.ayah,
    ).filter((f) => f.verseKey.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_verseKeyTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $FootnoteTable _footnoteIdTable(_$AppDatabase db) =>
      db.footnote.createAlias(
        $_aliasNameGenerator(
          db.ayahFootnote.footnoteId,
          db.footnote.footnoteId,
        ),
      );

  $$FootnoteTableProcessedTableManager get footnoteId {
    final $_column = $_itemColumn<int>('footnote_id')!;

    final manager = $$FootnoteTableTableManager(
      $_db,
      $_db.footnote,
    ).filter((f) => f.footnoteId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_footnoteIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AyahFootnoteTableFilterComposer
    extends Composer<_$AppDatabase, $AyahFootnoteTable> {
  $$AyahFootnoteTableFilterComposer({
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

  ColumnFilters<int> get footnoteNumber => $composableBuilder(
    column: $table.footnoteNumber,
    builder: (column) => ColumnFilters(column),
  );

  $$AyahTableFilterComposer get verseKey {
    final $$AyahTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.verseKey,
      referencedTable: $db.ayah,
      getReferencedColumn: (t) => t.verseKey,
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
    return composer;
  }

  $$FootnoteTableFilterComposer get footnoteId {
    final $$FootnoteTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.footnoteId,
      referencedTable: $db.footnote,
      getReferencedColumn: (t) => t.footnoteId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FootnoteTableFilterComposer(
            $db: $db,
            $table: $db.footnote,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AyahFootnoteTableOrderingComposer
    extends Composer<_$AppDatabase, $AyahFootnoteTable> {
  $$AyahFootnoteTableOrderingComposer({
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

  ColumnOrderings<int> get footnoteNumber => $composableBuilder(
    column: $table.footnoteNumber,
    builder: (column) => ColumnOrderings(column),
  );

  $$AyahTableOrderingComposer get verseKey {
    final $$AyahTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.verseKey,
      referencedTable: $db.ayah,
      getReferencedColumn: (t) => t.verseKey,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AyahTableOrderingComposer(
            $db: $db,
            $table: $db.ayah,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$FootnoteTableOrderingComposer get footnoteId {
    final $$FootnoteTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.footnoteId,
      referencedTable: $db.footnote,
      getReferencedColumn: (t) => t.footnoteId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FootnoteTableOrderingComposer(
            $db: $db,
            $table: $db.footnote,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AyahFootnoteTableAnnotationComposer
    extends Composer<_$AppDatabase, $AyahFootnoteTable> {
  $$AyahFootnoteTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get footnoteNumber => $composableBuilder(
    column: $table.footnoteNumber,
    builder: (column) => column,
  );

  $$AyahTableAnnotationComposer get verseKey {
    final $$AyahTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.verseKey,
      referencedTable: $db.ayah,
      getReferencedColumn: (t) => t.verseKey,
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
    return composer;
  }

  $$FootnoteTableAnnotationComposer get footnoteId {
    final $$FootnoteTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.footnoteId,
      referencedTable: $db.footnote,
      getReferencedColumn: (t) => t.footnoteId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FootnoteTableAnnotationComposer(
            $db: $db,
            $table: $db.footnote,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AyahFootnoteTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AyahFootnoteTable,
          AyahFootnoteData,
          $$AyahFootnoteTableFilterComposer,
          $$AyahFootnoteTableOrderingComposer,
          $$AyahFootnoteTableAnnotationComposer,
          $$AyahFootnoteTableCreateCompanionBuilder,
          $$AyahFootnoteTableUpdateCompanionBuilder,
          (AyahFootnoteData, $$AyahFootnoteTableReferences),
          AyahFootnoteData,
          PrefetchHooks Function({bool verseKey, bool footnoteId})
        > {
  $$AyahFootnoteTableTableManager(_$AppDatabase db, $AyahFootnoteTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AyahFootnoteTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AyahFootnoteTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AyahFootnoteTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> verseKey = const Value.absent(),
                Value<int> footnoteNumber = const Value.absent(),
                Value<int> footnoteId = const Value.absent(),
              }) => AyahFootnoteCompanion(
                id: id,
                verseKey: verseKey,
                footnoteNumber: footnoteNumber,
                footnoteId: footnoteId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String verseKey,
                required int footnoteNumber,
                required int footnoteId,
              }) => AyahFootnoteCompanion.insert(
                id: id,
                verseKey: verseKey,
                footnoteNumber: footnoteNumber,
                footnoteId: footnoteId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AyahFootnoteTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({verseKey = false, footnoteId = false}) {
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
                    if (verseKey) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.verseKey,
                                referencedTable: $$AyahFootnoteTableReferences
                                    ._verseKeyTable(db),
                                referencedColumn: $$AyahFootnoteTableReferences
                                    ._verseKeyTable(db)
                                    .verseKey,
                              )
                              as T;
                    }
                    if (footnoteId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.footnoteId,
                                referencedTable: $$AyahFootnoteTableReferences
                                    ._footnoteIdTable(db),
                                referencedColumn: $$AyahFootnoteTableReferences
                                    ._footnoteIdTable(db)
                                    .footnoteId,
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

typedef $$AyahFootnoteTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AyahFootnoteTable,
      AyahFootnoteData,
      $$AyahFootnoteTableFilterComposer,
      $$AyahFootnoteTableOrderingComposer,
      $$AyahFootnoteTableAnnotationComposer,
      $$AyahFootnoteTableCreateCompanionBuilder,
      $$AyahFootnoteTableUpdateCompanionBuilder,
      (AyahFootnoteData, $$AyahFootnoteTableReferences),
      AyahFootnoteData,
      PrefetchHooks Function({bool verseKey, bool footnoteId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SurahTableTableManager get surah =>
      $$SurahTableTableManager(_db, _db.surah);
  $$JuzTableTableManager get juz => $$JuzTableTableManager(_db, _db.juz);
  $$RukuTableTableManager get ruku => $$RukuTableTableManager(_db, _db.ruku);
  $$AyahTableTableManager get ayah => $$AyahTableTableManager(_db, _db.ayah);
  $$WordTableTableManager get word => $$WordTableTableManager(_db, _db.word);
  $$PageLineTableTableManager get pageLine =>
      $$PageLineTableTableManager(_db, _db.pageLine);
  $$SajdaTableTableManager get sajda =>
      $$SajdaTableTableManager(_db, _db.sajda);
  $$SourceTableTableManager get source =>
      $$SourceTableTableManager(_db, _db.source);
  $$TranslationTableTableManager get translation =>
      $$TranslationTableTableManager(_db, _db.translation);
  $$TafsirTableTableManager get tafsir =>
      $$TafsirTableTableManager(_db, _db.tafsir);
  $$FootnoteTableTableManager get footnote =>
      $$FootnoteTableTableManager(_db, _db.footnote);
  $$AyahFootnoteTableTableManager get ayahFootnote =>
      $$AyahFootnoteTableTableManager(_db, _db.ayahFootnote);
}
