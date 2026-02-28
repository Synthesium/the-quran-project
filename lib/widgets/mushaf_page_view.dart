import 'package:flutter/material.dart';

import 'mushaf_page.dart';

/// Widget for viewing mushaf pages with swipe navigation
/// Allows user to swipe left/right to navigate between pages
class MushafPageView extends StatefulWidget {
  final int initialPage;
  final void Function(int page)? onPageChanged;

  const MushafPageView({
    super.key,
    this.initialPage = 1,
    this.onPageChanged,
  });

  @override
  State<MushafPageView> createState() => _MushafPageViewState();
}

class _MushafPageViewState extends State<MushafPageView> {
  late PageController _pageController;
  late int _currentPage;
  bool _showControls = true;

  // Total pages in the Quran (standard Madani mushaf)
  static const int totalPages = 604;

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage.clamp(1, totalPages);
    // PageView is 0-indexed, but mushaf pages are 1-indexed
    _pageController = PageController(initialPage: _currentPage - 1);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToPage(int page) {
    final clampedPage = page.clamp(1, totalPages);
    _pageController.animateToPage(
      clampedPage - 1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _toggleControls() {
    setState(() => _showControls = !_showControls);
  }

  void _showPageJumpDialog() {
    final controller = TextEditingController(text: _currentPage.toString());

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Go to Page'),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'Page number (1-$totalPages)',
            border: const OutlineInputBorder(),
          ),
          autofocus: true,
          onSubmitted: (value) {
            final page = int.tryParse(value);
            if (page != null && page >= 1 && page <= totalPages) {
              Navigator.pop(context);
              _goToPage(page);
            }
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              final page = int.tryParse(controller.text);
              if (page != null && page >= 1 && page <= totalPages) {
                Navigator.pop(context);
                _goToPage(page);
              }
            },
            child: const Text('Go'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Page view with mushaf pages
        PageView.builder(
          controller: _pageController,
          itemCount: totalPages,
          // Reverse for RTL reading (Arabic reads right to left)
          reverse: true,
          onPageChanged: (index) {
            setState(() => _currentPage = index + 1);
            widget.onPageChanged?.call(_currentPage);
          },
          itemBuilder: (context, index) {
            final pageNumber = index + 1;
            return MushafPage(
              pageNumber: pageNumber,
              onTap: _toggleControls,
            );
          },
        ),

        // Navigation controls overlay
        if (_showControls) ...[
          // Top bar with page info
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.5),
                    Colors.transparent,
                  ],
                ),
              ),
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                      GestureDetector(
                        onTap: _showPageJumpDialog,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.3),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            'Page $_currentPage of $totalPages',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 48), // Balance for back button
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Bottom navigation buttons
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.5),
                    Colors.transparent,
                  ],
                ),
              ),
              child: SafeArea(
                top: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Next page (appears on left for RTL)
                      IconButton(
                        icon: const Icon(
                          Icons.chevron_left,
                          color: Colors.white,
                          size: 32,
                        ),
                        onPressed: _currentPage < totalPages
                            ? () => _goToPage(_currentPage + 1)
                            : null,
                      ),
                      // Page slider
                      Expanded(
                        child: SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Colors.white.withValues(alpha: 0.3),
                            thumbColor: Colors.white,
                            overlayColor: Colors.white.withValues(alpha: 0.2),
                          ),
                          child: Slider(
                            value: _currentPage.toDouble(),
                            min: 1,
                            max: totalPages.toDouble(),
                            onChanged: (value) {
                              _goToPage(value.round());
                            },
                          ),
                        ),
                      ),
                      // Previous page (appears on right for RTL)
                      IconButton(
                        icon: const Icon(
                          Icons.chevron_right,
                          color: Colors.white,
                          size: 32,
                        ),
                        onPressed: _currentPage > 1
                            ? () => _goToPage(_currentPage - 1)
                            : null,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
