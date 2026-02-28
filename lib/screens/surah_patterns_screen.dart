import 'package:flutter/material.dart';

import '../db/database.dart';
import '../widgets/surah_pattern.dart';

/// Screen displaying all 114 surahs with their unique geometric patterns
class SurahPatternsScreen extends StatefulWidget {
  const SurahPatternsScreen({super.key});

  @override
  State<SurahPatternsScreen> createState() => _SurahPatternsScreenState();
}

class _SurahPatternsScreenState extends State<SurahPatternsScreen> {
  late Future<List<SurahData>> _surahsFuture;

  @override
  void initState() {
    super.initState();
    _surahsFuture = AppDatabase.instance.getAllSurahs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Surah Patterns'),
      ),
      body: FutureBuilder<List<SurahData>>(
        future: _surahsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          final surahs = snapshot.data ?? [];

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: surahs.length,
            itemBuilder: (context, index) {
              final surah = surahs[index];
              return _SurahListTile(
                surah: surah,
                onTap: () => _openPatternDetail(context, surah),
              );
            },
          );
        },
      ),
    );
  }

  void _openPatternDetail(BuildContext context, SurahData surah) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => _SurahPatternDetailScreen(surah: surah),
      ),
    );
  }
}

class _SurahListTile extends StatelessWidget {
  final SurahData surah;
  final VoidCallback onTap;

  const _SurahListTile({
    required this.surah,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              // Mini pattern preview
              SurahPattern(
                surah: surah,
                size: 60,
              ),
              const SizedBox(width: 16),
              // Surah info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            '${surah.surahNumber}',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onPrimaryContainer,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            surah.nameEnglish,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      surah.nameArabic,
                      style: TextStyle(
                        fontFamily: 'AlQuran',
                        fontSize: 18,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${surah.totalVerses} verses • ${surah.revelationPlace ?? 'Unknown'}',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}

class _SurahPatternDetailScreen extends StatelessWidget {
  final SurahData surah;

  const _SurahPatternDetailScreen({required this.surah});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final patternSize = screenWidth - 64;

    return Scaffold(
      appBar: AppBar(
        title: Text(surah.nameEnglish),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // Surah header
            _buildSurahHeader(context),
            const SizedBox(height: 32),
            // Main pattern
            Center(
              child: SurahPattern(
                surah: surah,
                size: patternSize,
              ),
            ),
            const SizedBox(height: 32),
            // Pattern info
            _buildPatternInfo(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSurahHeader(BuildContext context) {
    return Column(
      children: [
        Text(
          surah.nameArabic,
          style: TextStyle(
            fontFamily: 'AlQuran',
            fontSize: 48,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          surah.nameEnglish,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        if (surah.nameTransliteration != null) ...[
          const SizedBox(height: 4),
          Text(
            surah.nameTransliteration!,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildPatternInfo(BuildContext context) {
    final isMakki = surah.revelationPlace?.toLowerCase() == 'makkah';

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pattern Characteristics',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const Divider(),
            _buildInfoRow(
              context,
              'Surah Number',
              '${surah.surahNumber} of 114',
            ),
            _buildInfoRow(
              context,
              'Verses',
              '${surah.totalVerses}',
            ),
            _buildInfoRow(
              context,
              'Revelation',
              surah.revelationPlace ?? 'Unknown',
            ),
            if (surah.revelationOrder != null)
              _buildInfoRow(
                context,
                'Revelation Order',
                '${surah.revelationOrder}',
              ),
            const SizedBox(height: 12),
            Text(
              'Pattern Elements',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildChip(context, '${_calculateStarPoints()}-pointed star'),
                _buildChip(context, '${_calculateLayers()} layers'),
                _buildChip(context, isMakki ? 'Warm tones' : 'Cool tones'),
                _buildChip(context, 'Unique hue: ${_calculateHue().toInt()}°'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChip(BuildContext context, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          color: Theme.of(context).colorScheme.onSecondaryContainer,
        ),
      ),
    );
  }

  int _calculateStarPoints() {
    final mod = surah.totalVerses % 8;
    return [6, 8, 10, 12, 6, 8, 10, 12][mod];
  }

  int _calculateLayers() {
    if (surah.totalVerses <= 20) return 2;
    if (surah.totalVerses <= 50) return 3;
    if (surah.totalVerses <= 100) return 4;
    return 5;
  }

  double _calculateHue() {
    final baseHue = (surah.surahNumber * 137.508) % 360;
    final isMakki = surah.revelationPlace?.toLowerCase() == 'makkah';
    final hueShift = isMakki ? 0 : 180;
    return (baseHue + hueShift) % 360;
  }
}
