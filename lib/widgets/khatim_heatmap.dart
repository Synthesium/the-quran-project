import 'dart:math' as math;

import 'package:flutter/material.dart';

/// A GitHub-style heatmap widget using the 8-pointed star khatim symbol (۞)
/// instead of squares to track Quran reading activity.
class KhatimHeatmap extends StatelessWidget {
  /// Map of date to activity level (0.0 to 1.0)
  /// If null, random demo data will be generated
  final Map<DateTime, double>? activityData;

  /// Number of weeks to display
  final int weeks;

  /// Size of each khatim symbol
  final double cellSize;

  /// Spacing between cells
  final double cellSpacing;

  /// Base color for the heatmap (intensity varies by activity)
  final Color? baseColor;

  /// Whether to show day labels (S, M, T, W, T, F, S)
  final bool showDayLabels;

  /// Whether to show month labels
  final bool showMonthLabels;

  const KhatimHeatmap({
    super.key,
    this.activityData,
    this.weeks = 52,
    this.cellSize = 14,
    this.cellSpacing = 3,
    this.baseColor,
    this.showDayLabels = true,
    this.showMonthLabels = true,
  });

  @override
  Widget build(BuildContext context) {
    final color = baseColor ?? Theme.of(context).colorScheme.primary;
    final data = activityData ?? _generateDemoData();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showMonthLabels) _buildMonthLabels(context),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (showDayLabels) _buildDayLabels(context),
            _buildHeatmapGrid(context, data, color),
          ],
        ),
        const SizedBox(height: 8),
        _buildLegend(context, color),
      ],
    );
  }

  Widget _buildMonthLabels(BuildContext context) {
    final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    final today = DateTime.now();
    final startDate = today.subtract(Duration(days: (weeks * 7) - 1));

    final monthPositions = <int, String>{};
    var currentDate = startDate;
    var weekIndex = 0;

    while (currentDate.isBefore(today) || currentDate.isAtSameMomentAs(today)) {
      if (currentDate.day <= 7 && !monthPositions.containsKey(weekIndex)) {
        monthPositions[weekIndex] = months[currentDate.month - 1];
      }
      if (currentDate.weekday == DateTime.sunday) {
        weekIndex++;
      }
      currentDate = currentDate.add(const Duration(days: 1));
    }

    return Padding(
      padding: EdgeInsets.only(left: showDayLabels ? 24 : 0, bottom: 4),
      child: SizedBox(
        width: weeks * (cellSize + cellSpacing),
        height: 16,
        child: Stack(
          children: monthPositions.entries.map((entry) {
            return Positioned(
              left: entry.key * (cellSize + cellSpacing),
              child: Text(
                entry.value,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  fontSize: 10,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildDayLabels(BuildContext context) {
    const days = ['', 'M', '', 'W', '', 'F', ''];

    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: days.map((day) {
          return SizedBox(
            height: cellSize + cellSpacing,
            width: 16,
            child: Center(
              child: Text(
                day,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  fontSize: 10,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildHeatmapGrid(
    BuildContext context,
    Map<DateTime, double> data,
    Color color,
  ) {
    final today = DateTime.now();
    final startDate = today.subtract(Duration(days: (weeks * 7) - 1));

    // Organize data into weeks
    final weekColumns = <List<_CellData>>[];
    var currentDate = startDate;

    // Adjust start to beginning of week (Sunday)
    while (currentDate.weekday != DateTime.sunday) {
      currentDate = currentDate.subtract(const Duration(days: 1));
    }

    while (currentDate.isBefore(today) ||
           currentDate.isAtSameMomentAs(today) ||
           weekColumns.length < weeks) {
      final week = <_CellData>[];

      for (var i = 0; i < 7; i++) {
        final date = currentDate.add(Duration(days: i));
        final normalizedDate = DateTime(date.year, date.month, date.day);
        final activity = data[normalizedDate] ?? 0.0;
        final isInRange = !date.isBefore(startDate) &&
                          (date.isBefore(today) || date.isAtSameMomentAs(today));

        week.add(_CellData(
          date: date,
          activity: activity,
          isVisible: isInRange,
        ));
      }

      weekColumns.add(week);
      currentDate = currentDate.add(const Duration(days: 7));

      if (weekColumns.length >= weeks) break;
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: weekColumns.map((week) {
        return Padding(
          padding: EdgeInsets.only(right: cellSpacing),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: week.map((cell) {
              return Padding(
                padding: EdgeInsets.only(bottom: cellSpacing),
                child: _KhatimCell(
                  size: cellSize,
                  activity: cell.activity,
                  color: color,
                  isVisible: cell.isVisible,
                  date: cell.date,
                ),
              );
            }).toList(),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildLegend(BuildContext context, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Less',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            fontSize: 10,
          ),
        ),
        const SizedBox(width: 4),
        ...List.generate(5, (index) {
          final activity = index / 4;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1),
            child: _KhatimCell(
              size: cellSize,
              activity: activity,
              color: color,
              isVisible: true,
            ),
          );
        }),
        const SizedBox(width: 4),
        Text(
          'More',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            fontSize: 10,
          ),
        ),
      ],
    );
  }

  Map<DateTime, double> _generateDemoData() {
    final data = <DateTime, double>{};
    final today = DateTime.now();
    final random = DateTime.now().millisecondsSinceEpoch;

    for (var i = 0; i < weeks * 7; i++) {
      final date = today.subtract(Duration(days: i));
      final normalizedDate = DateTime(date.year, date.month, date.day);

      // Generate pseudo-random activity based on date
      final seed = (date.day * 31 + date.month * 12 + random) % 100;
      double activity;

      if (seed < 30) {
        activity = 0.0; // 30% chance of no activity
      } else if (seed < 50) {
        activity = 0.25;
      } else if (seed < 70) {
        activity = 0.5;
      } else if (seed < 85) {
        activity = 0.75;
      } else {
        activity = 1.0;
      }

      data[normalizedDate] = activity;
    }

    return data;
  }
}

class _CellData {
  final DateTime date;
  final double activity;
  final bool isVisible;

  _CellData({
    required this.date,
    required this.activity,
    required this.isVisible,
  });
}

class _KhatimCell extends StatelessWidget {
  final double size;
  final double activity;
  final Color color;
  final bool isVisible;
  final DateTime? date;

  const _KhatimCell({
    required this.size,
    required this.activity,
    required this.color,
    required this.isVisible,
    this.date,
  });

  Color _getActivityColor() {
    if (!isVisible) return Colors.transparent;
    if (activity == 0) {
      return color.withValues(alpha: 0.1);
    }
    // Scale opacity from 0.25 to 1.0 based on activity
    final opacity = 0.25 + (activity * 0.75);
    return color.withValues(alpha: opacity);
  }

  @override
  Widget build(BuildContext context) {
    if (!isVisible) {
      return SizedBox(width: size, height: size);
    }

    return Tooltip(
      message: date != null
          ? '${date!.year}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}: ${(activity * 100).toInt()}%'
          : '${(activity * 100).toInt()}%',
      child: SizedBox(
        width: size,
        height: size,
        child: CustomPaint(
          size: Size(size, size),
          painter: _EightPointedStarPainter(
            color: _getActivityColor(),
          ),
        ),
      ),
    );
  }
}

/// Custom painter that draws an 8-pointed star (Khatim/Rub El Hizb symbol)
class _EightPointedStarPainter extends CustomPainter {
  final Color color;

  _EightPointedStarPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);
    final outerRadius = size.width / 2;
    final innerRadius = outerRadius * 0.4;

    final path = Path();

    // 8-pointed star: alternate between outer and inner points
    // 16 points total (8 outer + 8 inner)
    for (var i = 0; i < 16; i++) {
      final angle = (i * 22.5 - 90) * (math.pi / 180);
      final radius = i.isEven ? outerRadius : innerRadius;
      final x = center.dx + radius * math.cos(angle);
      final y = center.dy + radius * math.sin(angle);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_EightPointedStarPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
