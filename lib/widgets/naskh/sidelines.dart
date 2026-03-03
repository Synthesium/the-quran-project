import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'sideline_model.dart';

/// Widget that renders sidelines for a Quran page.
///
/// Sidelines are decorative markers that appear alongside certain lines,
/// typically indicating juz boundaries or other divisions.
class Sidelines extends StatefulWidget {
  /// The page number (1-611)
  final int pageNumber;

  /// Total height available for sidelines (same as quran content height)
  final double totalHeight;

  /// Width allocated for sidelines
  final double width;

  /// Position of sidelines (left or right)
  final SidelinesPosition position;

  /// Default direction for sidelines on this page
  final SidelineDirection defaultDirection;

  /// Height of each line (excluding dividers)
  final double lineHeight;

  /// Thickness of dividers between lines
  final double dividerThickness;

  const Sidelines({
    super.key,
    required this.pageNumber,
    required this.totalHeight,
    required this.width,
    required this.position,
    required this.defaultDirection,
    required this.lineHeight,
    this.dividerThickness = 0.5,
  });

  @override
  State<Sidelines> createState() => _SidelinesState();
}

class _SidelinesState extends State<Sidelines> {
  List<SidelineModel>? _sidelines;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadSidelines();
  }

  @override
  void didUpdateWidget(Sidelines oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.pageNumber != widget.pageNumber) {
      _loadSidelines();
    }
  }

  Future<void> _loadSidelines() async {
    setState(() => _loading = true);

    final sidelines = <SidelineModel>[];
    final basePath = 'assets/naskh_app_extract/pages/${widget.pageNumber}/sidelines';

    // Check for sideline files for each possible line (1-15)
    for (int line = 1; line <= 15; line++) {
      // Try different file naming patterns
      final patterns = [
        '$basePath/$line.png',
        '$basePath/${line}_up.png',
        '$basePath/${line}_down.png',
      ];

      for (final path in patterns) {
        if (await _assetExists(path)) {
          final direction = _parseDirection(path);
          sidelines.add(SidelineModel(
            assetPath: path,
            targetLine: line,
            direction: direction,
          ));
          break; // Only use one file per line
        }
      }
    }

    if (mounted) {
      setState(() {
        _sidelines = sidelines;
        _loading = false;
      });
    }
  }

  Future<bool> _assetExists(String path) async {
    try {
      await rootBundle.load(path);
      return true;
    } catch (_) {
      return false;
    }
  }

  SidelineDirection _parseDirection(String path) {
    if (path.contains('_up.png')) {
      return SidelineDirection.up;
    } else if (path.contains('_down.png')) {
      return SidelineDirection.down;
    }
    return widget.defaultDirection;
  }

  @override
  Widget build(BuildContext context) {
    if (_loading || _sidelines == null || _sidelines!.isEmpty) {
      return SizedBox(
        width: widget.width,
        height: widget.totalHeight,
      );
    }

    return SizedBox(
      width: widget.width,
      height: widget.totalHeight,
      child: Stack(
        children: _sidelines!.map((sideline) {
          return _SidelineImage(
            sideline: sideline,
            lineHeight: widget.lineHeight,
            dividerThickness: widget.dividerThickness,
            sidelineWidth: widget.width,
            position: widget.position,
          );
        }).toList(),
      ),
    );
  }
}

class _SidelineImage extends StatelessWidget {
  final SidelineModel sideline;
  final double lineHeight;
  final double dividerThickness;
  final double sidelineWidth;
  final SidelinesPosition position;

  const _SidelineImage({
    required this.sideline,
    required this.lineHeight,
    required this.dividerThickness,
    required this.sidelineWidth,
    required this.position,
  });

  @override
  Widget build(BuildContext context) {
    // Calculate the top position based on target line (1-indexed)
    // Each line is followed by a divider (except the last one)
    // Line 1 starts at top (0), subsequent lines are offset by line height + divider
    final lineIndex = sideline.targetLine - 1;
    final lineTop = lineIndex * (lineHeight + dividerThickness);

    return Positioned(
      top: lineTop,
      left: position == SidelinesPosition.left ? null : 0,
      right: position == SidelinesPosition.left ? 0 : null,
      child: Image.asset(
        sideline.assetPath,
        height: lineHeight,
        fit: BoxFit.contain,
        alignment: sideline.direction == SidelineDirection.up
            ? Alignment.bottomCenter
            : Alignment.topCenter,
        errorBuilder: (context, error, stackTrace) {
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
