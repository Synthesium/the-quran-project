import 'package:flutter/material.dart';
import '../../data/quran_data.dart';
import 'naskh_line.dart';
import 'sideline_model.dart';
import 'sidelines.dart';

/// Width ratio for sidelines relative to total page width
const double _sidelinesWidthRatio = 0.08;

/// Padding around the page frame
const double _framePadding = 0.0;

/// Border width for the page frame (simple style)
const double _borderWidth = 1.5;

/// Color for the frame border
const Color _frameColor = Color(0xFF000000);

/// Color for the line dividers (slightly darker/more opaque)
const Color _dividerColor = Color(0xFF000000);

/// Divider line thickness
const double _dividerThickness = 1.0;

/// Pages without divider lines (fewer lines)
const List<int> _noDividerPages = [2, 3];

class NaskhPage extends StatelessWidget {
  final int pageNumber;

  /// Whether to show sidelines (juz markers, etc.)
  final bool showSidelines;

  const NaskhPage({
    super.key,
    required this.pageNumber,
    this.showSidelines = true,
  });

  /// Whether this page should skip divider lines (pages 2 and 3)
  bool get _skipDividers => _noDividerPages.contains(pageNumber);

  @override
  Widget build(BuildContext context) {
    final pageChars = PageCharacteristics(pageNumber);

    return LayoutBuilder(
      builder: (context, constraints) {
        final totalWidth = constraints.maxWidth;
        final totalHeight = constraints.maxHeight;

        // Calculate sidelines width
        final sidelinesWidth =
            showSidelines ? (totalWidth * _sidelinesWidthRatio) : 0.0;

        // Calculate content area dimensions (inside the frame)
        final frameVerticalPadding = _framePadding * 2;
        final contentHeight = totalHeight - frameVerticalPadding - (_borderWidth * 2);
        // Account for dividers between lines (14 dividers for 15 lines)
        // Skip dividers for special pages (2 and 3)
        final totalDividerHeight = _skipDividers ? 0.0 : _dividerThickness * (naskhLinesPerPage - 1);
        final lineHeight = (contentHeight - totalDividerHeight) / naskhLinesPerPage;

        return Container(
          color: const Color(0xFFFFFBF0), // Flat cream background
          child: Padding(
            padding: const EdgeInsets.all(_framePadding),
            child: Row(
              textDirection: TextDirection.ltr,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Left sidelines (for odd pages) - outside the frame
                if (showSidelines && pageChars.isLeftPage)
                  Padding(
                    padding: EdgeInsets.only(
                      top: _borderWidth,
                      bottom: _borderWidth,
                    ),
                    child: Sidelines(
                      pageNumber: pageNumber,
                      totalHeight: contentHeight,
                      width: sidelinesWidth,
                      position: SidelinesPosition.left,
                      defaultDirection: pageChars.defaultSidelineDirection,
                      lineHeight: lineHeight,
                      dividerThickness: _dividerThickness,
                    ),
                  ),

                // Main Quran content with frame
                Expanded(
                  child: _buildFramedContent(
                    lineHeight: lineHeight,
                    isLeftPage: pageChars.isLeftPage,
                  ),
                ),

                // Right sidelines (for even pages) - outside the frame
                if (showSidelines && pageChars.isRightPage)
                  Padding(
                    padding: EdgeInsets.only(
                      top: _borderWidth,
                      bottom: _borderWidth,
                    ),
                    child: Sidelines(
                      pageNumber: pageNumber,
                      totalHeight: contentHeight,
                      width: sidelinesWidth,
                      position: SidelinesPosition.right,
                      defaultDirection: pageChars.defaultSidelineDirection,
                      lineHeight: lineHeight,
                      dividerThickness: _dividerThickness,
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// Builds the framed content with simple border
  Widget _buildFramedContent({
    required double lineHeight,
    required bool isLeftPage,
  }) {
    final content = Column(
      children: _buildLinesWithDividers(lineHeight),
    );

    // Small padding on opposite side of sidelines for simple borders
    const oppositePadding = 4.0;

    return Padding(
      padding: EdgeInsets.only(
        left: isLeftPage ? 0 : oppositePadding,
        right: isLeftPage ? oppositePadding : 0,
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: _frameColor,
            width: _borderWidth,
          ),
        ),
        child: content,
      ),
    );
  }

  /// Builds the list of Quran lines with dividers between them
  List<Widget> _buildLinesWithDividers(double lineHeight) {
    final List<Widget> children = [];

    for (int i = 0; i < naskhLinesPerPage; i++) {
      // Add the Quran line
      children.add(
        NaskhLine(
          pageNumber: pageNumber,
          lineNumber: i + 1,
          height: lineHeight,
        ),
      );

      // Add divider after each line except the last one
      // Skip dividers for special pages (2 and 3)
      if (i < naskhLinesPerPage - 1 && !_skipDividers) {
        children.add(
          Container(
            height: _dividerThickness,
            color: _dividerColor.withValues(alpha: 0.7),
          ),
        );
      }
    }

    return children;
  }
}
