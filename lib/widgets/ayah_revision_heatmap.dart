import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../db/database.dart';

/// Grouping mode for ayah tiles
enum AyahGrouping {
  surah,
  juz,
  page,
  ruku,
}

/// A hexagonal heatmap showing revision status for all ayahs in the Quran
/// Ayahs are arranged in wedge sectors by group, creating clear visual partitions
class AyahRevisionHeatmap extends StatefulWidget {
  final Map<String, double>? activityData;
  final double tileSize;
  final Color color;

  const AyahRevisionHeatmap({
    super.key,
    this.activityData,
    this.tileSize = 4,
    this.color = const Color(0xFF2E7D32),
  });

  @override
  State<AyahRevisionHeatmap> createState() => _AyahRevisionHeatmapState();
}

class _AyahRevisionHeatmapState extends State<AyahRevisionHeatmap> {
  List<AyahData> _ayahs = [];
  bool _isLoading = true;
  AyahGrouping _selectedGrouping = AyahGrouping.juz;
  Map<String, double> _activityData = {};
  final TransformationController _transformController = TransformationController();
  double _currentScale = 1.0;

  @override
  void initState() {
    super.initState();
    _loadAyahs();
  }

  @override
  void dispose() {
    _transformController.dispose();
    super.dispose();
  }

  Future<void> _loadAyahs() async {
    final db = AppDatabase.instance;
    final surahs = await db.getAllSurahs();

    final allAyahs = <AyahData>[];
    for (final surah in surahs) {
      final ayahs = await db.getAyahsBySurah(surah.surahNumber);
      allAyahs.addAll(ayahs);
    }

    allAyahs.sort((a, b) {
      final surahCompare = a.surahNumber.compareTo(b.surahNumber);
      if (surahCompare != 0) return surahCompare;
      return a.verseNumber.compareTo(b.verseNumber);
    });

    if (widget.activityData == null) {
      final random = math.Random(42);
      for (final ayah in allAyahs) {
        final roll = random.nextDouble();
        if (roll < 0.4) {
          _activityData[ayah.verseKey] = 0;
        } else if (roll < 0.7) {
          _activityData[ayah.verseKey] = random.nextDouble() * 0.3;
        } else if (roll < 0.9) {
          _activityData[ayah.verseKey] = 0.3 + random.nextDouble() * 0.4;
        } else {
          _activityData[ayah.verseKey] = 0.7 + random.nextDouble() * 0.3;
        }
      }
    } else {
      _activityData = widget.activityData!;
    }

    setState(() {
      _ayahs = allAyahs;
      _isLoading = false;
    });
  }

  int _getGroupKey(AyahData ayah) {
    switch (_selectedGrouping) {
      case AyahGrouping.surah:
        return ayah.surahNumber;
      case AyahGrouping.juz:
        return ayah.juzNumber ?? 1;
      case AyahGrouping.page:
        return ayah.pageNumber ?? 1;
      case AyahGrouping.ruku:
        return ayah.rukuNumber ?? 1;
    }
  }

  void _selectGrouping(AyahGrouping grouping) {
    setState(() => _selectedGrouping = grouping);
  }

  void _zoomIn() {
    final newScale = (_currentScale * 1.4).clamp(0.1, 10.0);
    _setScale(newScale);
  }

  void _zoomOut() {
    final newScale = (_currentScale / 1.4).clamp(0.1, 10.0);
    _setScale(newScale);
  }

  void _resetZoom() {
    _transformController.value = Matrix4.identity();
    setState(() => _currentScale = 1.0);
  }

