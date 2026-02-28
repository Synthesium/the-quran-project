import 'package:flutter/material.dart';

import '../db/database.dart';
import '../widgets/mushaf_page_view.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  int _currentPage = 1;

  void _showSurahIndex() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        expand: false,
        builder: (context, scrollController) => _SurahIndexSheet(
          scrollController: scrollController,
          onSurahSelected: (startPage) {
            Navigator.pop(context);
            setState(() => _currentPage = startPage);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MushafPageView(
            key: ValueKey(_currentPage),
            initialPage: _currentPage,
            onPageChanged: (page) {
              _currentPage = page;
            },
          ),
          // Floating action button for surah index
          Positioned(
            bottom: 80,
            right: 16,
            child: FloatingActionButton(
              onPressed: _showSurahIndex,
              tooltip: 'Surah Index',
              child: const Icon(Icons.list),
            ),
          ),
        ],
      ),
    );
  }
}

/// Bottom sheet showing surah index
class _SurahIndexSheet extends StatefulWidget {
  final ScrollController scrollController;
  final void Function(int startPage) onSurahSelected;

  const _SurahIndexSheet({
    required this.scrollController,
    required this.onSurahSelected,
  });

  @override
  State<_SurahIndexSheet> createState() => _SurahIndexSheetState();
}

class _SurahIndexSheetState extends State<_SurahIndexSheet> {
  List<SurahWithStartPage>? _surahs;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadSurahs();
  }

  Future<void> _loadSurahs() async {
    final db = AppDatabase.instance;
    final surahs = await db.getAllSurahsWithStartPages();
    if (mounted) {
      setState(() {
        _surahs = surahs;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        // Handle bar
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          width: 40,
          height: 4,
          decoration: BoxDecoration(
            color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        // Title
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            'Surah Index',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Divider(height: 1),
        // Surah list
        Expanded(
          child: _isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  controller: widget.scrollController,
                  itemCount: _surahs?.length ?? 0,
                  itemBuilder: (context, index) {
                    final item = _surahs![index];
                    final surah = item.surah;
                    return ListTile(
                      leading: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primaryContainer,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            '${surah.surahNumber}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: theme.colorScheme.onPrimaryContainer,
                            ),
                          ),
                        ),
                      ),
                      title: Row(
                        children: [
                          Expanded(
                            child: Text(
                              surah.nameTransliteration ?? surah.nameEnglish,
                              style: const TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                          Text(
                            surah.nameArabic,
                            style: const TextStyle(
                              fontFamily: 'AlQuran',
                              fontSize: 18,
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                        ],
                      ),
                      subtitle: Text(
                        '${surah.revelationPlace ?? ''} • ${surah.totalVerses} verses • Page ${item.startPage}',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      onTap: () => widget.onSurahSelected(item.startPage),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
