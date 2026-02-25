import 'package:flutter/material.dart';

import '../widgets/daily_ayah_card.dart';

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
