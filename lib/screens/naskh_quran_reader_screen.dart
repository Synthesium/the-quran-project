import 'package:flutter/material.dart';
import '../data/quran_data.dart';
import '../widgets/naskh/naskh_page.dart';

class NaskhQuranReaderScreen extends StatefulWidget {
  final int initialPage;

  const NaskhQuranReaderScreen({
    super.key,
    this.initialPage = 2, // Default to first content page (page 1 is title)
  });

  @override
  State<NaskhQuranReaderScreen> createState() => _NaskhQuranReaderScreenState();
}

class _NaskhQuranReaderScreenState extends State<NaskhQuranReaderScreen> {
  late PageController _pageController;
  late int _currentPage;
  bool _showControls = true;

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage;
    // PageView index is 0-based, but our pages are 1-based
    _pageController = PageController(initialPage: widget.initialPage - 1);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToPage(int page) {
    if (page >= 1 && page <= naskhNumberOfPages) {
      _pageController.animateToPage(
        page - 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _showPagePicker() {
    showDialog(
      context: context,
      builder: (context) => _PagePickerDialog(
        currentPage: _currentPage,
        onPageSelected: _goToPage,
      ),
    );
  }

  void _showSurahPicker() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFFFFFBF0),
      builder: (context) => _SurahPickerSheet(
        onSurahSelected: (surah) {
          Navigator.pop(context);
          _goToPage(getPageForSura(surah));
        },
      ),
    );
  }

  void _toggleControls() {
    setState(() {
      _showControls = !_showControls;
    });
  }

  @override
  Widget build(BuildContext context) {
    final surahNumber = getSuraForPage(_currentPage);
    final surahName = getSurahNameEnglish(surahNumber);
    final surahNameArabic = getSurahNameArabic(surahNumber);
    final juzNumber = getJuzForPage(_currentPage);

    return Scaffold(
      backgroundColor: const Color(0xFFFFFBF0), // Match page background
      body: SafeArea(
        child: Column(
          children: [
            // Header - space is always reserved, content fades
            _buildHeader(surahName, surahNameArabic, juzNumber),

            // Page viewer - takes remaining space
            Expanded(
              child: GestureDetector(
                onTap: _toggleControls,
                child: PageView.builder(
                  controller: _pageController,
                  reverse: true, // RTL reading direction
                  itemCount: naskhNumberOfPages,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index + 1;
                    });
                  },
                  itemBuilder: (context, index) {
                    return NaskhPage(pageNumber: index + 1);
                  },
                ),
              ),
            ),

            // Footer - space is always reserved, content fades
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(String surahName, String surahNameArabic, int juzNumber) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 200),
      opacity: _showControls ? 1.0 : 0.0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: const Color(0xFFFFFBF0),
          border: Border(
            bottom: BorderSide(
              color: _showControls
                  ? const Color(0xFFB8A070).withValues(alpha: 0.3)
                  : Colors.transparent,
              width: 1,
            ),
          ),
        ),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Color(0xFF5D4037)),
              onPressed: _showControls ? () => Navigator.pop(context) : null,
            ),
            Expanded(
              child: GestureDetector(
                onTap: _showControls ? _showSurahPicker : null,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      surahNameArabic,
                      style: const TextStyle(
                        color: Color(0xFF5D4037),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'AlQuran',
                      ),
                    ),
                    Text(
                      '$surahName  •  Juz $juzNumber',
                      style: TextStyle(
                        color: const Color(0xFF5D4037).withValues(alpha: 0.7),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.list, color: Color(0xFF5D4037)),
              onPressed: _showControls ? _showSurahPicker : null,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 200),
      opacity: _showControls ? 1.0 : 0.0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFFFFFBF0),
          border: Border(
            top: BorderSide(
              color: _showControls
                  ? const Color(0xFFB8A070).withValues(alpha: 0.3)
                  : Colors.transparent,
              width: 1,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Previous page button (RTL: chevron_right goes forward)
            IconButton(
              icon: Icon(
                Icons.chevron_right,
                color: _currentPage < naskhNumberOfPages
                    ? const Color(0xFF5D4037)
                    : const Color(0xFF5D4037).withValues(alpha: 0.3),
                size: 32,
              ),
              onPressed: _showControls && _currentPage < naskhNumberOfPages
                  ? () => _goToPage(_currentPage + 1)
                  : null,
            ),
            // Page number (tappable to show picker)
            GestureDetector(
              onTap: _showControls ? _showPagePicker : null,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFB8A070).withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Page $_currentPage / $naskhNumberOfPages',
                  style: const TextStyle(
                    color: Color(0xFF5D4037),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            // Next page button (RTL: chevron_left goes back)
            IconButton(
              icon: Icon(
                Icons.chevron_left,
                color: _currentPage > 1
                    ? const Color(0xFF5D4037)
                    : const Color(0xFF5D4037).withValues(alpha: 0.3),
                size: 32,
              ),
              onPressed: _showControls && _currentPage > 1
                  ? () => _goToPage(_currentPage - 1)
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}

class _PagePickerDialog extends StatefulWidget {
  final int currentPage;
  final ValueChanged<int> onPageSelected;

  const _PagePickerDialog({
    required this.currentPage,
    required this.onPageSelected,
  });

  @override
  State<_PagePickerDialog> createState() => _PagePickerDialogState();
}

class _PagePickerDialogState extends State<_PagePickerDialog> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.currentPage.toString());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    final page = int.tryParse(_controller.text);
    if (page != null && page >= 1 && page <= naskhNumberOfPages) {
      widget.onPageSelected(page);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFFFFFBF0),
      title: const Text('Go to Page'),
      content: TextField(
        controller: _controller,
        keyboardType: TextInputType.number,
        autofocus: true,
        decoration: InputDecoration(
          hintText: '1 - $naskhNumberOfPages',
          border: const OutlineInputBorder(),
        ),
        onSubmitted: (_) => _submit(),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _submit,
          child: const Text('Go'),
        ),
      ],
    );
  }
}

class _SurahPickerSheet extends StatelessWidget {
  final ValueChanged<int> onSurahSelected;

  const _SurahPickerSheet({required this.onSurahSelected});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.5,
      maxChildSize: 0.9,
      expand: false,
      builder: (context, scrollController) {
        return Column(
          children: [
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                'Select Surah',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5D4037),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                itemCount: totalSurahs,
                itemBuilder: (context, index) {
                  final surahNumber = index + 1;
                  final surahName = getSurahNameEnglish(surahNumber);
                  final surahNameArabic = getSurahNameArabic(surahNumber);
                  final ayahCount = getAyahCountForSura(surahNumber);
                  final page = getPageForSura(surahNumber);
                  final isMakki = isSuraMakki(surahNumber);

                  return ListTile(
                    leading: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFFB8A070).withValues(alpha: 0.2),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          '$surahNumber',
                          style: const TextStyle(
                            color: Color(0xFF5D4037),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    title: Row(
                      children: [
                        Text(
                          surahName,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          surahNameArabic,
                          style: const TextStyle(
                            fontFamily: 'AlQuran',
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    subtitle: Text(
                      '${isMakki ? 'Makki' : 'Madani'}  •  $ayahCount Ayahs  •  Page $page',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                    onTap: () => onSurahSelected(surahNumber),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