  void _setScale(double scale) {
    final matrix = _transformController.value.clone();
    final currentScale = matrix.getMaxScaleOnAxis();
    final scaleFactor = scale / currentScale;
    matrix.multiply(Matrix4.diagonal3Values(scaleFactor, scaleFactor, 1.0));
    _transformController.value = matrix;
    setState(() => _currentScale = scale);
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Loading 6236 ayahs...'),
          ],
        ),
      );
    }

    final groupCount = _getGroupCount();

    return Column(
      children: [
        _buildGroupingControls(),
        const SizedBox(height: 8),
        Text(
          '$groupCount partitions',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 8),
        _buildLegend(),
        const SizedBox(height: 8),
        _buildStats(),
        const SizedBox(height: 8),
        Expanded(
          child: Stack(
            children: [
              InteractiveViewer(
                transformationController: _transformController,
                minScale: 0.05,
                maxScale: 10.0,
                boundaryMargin: const EdgeInsets.all(500),
                onInteractionUpdate: (details) {
                  setState(() {
                    _currentScale = _transformController.value.getMaxScaleOnAxis();
                  });
                },
                child: Center(
                  child: CustomPaint(
                    size: _calculateCanvasSize(),
                    painter: _WedgeSectorPainter(
                      ayahs: _ayahs,
                      activityData: _activityData,
                      tileSize: widget.tileSize,
                      color: widget.color,
                      grouping: _selectedGrouping,
                      getGroupKey: _getGroupKey,
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 12,
                bottom: 12,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _ZoomButton(icon: Icons.add, onPressed: _zoomIn),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        '${(_currentScale * 100).toInt()}%',
                        style: const TextStyle(fontSize: 9),
                      ),
                    ),
                    const SizedBox(height: 4),
                    _ZoomButton(icon: Icons.remove, onPressed: _zoomOut),
                    const SizedBox(height: 6),
                    _ZoomButton(icon: Icons.fit_screen, onPressed: _resetZoom),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  int _getGroupCount() {
    final groups = <int>{};
    for (final ayah in _ayahs) {
      groups.add(_getGroupKey(ayah));
    }
    return groups.length;
  }

  Size _calculateCanvasSize() {
    // Calculate based on max ayahs per group and number of groups
    final groups = _groupAyahs();
    final maxAyahsInGroup = groups.values.map((g) => g.length).reduce(math.max);

    // Estimate rings needed for largest group
    final ringsPerWedge = math.sqrt(maxAyahsInGroup / 3).ceil() + 2;
    final diameter = ringsPerWedge * widget.tileSize * 4;

    return Size(diameter + 200, diameter + 200);
  }

  Map<int, List<AyahData>> _groupAyahs() {
    final groups = <int, List<AyahData>>{};
    for (final ayah in _ayahs) {
      final key = _getGroupKey(ayah);
      groups.putIfAbsent(key, () => []).add(ayah);
    }
    return groups;
  }

  Widget _buildGroupingControls() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      alignment: WrapAlignment.center,
      children: AyahGrouping.values.map((grouping) {
        final isActive = _selectedGrouping == grouping;
        return ChoiceChip(
          label: Text(_groupingLabel(grouping)),
          selected: isActive,
          onSelected: (_) => _selectGrouping(grouping),
          selectedColor: _groupingColor(grouping).withValues(alpha: 0.3),
          checkmarkColor: _groupingColor(grouping),
          side: BorderSide(
            color: isActive ? _groupingColor(grouping) : Colors.grey,
            width: isActive ? 2 : 1,
          ),
        );
      }).toList(),
    );
  }

  String _groupingLabel(AyahGrouping grouping) {
    switch (grouping) {
      case AyahGrouping.surah:
        return 'Surah (114)';
      case AyahGrouping.juz:
        return 'Juz (30)';
      case AyahGrouping.page:
        return 'Page (604)';
      case AyahGrouping.ruku:
        return 'Ruku (556)';
    }
  }

  Color _groupingColor(AyahGrouping grouping) {
    switch (grouping) {
      case AyahGrouping.surah:
        return Colors.blue;
      case AyahGrouping.juz:
        return Colors.orange;
      case AyahGrouping.page:
        return Colors.purple;
      case AyahGrouping.ruku:
        return Colors.teal;
    }
  }

  Widget _buildLegend() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Less ', style: TextStyle(fontSize: 12)),
        ...List.generate(5, (i) {
          final activity = i / 4;
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 2),
            child: _HexagonWidget(
              size: 14,
              color: _getActivityColor(activity),
            ),
          );
        }),
        const Text(' More', style: TextStyle(fontSize: 12)),
      ],
    );
  }

  Color _getActivityColor(double activity) {
    if (activity == 0) {
      return widget.color.withValues(alpha: 0.1);
    }
    final opacity = 0.25 + (activity * 0.75);
    return widget.color.withValues(alpha: opacity);
  }

  Widget _buildStats() {
    final total = _ayahs.length;
    final revised = _activityData.entries.where((e) => e.value > 0).length;
    final percent = (revised / total * 100).toStringAsFixed(1);

    return Text(
      '$revised / $total ayahs revised ($percent%)',
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
    );
  }
}

