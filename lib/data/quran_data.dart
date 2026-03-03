/// Quran Navigation Data for Naskh Mushaf
///
/// This file contains hardcoded navigation arrays for the Naskh mushaf (611 pages).
/// Page 1 is the title page, content starts at page 2.
library;

// Total pages in Naskh mushaf
const naskhNumberOfPages = 611;

// Lines per page
const naskhLinesPerPage = 15;

/// Starting page for each Juz (1-30) in Naskh mushaf
const naskhPageForJuz = [
  /*  1 - 10 */   2,  23,  43,  63,  83, 103, 123, 143, 163, 183,
  /* 11 - 20 */ 203, 223, 243, 263, 283, 303, 323, 343, 363, 383,
  /* 21 - 30 */ 403, 423, 443, 463, 483, 503, 523, 543, 563, 587,
];

/// Starting page for each Surah (1-114) in Naskh mushaf
const naskhPageForSura = [
  /*   1 -  10 */   2,   3,  51,  78, 107, 129, 152, 178, 188, 209,
  /*  11 -  20 */ 222, 236, 250, 256, 262, 268, 283, 294, 306, 313,
  /*  21 -  30 */ 323, 332, 343, 351, 360, 367, 377, 386, 397, 405,
  /*  31 -  40 */ 412, 416, 419, 429, 435, 441, 446, 453, 459, 468,
  /*  41 -  50 */ 478, 484, 490, 496, 499, 503, 507, 512, 516, 519,
  /*  51 -  60 */ 521, 524, 527, 529, 532, 535, 538, 543, 546, 550,
  /*  61 -  70 */ 552, 554, 555, 557, 559, 561, 563, 565, 568, 570,
  /*  71 -  80 */ 572, 574, 577, 579, 581, 583, 585, 587, 588, 590,
  /*  81 -  90 */ 591, 592, 593, 595, 596, 597, 598, 598, 599, 601,
  /*  91 - 100 */ 601, 602, 603, 603, 604, 604, 605, 605, 606, 606,
  /* 101 - 110 */ 607, 607, 608, 608, 608, 609, 609, 609, 609, 610,
  /* 111 - 114 */ 610, 610, 611, 611,
];

/// Number of Ayahs in each Surah (1-114)
const numberOfAyahsForSura = [
  /*  1 -  14 */ 7, 286, 200, 176, 120, 165, 206, 75, 129, 109, 123, 111, 43, 52,
  /* 15 -  28 */ 99, 128, 111, 110, 98, 135, 112, 78, 118, 64, 77, 227, 93, 88,
  /* 29 -  42 */ 69, 60, 34, 30, 73, 54, 45, 83, 182, 88, 75, 85, 54, 53,
  /* 43 -  56 */ 89, 59, 37, 35, 38, 29, 18, 45, 60, 49, 62, 55, 78, 96,
  /* 57 -  70 */ 29, 22, 24, 13, 14, 11, 11, 18, 12, 12, 30, 52, 52, 44,
  /* 71 -  84 */ 28, 28, 20, 56, 40, 31, 50, 40, 46, 42, 29, 19, 36, 25,
  /* 85 -  98 */ 22, 17, 19, 26, 30, 20, 15, 21, 11, 8, 8, 19, 5, 8,
  /* 99 - 114 */ 8, 11, 11, 8, 3, 9, 5, 4, 7, 3, 6, 3, 5, 4, 5, 6,
];

/// Surah names in Arabic
const surahNamesArabic = [
  'الفاتحة', 'البقرة', 'آل عمران', 'النساء', 'المائدة', 'الأنعام',
  'الأعراف', 'الأنفال', 'التوبة', 'يونس', 'هود', 'يوسف',
  'الرعد', 'إبراهيم', 'الحجر', 'النحل', 'الإسراء', 'الكهف',
  'مريم', 'طه', 'الأنبياء', 'الحج', 'المؤمنون', 'النور',
  'الفرقان', 'الشعراء', 'النمل', 'القصص', 'العنكبوت', 'الروم',
  'لقمان', 'السجدة', 'الأحزاب', 'سبأ', 'فاطر', 'يس',
  'الصافات', 'ص', 'الزمر', 'غافر', 'فصلت', 'الشورى',
  'الزخرف', 'الدخان', 'الجاثية', 'الأحقاف', 'محمد', 'الفتح',
  'الحجرات', 'ق', 'الذاريات', 'الطور', 'النجم', 'القمر',
  'الرحمن', 'الواقعة', 'الحديد', 'المجادلة', 'الحشر', 'الممتحنة',
  'الصف', 'الجمعة', 'المنافقون', 'التغابن', 'الطلاق', 'التحريم',
  'الملك', 'القلم', 'الحاقة', 'المعارج', 'نوح', 'الجن',
  'المزمل', 'المدثر', 'القيامة', 'الإنسان', 'المرسلات', 'النبأ',
  'النازعات', 'عبس', 'التكوير', 'الانفطار', 'المطففين', 'الانشقاق',
  'البروج', 'الطارق', 'الأعلى', 'الغاشية', 'الفجر', 'البلد',
  'الشمس', 'الليل', 'الضحى', 'الشرح', 'التين', 'العلق',
  'القدر', 'البينة', 'الزلزلة', 'العاديات', 'القارعة', 'التكاثر',
  'العصر', 'الهمزة', 'الفيل', 'قريش', 'الماعون', 'الكوثر',
  'الكافرون', 'النصر', 'المسد', 'الإخلاص', 'الفلق', 'الناس',
];

