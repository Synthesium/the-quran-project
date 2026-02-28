import 'package:flutter/material.dart';

import '../widgets/ayah_revision_heatmap.dart';
import '../widgets/daily_ayah_card.dart';
import '../widgets/khatim_heatmap.dart';
import 'pattern_lab_screen.dart';
import 'surah_patterns_screen.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Component Tests'),
      ),
      body: ListView(
        children: [
          _ComponentTile(
            title: 'Daily Ayah Card',
            description: 'Random ayah with Arabic, English, and Japanese translations',
            onTap: () => _openComponent(context, const _DailyAyahTest()),
          ),
          _ComponentTile(
            title: 'Khatim Heatmap',
            description: 'GitHub-style heatmap using 8-pointed star symbols',
            onTap: () => _openComponent(context, const _KhatimHeatmapTest()),
          ),
          _ComponentTile(
            title: 'Surah Patterns',
            description: 'Unique Islamic geometric patterns for each surah',
            onTap: () => _openComponent(context, const SurahPatternsScreen()),
          ),
          _ComponentTile(
            title: 'Pattern Lab',
            description: 'Experiment with Islamic geometric pattern construction',
            onTap: () => _openComponent(context, const PatternLabScreen()),
          ),
          _ComponentTile(
            title: 'Ayah Revision Heatmap',
            description: 'Hexagonal tiles showing revision status for all 6236 ayahs',
            onTap: () => _openComponent(context, const _AyahRevisionHeatmapTest()),
          ),
        ],
      ),
    );
  }

  void _openComponent(BuildContext context, Widget component) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => component),
    );
  }
}

class _ComponentTile extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onTap;

  const _ComponentTile({
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(description),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}

class _DailyAyahTest extends StatelessWidget {
  const _DailyAyahTest();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Ayah Card'),
      ),
      body: const SingleChildScrollView(
        child: DailyAyahCard(),
      ),
    );
  }
}

class _KhatimHeatmapTest extends StatelessWidget {
  const _KhatimHeatmapTest();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Khatim Heatmap'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Quran Reading Activity',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              const KhatimHeatmap(
                weeks: 52,
                cellSize: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AyahRevisionHeatmapTest extends StatelessWidget {
  const _AyahRevisionHeatmapTest();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ayah Revision Heatmap'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: AyahRevisionHeatmap(),
      ),
    );
  }
}