class _HexagonWidget extends StatelessWidget {
  final double size;
  final Color color;

  const _HexagonWidget({required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _SingleHexagonPainter(color: color),
    );
  }
}

class _ZoomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _ZoomButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      borderRadius: BorderRadius.circular(6),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(6),
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Icon(icon, size: 18),
        ),
      ),
    );
  }
}

class _SingleHexagonPainter extends CustomPainter {
  final Color color;

  _SingleHexagonPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final path = _createHexPath(center, radius);
    canvas.drawPath(path, paint);
  }

  Path _createHexPath(Offset center, double radius) {
    final path = Path();
    for (var i = 0; i < 6; i++) {
      final angle = (i * 60) * math.pi / 180;
      final x = center.dx + radius * math.cos(angle);
      final y = center.dy + radius * math.sin(angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();
    return path;
  }

  @override
  bool shouldRepaint(_SingleHexagonPainter oldDelegate) => oldDelegate.color != color;
}

/// Painter that arranges ayahs in wedge sectors by group
class _WedgeSectorPainter extends CustomPainter {
  final List<AyahData> ayahs;
  final Map<String, double> activityData;
  final double tileSize;
  final Color color;
  final AyahGrouping grouping;
  final int Function(AyahData) getGroupKey;

  _WedgeSectorPainter({
    required this.ayahs,
    required this.activityData,
    required this.tileSize,
    required this.color,
    required this.grouping,
    required this.getGroupKey,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (ayahs.isEmpty) return;

    final center = Offset(size.width / 2, size.height / 2);

    // Group ayahs
    final groups = <int, List<AyahData>>{};
    for (final ayah in ayahs) {
      final key = getGroupKey(ayah);
      groups.putIfAbsent(key, () => []).add(ayah);
    }

    final groupKeys = groups.keys.toList()..sort();
    final groupCount = groupKeys.length;

    // Calculate angle per group (wedge)
    final anglePerGroup = 2 * math.pi / groupCount;

    // Find max ayahs in any group to determine max radius
    final maxAyahsInGroup = groups.values.map((g) => g.length).reduce(math.max);

    // Draw each group as a wedge sector
    for (var i = 0; i < groupKeys.length; i++) {
      final groupKey = groupKeys[i];
      final groupAyahs = groups[groupKey]!;

      final startAngle = i * anglePerGroup - math.pi / 2; // Start from top

      _drawWedgeSector(
        canvas,
        center,
        startAngle,
        anglePerGroup,
        groupAyahs,
        maxAyahsInGroup,
        groupKey,
        i,
        groupCount,
      );
    }

    // Draw wedge separator lines
    _drawWedgeSeparators(canvas, center, groupCount, maxAyahsInGroup);
  }

  void _drawWedgeSector(
    Canvas canvas,
    Offset center,
    double startAngle,
    double angleSpan,
    List<AyahData> groupAyahs,
    int maxAyahsInGroup,
    int groupKey,
    int groupIndex,
    int totalGroups,
  ) {
    // Calculate how many "rings" we need for this wedge
    // Arrange ayahs in a grid within the wedge sector
    final ayahCount = groupAyahs.length;

    // Calculate rings and slots per ring
    // More ayahs = more rings needed
    var totalPlaced = 0;
    var ring = 1;

    while (totalPlaced < ayahCount) {
      // How many hexes can fit in this ring within the wedge?
      final ringCircumference = 2 * math.pi * ring;
      final wedgeArc = ringCircumference * (angleSpan / (2 * math.pi));
      final slotsInRing = math.max(1, (wedgeArc / 1.8).floor());

      for (var slot = 0; slot < slotsInRing && totalPlaced < ayahCount; slot++) {
        final ayah = groupAyahs[totalPlaced];

        // Calculate position within wedge
        final slotAngle = startAngle + angleSpan * (slot + 0.5) / slotsInRing;
        final radius = ring * tileSize * 2;

        final x = center.dx + radius * math.cos(slotAngle);
        final y = center.dy + radius * math.sin(slotAngle);

        final activity = activityData[ayah.verseKey] ?? 0;
        _drawHexagon(canvas, Offset(x, y), tileSize * 0.9, activity);

        totalPlaced++;
      }

      ring++;
    }

    // Draw group label
    final labelRadius = ring * tileSize * 2 + tileSize * 3;
    final labelAngle = startAngle + angleSpan / 2;
    final labelX = center.dx + labelRadius * math.cos(labelAngle);
    final labelY = center.dy + labelRadius * math.sin(labelAngle);

    final labelPainter = TextPainter(
      text: TextSpan(
        text: '$groupKey',
        style: TextStyle(
          color: _getGroupingColor().withValues(alpha: 0.8),
          fontSize: tileSize * 2.5,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    labelPainter.layout();
    labelPainter.paint(
      canvas,
      Offset(labelX - labelPainter.width / 2, labelY - labelPainter.height / 2),
    );
  }

  void _drawWedgeSeparators(Canvas canvas, Offset center, int groupCount, int maxAyahsInGroup) {
    final maxRings = math.sqrt(maxAyahsInGroup).ceil() + 3;
    final maxRadius = maxRings * tileSize * 2 + tileSize * 4;

    final borderPaint = Paint()
      ..color = _getGroupingColor()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round;

    final anglePerGroup = 2 * math.pi / groupCount;

    for (var i = 0; i < groupCount; i++) {
      final angle = i * anglePerGroup - math.pi / 2;

      final startX = center.dx;
      final startY = center.dy;
      final endX = center.dx + maxRadius * math.cos(angle);
      final endY = center.dy + maxRadius * math.sin(angle);

      canvas.drawLine(Offset(startX, startY), Offset(endX, endY), borderPaint);
    }

    // Draw outer circle
    canvas.drawCircle(center, maxRadius, borderPaint);
  }

  void _drawHexagon(Canvas canvas, Offset center, double radius, double activity) {
    final paint = Paint()
      ..color = _getActivityColor(activity)
      ..style = PaintingStyle.fill;

    final path = _createHexPath(center, radius);
    canvas.drawPath(path, paint);

    final borderPaint = Paint()
      ..color = color.withValues(alpha: 0.15)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.5;
    canvas.drawPath(path, borderPaint);
  }

  Color _getActivityColor(double activity) {
    if (activity == 0) {
      return color.withValues(alpha: 0.08);
    }
    final opacity = 0.2 + (activity * 0.8);
    return color.withValues(alpha: opacity);
  }

  Path _createHexPath(Offset center, double radius) {
    final path = Path();
    for (var i = 0; i < 6; i++) {
      final angle = (i * 60) * math.pi / 180;
      final x = center.dx + radius * math.cos(angle);
      final y = center.dy + radius * math.sin(angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();
    return path;
  }

  Color _getGroupingColor() {
    switch (grouping) {
      case AyahGrouping.surah:
        return Colors.blue;
      case AyahGrouping.juz:
        return Colors.orange;
      case AyahGrouping.page:
        return Colors.purple;
      case AyahGrouping.ruku:
        return Colors.teal;
    }
  }

  @override
  bool shouldRepaint(_WedgeSectorPainter oldDelegate) {
    return oldDelegate.ayahs != ayahs ||
        oldDelegate.activityData != activityData ||
        oldDelegate.tileSize != tileSize ||
        oldDelegate.color != color ||
        oldDelegate.grouping != grouping;
  }
}