/// Surah names in English transliteration
const surahNamesEnglish = [
  'Al-Fatihah', 'Al-Baqarah', 'Aal-E-Imran', 'An-Nisa', 'Al-Maidah', 'Al-Anam',
  'Al-Araf', 'Al-Anfal', 'At-Tawbah', 'Yunus', 'Hud', 'Yusuf',
  'Ar-Rad', 'Ibrahim', 'Al-Hijr', 'An-Nahl', 'Al-Isra', 'Al-Kahf',
  'Maryam', 'Taha', 'Al-Anbiya', 'Al-Hajj', 'Al-Muminun', 'An-Nur',
  'Al-Furqan', 'Ash-Shuara', 'An-Naml', 'Al-Qasas', 'Al-Ankabut', 'Ar-Rum',
  'Luqman', 'As-Sajdah', 'Al-Ahzab', 'Saba', 'Fatir', 'Ya-Sin',
  'As-Saffat', 'Sad', 'Az-Zumar', 'Ghafir', 'Fussilat', 'Ash-Shura',
  'Az-Zukhruf', 'Ad-Dukhan', 'Al-Jathiyah', 'Al-Ahqaf', 'Muhammad', 'Al-Fath',
  'Al-Hujurat', 'Qaf', 'Adh-Dhariyat', 'At-Tur', 'An-Najm', 'Al-Qamar',
  'Ar-Rahman', 'Al-Waqiah', 'Al-Hadid', 'Al-Mujadila', 'Al-Hashr', 'Al-Mumtahanah',
  'As-Saf', 'Al-Jumuah', 'Al-Munafiqun', 'At-Taghabun', 'At-Talaq', 'At-Tahrim',
  'Al-Mulk', 'Al-Qalam', 'Al-Haqqah', 'Al-Maarij', 'Nuh', 'Al-Jinn',
  'Al-Muzzammil', 'Al-Muddaththir', 'Al-Qiyamah', 'Al-Insan', 'Al-Mursalat', 'An-Naba',
  'An-Naziat', 'Abasa', 'At-Takwir', 'Al-Infitar', 'Al-Mutaffifin', 'Al-Inshiqaq',
  'Al-Buruj', 'At-Tariq', 'Al-Ala', 'Al-Ghashiyah', 'Al-Fajr', 'Al-Balad',
  'Ash-Shams', 'Al-Layl', 'Ad-Duhaa', 'Ash-Sharh', 'At-Tin', 'Al-Alaq',
  'Al-Qadr', 'Al-Bayyinah', 'Az-Zalzalah', 'Al-Adiyat', 'Al-Qariah', 'At-Takathur',
  'Al-Asr', 'Al-Humazah', 'Al-Fil', 'Quraysh', 'Al-Maun', 'Al-Kawthar',
  'Al-Kafirun', 'An-Nasr', 'Al-Masad', 'Al-Ikhlas', 'Al-Falaq', 'An-Nas',
];

/// Whether each Surah is Makki (true) or Madani (false)
const isMakkiBySura = [
  /*   1 -  10 */  true, false, false, false, false, true, true, false, false, true,
  /*  11 -  20 */  true, true, false, true, true, true, true, true, true, true,
  /*  21 -  30 */  true, false, true, false, true, true, true, true, true, true,
  /*  31 -  40 */  true, true, false, true, true, true, true, true, true, true,
  /*  41 -  50 */  true, true, true, true, true, true, false, false, false, true,
  /*  51 -  60 */  true, true, true, true, false, true, false, false, false, false,
  /*  61 -  70 */  false, false, false, false, false, false, true, true, true, true,
  /*  71 -  80 */  true, true, true, true, true, false, true, true, true, true,
  /*  81 -  90 */  true, true, true, true, true, true, true, true, true, true,
  /*  91 - 100 */  true, true, true, true, true, true, true, false, false, true,
  /* 101 - 110 */  true, true, true, true, true, true, true, true, true, false,
  /* 111 - 114 */  true, true, true, true,
];

// Helper functions

/// Get starting page for a Juz (1-30) in Naskh mushaf
int getPageForJuz(int juz) => naskhPageForJuz[juz - 1];

/// Get starting page for a Surah (1-114) in Naskh mushaf
int getPageForSura(int sura) => naskhPageForSura[sura - 1];

/// Get Juz number for a page in Naskh mushaf
int getJuzForPage(int page) {
  for (int i = naskhPageForJuz.length - 1; i >= 0; i--) {
    if (page >= naskhPageForJuz[i]) return i + 1;
  }
  return 1;
}

/// Get Surah number for a page in Naskh mushaf
int getSuraForPage(int page) {
  for (int i = naskhPageForSura.length - 1; i >= 0; i--) {
    if (page >= naskhPageForSura[i]) return i + 1;
  }
  return 1;
}

/// Get number of Ayahs in a Surah
int getAyahCountForSura(int sura) => numberOfAyahsForSura[sura - 1];

/// Check if a Surah is Makki
bool isSuraMakki(int sura) => isMakkiBySura[sura - 1];

/// Get Surah name in Arabic
String getSurahNameArabic(int sura) => surahNamesArabic[sura - 1];

/// Get Surah name in English
String getSurahNameEnglish(int sura) => surahNamesEnglish[sura - 1];

/// Get the end page for a Juz
int getEndPageForJuz(int juz) {
  if (juz == 30) return naskhNumberOfPages;
  return naskhPageForJuz[juz] - 1;
}

/// Get the end page for a Surah
int getEndPageForSura(int sura) {
  if (sura == 114) return naskhNumberOfPages;
  return naskhPageForSura[sura] - 1;
}

/// Total number of Surahs
const totalSurahs = 114;

/// Total number of Juz
const totalJuz = 30;

/// Total number of Ayahs in the Quran
const totalAyahsInQuran = 6236;
