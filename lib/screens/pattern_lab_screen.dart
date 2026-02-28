import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Interactive laboratory for experimenting with Islamic geometric patterns
/// Based on traditional construction methods: grids, star polygons, tessellations
class PatternLabScreen extends StatefulWidget {
  const PatternLabScreen({super.key});

  @override
  State<PatternLabScreen> createState() => _PatternLabScreenState();
}

class _PatternLabScreenState extends State<PatternLabScreen> {
  // Pattern type
  int _selectedPatternIndex = 0;

  // Common parameters
  double _lineWidth = 2.0;
  double _scale = 1.0;
  bool _showGrid = false;
  bool _fillStars = false;

  // Star parameters
  int _foldCount = 8; // 4, 6, 8, 10, 12
  double _starDepth = 0.4; // 0.1 to 0.9
  double _rotation = 0.0;

  // Tessellation parameters
  int _tilesX = 3;
  int _tilesY = 3;

  // Interlacing
  bool _interlace = false;

  // Colors
  Color _primaryColor = const Color(0xFF1565C0);
  Color _secondaryColor = const Color(0xFFFFD54F);
  Color _backgroundColor = const Color(0xFF0D1B2A);

  final List<String> _patternNames = [
    'Star Polygon',
    'Rosette',
    'Tessellation',
    'Girih Pattern',
    'Khatam (8-fold)',
    'Hexagonal Grid',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(
        title: const Text('Pattern Lab'),
        backgroundColor: _backgroundColor,
        actions: [
          IconButton(
            icon: Icon(_showGrid ? Icons.grid_on : Icons.grid_off),
            onPressed: () => setState(() => _showGrid = !_showGrid),
            tooltip: 'Toggle Grid',
          ),
        ],
      ),
      body: Column(
        children: [
          // Pattern display area
          Expanded(
            flex: 3,
            child: Center(
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: _primaryColor.withValues(alpha: 0.3),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CustomPaint(
                      painter: _getPatternPainter(),
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Controls
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.3),
                borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildPatternSelector(),
                    const SizedBox(height: 16),
                    _buildCommonControls(),
                    const SizedBox(height: 16),
                    _buildPatternSpecificControls(),
                    const SizedBox(height: 16),
                    _buildColorControls(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  CustomPainter _getPatternPainter() {
    switch (_selectedPatternIndex) {
      case 0:
        return _StarPolygonPainter(
          foldCount: _foldCount,
          starDepth: _starDepth,
          rotation: _rotation,
          lineWidth: _lineWidth,
          scale: _scale,
          showGrid: _showGrid,
          fillStars: _fillStars,
          primaryColor: _primaryColor,
          secondaryColor: _secondaryColor,
          backgroundColor: _backgroundColor,
        );
      case 1:
        return _RosettePainter(
          foldCount: _foldCount,
          starDepth: _starDepth,
          rotation: _rotation,
          lineWidth: _lineWidth,
          scale: _scale,
          showGrid: _showGrid,
          primaryColor: _primaryColor,
          secondaryColor: _secondaryColor,
          backgroundColor: _backgroundColor,
        );
      case 2:
        return _TessellationPainter(
          foldCount: _foldCount,
          starDepth: _starDepth,
          tilesX: _tilesX,
          tilesY: _tilesY,
          lineWidth: _lineWidth,
          scale: _scale,
          showGrid: _showGrid,
          interlace: _interlace,
          primaryColor: _primaryColor,
          secondaryColor: _secondaryColor,
          backgroundColor: _backgroundColor,
        );
      case 3:
        return _GirihPainter(
          starDepth: _starDepth,
          tilesX: _tilesX,
          tilesY: _tilesY,
          lineWidth: _lineWidth,
          scale: _scale,
          showGrid: _showGrid,
          primaryColor: _primaryColor,
          secondaryColor: _secondaryColor,
          backgroundColor: _backgroundColor,
        );
      case 4:
        return _KhatamPainter(
          starDepth: _starDepth,
          tilesX: _tilesX,
          tilesY: _tilesY,
          lineWidth: _lineWidth,
          scale: _scale,
          showGrid: _showGrid,
          interlace: _interlace,
          primaryColor: _primaryColor,
          secondaryColor: _secondaryColor,
          backgroundColor: _backgroundColor,
        );
      case 5:
        return _HexagonalGridPainter(
          starDepth: _starDepth,
          tilesX: _tilesX,
          tilesY: _tilesY,
          lineWidth: _lineWidth,
          scale: _scale,
          showGrid: _showGrid,
          primaryColor: _primaryColor,
          secondaryColor: _secondaryColor,
          backgroundColor: _backgroundColor,
        );
      default:
        return _StarPolygonPainter(
          foldCount: _foldCount,
          starDepth: _starDepth,
          rotation: _rotation,
          lineWidth: _lineWidth,
          scale: _scale,
          showGrid: _showGrid,
          fillStars: _fillStars,
          primaryColor: _primaryColor,
          secondaryColor: _secondaryColor,
          backgroundColor: _backgroundColor,
        );
    }
  }

  Widget _buildPatternSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Pattern Type',
          style: TextStyle(color: Colors.white70, fontSize: 12),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 36,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _patternNames.length,
            itemBuilder: (context, index) {
              final isSelected = index == _selectedPatternIndex;
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ChoiceChip(
                  label: Text(_patternNames[index]),
                  selected: isSelected,
                  onSelected: (selected) {
                    if (selected) {
                      setState(() => _selectedPatternIndex = index);
                    }
                  },
                  selectedColor: _primaryColor,
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.white : Colors.white70,
                    fontSize: 12,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCommonControls() {
    return Column(
      children: [
        _buildSlider(
          label: 'Line Width',
          value: _lineWidth,
          min: 0.5,
          max: 6.0,
          onChanged: (v) => setState(() => _lineWidth = v),
        ),
        _buildSlider(
          label: 'Scale',
          value: _scale,
          min: 0.5,
          max: 2.0,
          onChanged: (v) => setState(() => _scale = v),
        ),
      ],
    );
  }

  Widget _buildPatternSpecificControls() {
    switch (_selectedPatternIndex) {
      case 0: // Star Polygon
      case 1: // Rosette
        return Column(
          children: [
            _buildFoldSelector(),
            _buildSlider(
              label: 'Star Depth',
              value: _starDepth,
              min: 0.1,
              max: 0.9,
              onChanged: (v) => setState(() => _starDepth = v),
            ),
            _buildSlider(
              label: 'Rotation',
              value: _rotation,
              min: 0,
              max: 360,
              onChanged: (v) => setState(() => _rotation = v),
            ),
            if (_selectedPatternIndex == 0)
              _buildToggle(
                label: 'Fill Stars',
                value: _fillStars,
                onChanged: (v) => setState(() => _fillStars = v),
              ),
          ],
        );
      case 2: // Tessellation
      case 3: // Girih
      case 4: // Khatam
      case 5: // Hexagonal
        return Column(
          children: [
            if (_selectedPatternIndex == 2) _buildFoldSelector(),
            _buildSlider(
              label: 'Star Depth',
              value: _starDepth,
              min: 0.1,
              max: 0.9,
              onChanged: (v) => setState(() => _starDepth = v),
            ),
            _buildTileControls(),
            if (_selectedPatternIndex == 2 || _selectedPatternIndex == 4)
              _buildToggle(
                label: 'Interlace',
                value: _interlace,
                onChanged: (v) => setState(() => _interlace = v),
              ),
          ],
        );
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildFoldSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Fold Count (Symmetry)',
          style: TextStyle(color: Colors.white70, fontSize: 12),
        ),
        const SizedBox(height: 8),
        Row(
          children: [4, 6, 8, 10, 12].map((fold) {
            final isSelected = fold == _foldCount;
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: ChoiceChip(
                label: Text('$fold'),
                selected: isSelected,
                onSelected: (selected) {
                  if (selected) {
                    setState(() => _foldCount = fold);
                  }
                },
                selectedColor: _primaryColor,
                labelStyle: TextStyle(
                  color: isSelected ? Colors.white : Colors.white70,
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 12),
      ],
    );
  }

  Widget _buildTileControls() {
    return Row(
      children: [
        Expanded(
          child: _buildSlider(
            label: 'Tiles X',
            value: _tilesX.toDouble(),
            min: 1,
            max: 7,
            divisions: 6,
            onChanged: (v) => setState(() => _tilesX = v.round()),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildSlider(
            label: 'Tiles Y',
            value: _tilesY.toDouble(),
            min: 1,
            max: 7,
            divisions: 6,
            onChanged: (v) => setState(() => _tilesY = v.round()),
          ),
        ),
      ],
    );
  }

  Widget _buildSlider({
    required String label,
    required double value,
    required double min,
    required double max,
    required ValueChanged<double> onChanged,
    int? divisions,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(color: Colors.white70, fontSize: 12),
            ),
            Text(
              value.toStringAsFixed(divisions != null ? 0 : 2),
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ],
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: _primaryColor,
            thumbColor: _primaryColor,
            inactiveTrackColor: Colors.white24,
          ),
          child: Slider(
            value: value,
            min: min,
            max: max,
            divisions: divisions,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }

  Widget _buildToggle({
    required String label,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 12),
        ),
        Switch(
          value: value,
          onChanged: onChanged,
          activeTrackColor: _primaryColor,
          thumbColor: WidgetStateProperty.all(_primaryColor),
        ),
      ],
    );
  }

  Widget _buildColorControls() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Colors',
          style: TextStyle(color: Colors.white70, fontSize: 12),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            _buildColorButton('Primary', _primaryColor, (c) => setState(() => _primaryColor = c)),
            const SizedBox(width: 8),
            _buildColorButton('Secondary', _secondaryColor, (c) => setState(() => _secondaryColor = c)),
            const SizedBox(width: 8),
            _buildColorButton('Background', _backgroundColor, (c) => setState(() => _backgroundColor = c)),
          ],
        ),
        const SizedBox(height: 12),
        _buildPresetColors(),
      ],
    );
  }

  Widget _buildColorButton(String label, Color color, ValueChanged<Color> onChanged) {
    return Expanded(
      child: InkWell(
        onTap: () => _showColorPicker(label, color, onChanged),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.white24),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: color.computeLuminance() > 0.5 ? Colors.black : Colors.white,
              fontSize: 11,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPresetColors() {
    final presets = [
      // Traditional Islamic color schemes
      (const Color(0xFF1565C0), const Color(0xFFFFD54F), const Color(0xFF0D1B2A)), // Blue & Gold
      (const Color(0xFF2E7D32), const Color(0xFFFFD54F), const Color(0xFF1B2E1B)), // Green & Gold
      (const Color(0xFFC62828), const Color(0xFFFFD54F), const Color(0xFF2E0D0D)), // Red & Gold
      (const Color(0xFF6A1B9A), const Color(0xFFFFD54F), const Color(0xFF1B0D2E)), // Purple & Gold
      (const Color(0xFF00838F), const Color(0xFFFFD54F), const Color(0xFF0D1B1B)), // Teal & Gold
      (const Color(0xFFFFFFFF), const Color(0xFF424242), const Color(0xFF000000)), // Monochrome
    ];

    return Row(
      children: presets.map((preset) {
        return Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _primaryColor = preset.$1;
                _secondaryColor = preset.$2;
                _backgroundColor = preset.$3;
              });
            },
            child: Container(
              height: 32,
              margin: const EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [preset.$1, preset.$2],
                ),
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.white24),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  void _showColorPicker(String label, Color currentColor, ValueChanged<Color> onChanged) {
    final colors = [
      Colors.red, Colors.pink, Colors.purple, Colors.deepPurple,
      Colors.indigo, Colors.blue, Colors.lightBlue, Colors.cyan,
      Colors.teal, Colors.green, Colors.lightGreen, Colors.lime,
      Colors.yellow, Colors.amber, Colors.orange, Colors.deepOrange,
      Colors.brown, Colors.grey, Colors.blueGrey, Colors.black,
      Colors.white,
    ];

    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1E1E1E),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select $label Color',
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: colors.map((color) {
                  return GestureDetector(
                    onTap: () {
                      onChanged(color);
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: currentColor == color ? Colors.white : Colors.white24,
                          width: currentColor == color ? 2 : 1,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}

// =============================================================================
// PATTERN PAINTERS
// =============================================================================

/// Basic star polygon with n-fold symmetry
class _StarPolygonPainter extends CustomPainter {
  final int foldCount;
  final double starDepth;
  final double rotation;
  final double lineWidth;
  final double scale;
  final bool showGrid;
  final bool fillStars;
  final Color primaryColor;
  final Color secondaryColor;
  final Color backgroundColor;

  _StarPolygonPainter({
    required this.foldCount,
    required this.starDepth,
    required this.rotation,
    required this.lineWidth,
    required this.scale,
    required this.showGrid,
    required this.fillStars,
    required this.primaryColor,
    required this.secondaryColor,
    required this.backgroundColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width / 2) * 0.8 * scale;
    final innerRadius = radius * starDepth;

    // Draw construction grid
    if (showGrid) {
      _drawConstructionGrid(canvas, center, radius);
    }

    // Draw the star polygon
    final path = _createStarPath(center, radius, innerRadius, foldCount, rotation);

    if (fillStars) {
      canvas.drawPath(
        path,
        Paint()..color = secondaryColor.withValues(alpha: 0.3),
      );
    }

    canvas.drawPath(
      path,
      Paint()
        ..color = primaryColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = lineWidth
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round,
    );

    // Draw outer circle
    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..color = primaryColor.withValues(alpha: 0.3)
        ..style = PaintingStyle.stroke
        ..strokeWidth = lineWidth * 0.5,
    );

    // Draw inner circle
    canvas.drawCircle(
      center,
      innerRadius,
      Paint()
        ..color = secondaryColor.withValues(alpha: 0.3)
        ..style = PaintingStyle.stroke
        ..strokeWidth = lineWidth * 0.5,
    );
  }

  void _drawConstructionGrid(Canvas canvas, Offset center, double radius) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.5;

    // Draw radial lines
    for (var i = 0; i < foldCount * 2; i++) {
      final angle = (i * 180 / foldCount + rotation - 90) * math.pi / 180;
      final endX = center.dx + radius * 1.1 * math.cos(angle);
      final endY = center.dy + radius * 1.1 * math.sin(angle);
      canvas.drawLine(center, Offset(endX, endY), paint);
    }

    // Draw concentric circles
    for (var i = 1; i <= 5; i++) {
      canvas.drawCircle(center, radius * i / 5, paint);
    }
  }

  Path _createStarPath(Offset center, double outerRadius, double innerRadius, int points, double rotation) {
    final path = Path();
    final totalPoints = points * 2;

    for (var i = 0; i < totalPoints; i++) {
      final angle = (i * 180 / points + rotation - 90) * math.pi / 180;
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
    return path;
  }

  @override
  bool shouldRepaint(covariant _StarPolygonPainter oldDelegate) => true;
}

/// Rosette pattern with multiple overlapping elements
class _RosettePainter extends CustomPainter {
  final int foldCount;
  final double starDepth;
  final double rotation;
  final double lineWidth;
  final double scale;
  final bool showGrid;
  final Color primaryColor;
  final Color secondaryColor;
  final Color backgroundColor;

  _RosettePainter({
    required this.foldCount,
    required this.starDepth,
    required this.rotation,
    required this.lineWidth,
    required this.scale,
    required this.showGrid,
    required this.primaryColor,
    required this.secondaryColor,
    required this.backgroundColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width / 2) * 0.8 * scale;

    if (showGrid) {
      _drawRadialGrid(canvas, center, radius, foldCount);
    }

    // Draw multiple layers of the rosette
    for (var layer = 0; layer < 3; layer++) {
      final layerRadius = radius * (1 - layer * 0.25);
      final layerRotation = rotation + layer * (180 / foldCount / 2);
      final color = layer == 0 ? primaryColor : (layer == 1 ? secondaryColor : primaryColor);
      final alpha = 1.0 - layer * 0.3;

      _drawRosetteLayer(canvas, center, layerRadius, layerRotation, color.withValues(alpha: alpha));
    }

    // Draw petal arcs
    _drawPetalArcs(canvas, center, radius);

    // Center decoration
    canvas.drawCircle(
      center,
      radius * 0.15,
      Paint()..color = secondaryColor,
    );
    canvas.drawCircle(
      center,
      radius * 0.1,
      Paint()..color = primaryColor,
    );
  }

  void _drawRadialGrid(Canvas canvas, Offset center, double radius, int divisions) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.5;

    for (var i = 0; i < divisions; i++) {
      final angle = (i * 360 / divisions + rotation) * math.pi / 180;
      final endX = center.dx + radius * 1.1 * math.cos(angle);
      final endY = center.dy + radius * 1.1 * math.sin(angle);
      canvas.drawLine(center, Offset(endX, endY), paint);
    }
  }

  void _drawRosetteLayer(Canvas canvas, Offset center, double radius, double rotation, Color color) {
    final innerRadius = radius * starDepth;
    final path = Path();
    final totalPoints = foldCount * 2;

    for (var i = 0; i < totalPoints; i++) {
      final angle = (i * 180 / foldCount + rotation - 90) * math.pi / 180;
      final r = i.isEven ? radius : innerRadius;
      final x = center.dx + r * math.cos(angle);
      final y = center.dy + r * math.sin(angle);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();

    canvas.drawPath(
      path,
      Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = lineWidth
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round,
    );
  }

  void _drawPetalArcs(Canvas canvas, Offset center, double radius) {
    final arcRadius = radius * 0.3;
    final paint = Paint()
      ..color = secondaryColor.withValues(alpha: 0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = lineWidth * 0.7;

    for (var i = 0; i < foldCount; i++) {
      final angle = (i * 360 / foldCount + rotation) * math.pi / 180;
      final arcCenter = Offset(
        center.dx + radius * 0.6 * math.cos(angle),
        center.dy + radius * 0.6 * math.sin(angle),
      );

      canvas.drawArc(
        Rect.fromCircle(center: arcCenter, radius: arcRadius),
        angle - math.pi / 2,
        math.pi,
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _RosettePainter oldDelegate) => true;
}

/// Tessellation of star polygons
class _TessellationPainter extends CustomPainter {
  final int foldCount;
  final double starDepth;
  final int tilesX;
  final int tilesY;
  final double lineWidth;
  final double scale;
  final bool showGrid;
  final bool interlace;
  final Color primaryColor;
  final Color secondaryColor;
  final Color backgroundColor;

  _TessellationPainter({
    required this.foldCount,
    required this.starDepth,
    required this.tilesX,
    required this.tilesY,
    required this.lineWidth,
    required this.scale,
    required this.showGrid,
    required this.interlace,
    required this.primaryColor,
    required this.secondaryColor,
    required this.backgroundColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final tileSize = size.width / tilesX * scale;
    final offsetX = (size.width - tileSize * tilesX) / 2;
    final offsetY = (size.height - tileSize * tilesY) / 2;

    if (showGrid) {
      _drawTileGrid(canvas, size, tileSize, offsetX, offsetY);
    }

    for (var y = 0; y < tilesY; y++) {
      for (var x = 0; x < tilesX; x++) {
        final center = Offset(
          offsetX + x * tileSize + tileSize / 2,
          offsetY + y * tileSize + tileSize / 2,
        );
        _drawTileStar(canvas, center, tileSize / 2 * 0.9, (x + y) % 2 == 0);
      }
    }

    // Draw connecting lines between stars
    _drawConnections(canvas, size, tileSize, offsetX, offsetY);
  }

  void _drawTileGrid(Canvas canvas, Size size, double tileSize, double offsetX, double offsetY) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.5;

    for (var x = 0; x <= tilesX; x++) {
      canvas.drawLine(
        Offset(offsetX + x * tileSize, offsetY),
        Offset(offsetX + x * tileSize, offsetY + tilesY * tileSize),
        paint,
      );
    }
    for (var y = 0; y <= tilesY; y++) {
      canvas.drawLine(
        Offset(offsetX, offsetY + y * tileSize),
        Offset(offsetX + tilesX * tileSize, offsetY + y * tileSize),
        paint,
      );
    }
  }

  void _drawTileStar(Canvas canvas, Offset center, double radius, bool isPrimary) {
    final innerRadius = radius * starDepth;
    final path = Path();
    final totalPoints = foldCount * 2;

    for (var i = 0; i < totalPoints; i++) {
      final angle = (i * 180 / foldCount - 90) * math.pi / 180;
      final r = i.isEven ? radius : innerRadius;
      final x = center.dx + r * math.cos(angle);
      final y = center.dy + r * math.sin(angle);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();

    final color = isPrimary ? primaryColor : secondaryColor;

    canvas.drawPath(
      path,
      Paint()
        ..color = color.withValues(alpha: 0.2)
        ..style = PaintingStyle.fill,
    );

    canvas.drawPath(
      path,
      Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = lineWidth
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round,
    );
  }

  void _drawConnections(Canvas canvas, Size size, double tileSize, double offsetX, double offsetY) {
    final paint = Paint()
      ..color = primaryColor.withValues(alpha: 0.4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = lineWidth * 0.5;

    for (var y = 0; y < tilesY; y++) {
      for (var x = 0; x < tilesX; x++) {
        final center = Offset(
          offsetX + x * tileSize + tileSize / 2,
          offsetY + y * tileSize + tileSize / 2,
        );

        // Connect to right neighbor
        if (x < tilesX - 1) {
          final rightCenter = Offset(center.dx + tileSize, center.dy);
          canvas.drawLine(
            Offset(center.dx + tileSize / 2 * 0.9 * starDepth, center.dy),
            Offset(rightCenter.dx - tileSize / 2 * 0.9 * starDepth, rightCenter.dy),
            paint,
          );
        }

        // Connect to bottom neighbor
        if (y < tilesY - 1) {
          final bottomCenter = Offset(center.dx, center.dy + tileSize);
          canvas.drawLine(
            Offset(center.dx, center.dy + tileSize / 2 * 0.9 * starDepth),
            Offset(bottomCenter.dx, bottomCenter.dy - tileSize / 2 * 0.9 * starDepth),
            paint,
          );
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant _TessellationPainter oldDelegate) => true;
}

/// Persian Girih pattern (10-fold based)
class _GirihPainter extends CustomPainter {
  final double starDepth;
  final int tilesX;
  final int tilesY;
  final double lineWidth;
  final double scale;
  final bool showGrid;
  final Color primaryColor;
  final Color secondaryColor;
  final Color backgroundColor;

  _GirihPainter({
    required this.starDepth,
    required this.tilesX,
    required this.tilesY,
    required this.lineWidth,
    required this.scale,
    required this.showGrid,
    required this.primaryColor,
    required this.secondaryColor,
    required this.backgroundColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final tileSize = size.width / tilesX * scale;
    final offsetX = (size.width - tileSize * tilesX) / 2;
    final offsetY = (size.height - tileSize * tilesY) / 2;

    // Draw 10-pointed stars in a grid with connecting lines
    for (var y = 0; y < tilesY; y++) {
      for (var x = 0; x < tilesX; x++) {
        final center = Offset(
          offsetX + x * tileSize + tileSize / 2,
          offsetY + y * tileSize + tileSize / 2,
        );
        _drawDecagram(canvas, center, tileSize / 2 * 0.85);
      }
    }

    // Draw girih strap lines
    _drawGirihStraps(canvas, size, tileSize, offsetX, offsetY);
  }

  void _drawDecagram(Canvas canvas, Offset center, double radius) {
    final innerRadius = radius * starDepth;
    final path = Path();

    // 10-pointed star
    for (var i = 0; i < 20; i++) {
      final angle = (i * 18 - 90) * math.pi / 180;
      final r = i.isEven ? radius : innerRadius;
      final x = center.dx + r * math.cos(angle);
      final y = center.dy + r * math.sin(angle);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();

    canvas.drawPath(
      path,
      Paint()
        ..color = primaryColor.withValues(alpha: 0.15)
        ..style = PaintingStyle.fill,
    );

    canvas.drawPath(
      path,
      Paint()
        ..color = primaryColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = lineWidth
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round,
    );
  }

  void _drawGirihStraps(Canvas canvas, Size size, double tileSize, double offsetX, double offsetY) {
    final paint = Paint()
      ..color = secondaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = lineWidth * 0.7
      ..strokeCap = StrokeCap.round;

    // Draw diagonal connecting straps between decagrams
    for (var y = 0; y < tilesY; y++) {
      for (var x = 0; x < tilesX; x++) {
        final center = Offset(
          offsetX + x * tileSize + tileSize / 2,
          offsetY + y * tileSize + tileSize / 2,
        );

        // Draw strap lines extending from each point
        for (var i = 0; i < 10; i++) {
          final angle = (i * 36 - 90) * math.pi / 180;
          final innerPt = Offset(
            center.dx + tileSize / 2 * 0.85 * starDepth * math.cos(angle),
            center.dy + tileSize / 2 * 0.85 * starDepth * math.sin(angle),
          );
          final outerPt = Offset(
            center.dx + tileSize / 2 * 0.95 * math.cos(angle),
            center.dy + tileSize / 2 * 0.95 * math.sin(angle),
          );
          canvas.drawLine(innerPt, outerPt, paint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant _GirihPainter oldDelegate) => true;
}

/// Khatam pattern (8-fold octagram based)
class _KhatamPainter extends CustomPainter {
  final double starDepth;
  final int tilesX;
  final int tilesY;
  final double lineWidth;
  final double scale;
  final bool showGrid;
  final bool interlace;
  final Color primaryColor;
  final Color secondaryColor;
  final Color backgroundColor;

  _KhatamPainter({
    required this.starDepth,
    required this.tilesX,
    required this.tilesY,
    required this.lineWidth,
    required this.scale,
    required this.showGrid,
    required this.interlace,
    required this.primaryColor,
    required this.secondaryColor,
    required this.backgroundColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final tileSize = size.width / tilesX * scale;
    final offsetX = (size.width - tileSize * tilesX) / 2;
    final offsetY = (size.height - tileSize * tilesY) / 2;

    if (showGrid) {
      _drawOctagonalGrid(canvas, size, tileSize, offsetX, offsetY);
    }

    // Draw octagrams with squares in between
    for (var y = 0; y < tilesY; y++) {
      for (var x = 0; x < tilesX; x++) {
        final center = Offset(
          offsetX + x * tileSize + tileSize / 2,
          offsetY + y * tileSize + tileSize / 2,
        );
        _drawOctagram(canvas, center, tileSize / 2 * 0.85);
      }
    }

    // Draw the connecting squares/crosses between octagrams
    _drawConnectingShapes(canvas, size, tileSize, offsetX, offsetY);
  }

  void _drawOctagonalGrid(Canvas canvas, Size size, double tileSize, double offsetX, double offsetY) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.5;

    for (var y = 0; y <= tilesY; y++) {
      for (var x = 0; x <= tilesX; x++) {
        final center = Offset(offsetX + x * tileSize, offsetY + y * tileSize);
        // Draw small octagon at intersection
        final octPath = Path();
        for (var i = 0; i < 8; i++) {
          final angle = (i * 45) * math.pi / 180;
          final pt = Offset(
            center.dx + tileSize * 0.1 * math.cos(angle),
            center.dy + tileSize * 0.1 * math.sin(angle),
          );
          if (i == 0) {
            octPath.moveTo(pt.dx, pt.dy);
          } else {
            octPath.lineTo(pt.dx, pt.dy);
          }
        }
        octPath.close();
        canvas.drawPath(octPath, paint);
      }
    }
  }

  void _drawOctagram(Canvas canvas, Offset center, double radius) {
    final innerRadius = radius * starDepth;

    // Draw two overlapping squares rotated 45 degrees
    for (var rotation in [0.0, 45.0]) {
      final path = Path();
      for (var i = 0; i < 4; i++) {
        final angle = (i * 90 + rotation - 45) * math.pi / 180;
        final x = center.dx + radius * math.cos(angle);
        final y = center.dy + radius * math.sin(angle);

        if (i == 0) {
          path.moveTo(x, y);
        } else {
          path.lineTo(x, y);
        }
      }
      path.close();

      canvas.drawPath(
        path,
        Paint()
          ..color = (rotation == 0 ? primaryColor : secondaryColor).withValues(alpha: 0.15)
          ..style = PaintingStyle.fill,
      );

      canvas.drawPath(
        path,
        Paint()
          ..color = rotation == 0 ? primaryColor : secondaryColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = lineWidth
          ..strokeCap = StrokeCap.round
          ..strokeJoin = StrokeJoin.round,
      );
    }

    // Draw 8-pointed star outline
    final starPath = Path();
    for (var i = 0; i < 16; i++) {
      final angle = (i * 22.5 - 90) * math.pi / 180;
      final r = i.isEven ? radius : innerRadius;
      final x = center.dx + r * math.cos(angle);
      final y = center.dy + r * math.sin(angle);

      if (i == 0) {
        starPath.moveTo(x, y);
      } else {
        starPath.lineTo(x, y);
      }
    }
    starPath.close();

    canvas.drawPath(
      starPath,
      Paint()
        ..color = primaryColor.withValues(alpha: 0.5)
        ..style = PaintingStyle.stroke
        ..strokeWidth = lineWidth * 0.5,
    );
  }

  void _drawConnectingShapes(Canvas canvas, Size size, double tileSize, double offsetX, double offsetY) {
    final paint = Paint()
      ..color = secondaryColor.withValues(alpha: 0.3)
      ..style = PaintingStyle.fill;

    final strokePaint = Paint()
      ..color = secondaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = lineWidth * 0.5;

    // Draw small squares at the corners between tiles
    for (var y = 0; y < tilesY - 1; y++) {
      for (var x = 0; x < tilesX - 1; x++) {
        final cornerCenter = Offset(
          offsetX + (x + 1) * tileSize,
          offsetY + (y + 1) * tileSize,
        );
        final squareSize = tileSize * 0.15 * (1 - starDepth);

        // Rotate 45 degrees
        final rotatedPath = Path();
        for (var i = 0; i < 4; i++) {
          final angle = (i * 90 + 45) * math.pi / 180;
          final x = cornerCenter.dx + squareSize * 0.7 * math.cos(angle);
          final y = cornerCenter.dy + squareSize * 0.7 * math.sin(angle);
          if (i == 0) {
            rotatedPath.moveTo(x, y);
          } else {
            rotatedPath.lineTo(x, y);
          }
        }
        rotatedPath.close();

        canvas.drawPath(rotatedPath, paint);
        canvas.drawPath(rotatedPath, strokePaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _KhatamPainter oldDelegate) => true;
}

/// Hexagonal grid pattern (6-fold based)
class _HexagonalGridPainter extends CustomPainter {
  final double starDepth;
  final int tilesX;
  final int tilesY;
  final double lineWidth;
  final double scale;
  final bool showGrid;
  final Color primaryColor;
  final Color secondaryColor;
  final Color backgroundColor;

  _HexagonalGridPainter({
    required this.starDepth,
    required this.tilesX,
    required this.tilesY,
    required this.lineWidth,
    required this.scale,
    required this.showGrid,
    required this.primaryColor,
    required this.secondaryColor,
    required this.backgroundColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final hexRadius = size.width / tilesX / 2 * scale;
    final hexHeight = hexRadius * math.sqrt(3);
    final hexWidth = hexRadius * 2;

    final offsetX = (size.width - (tilesX - 0.5) * hexWidth * 0.75) / 2;
    final offsetY = (size.height - tilesY * hexHeight) / 2;

    for (var y = 0; y < tilesY; y++) {
      for (var x = 0; x < tilesX; x++) {
        final xOffset = (y % 2 == 1) ? hexWidth * 0.75 / 2 : 0;
        final center = Offset(
          offsetX + x * hexWidth * 0.75 + hexRadius + xOffset,
          offsetY + y * hexHeight + hexHeight / 2,
        );

        if (showGrid) {
          _drawHexagon(canvas, center, hexRadius, true);
        }

        // Draw 6-pointed star inside each hexagon
        _drawHexagramInHexagon(canvas, center, hexRadius * 0.85);
      }
    }
  }

  void _drawHexagon(Canvas canvas, Offset center, double radius, bool isGrid) {
    final path = Path();
    for (var i = 0; i < 6; i++) {
      final angle = (i * 60 - 30) * math.pi / 180;
      final x = center.dx + radius * math.cos(angle);
      final y = center.dy + radius * math.sin(angle);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();

    canvas.drawPath(
      path,
      Paint()
        ..color = (isGrid ? Colors.white : primaryColor).withValues(alpha: isGrid ? 0.1 : 0.2)
        ..style = isGrid ? PaintingStyle.stroke : PaintingStyle.fill
        ..strokeWidth = 0.5,
    );
  }

  void _drawHexagramInHexagon(Canvas canvas, Offset center, double radius) {
    final innerRadius = radius * starDepth;

    // Draw 6-pointed star (two overlapping triangles)
    for (var rotation in [0.0, 180.0]) {
      final path = Path();
      for (var i = 0; i < 3; i++) {
        final angle = (i * 120 + rotation - 90) * math.pi / 180;
        final x = center.dx + radius * math.cos(angle);
        final y = center.dy + radius * math.sin(angle);

        if (i == 0) {
          path.moveTo(x, y);
        } else {
          path.lineTo(x, y);
        }
      }
      path.close();

      canvas.drawPath(
        path,
        Paint()
          ..color = (rotation == 0 ? primaryColor : secondaryColor).withValues(alpha: 0.2)
          ..style = PaintingStyle.fill,
      );

      canvas.drawPath(
        path,
        Paint()
          ..color = rotation == 0 ? primaryColor : secondaryColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = lineWidth
          ..strokeCap = StrokeCap.round
          ..strokeJoin = StrokeJoin.round,
      );
    }

    // Draw the actual hexagram outline
    final starPath = Path();
    for (var i = 0; i < 12; i++) {
      final angle = (i * 30 - 90) * math.pi / 180;
      final r = i.isEven ? radius : innerRadius;
      final x = center.dx + r * math.cos(angle);
      final y = center.dy + r * math.sin(angle);

      if (i == 0) {
        starPath.moveTo(x, y);
      } else {
        starPath.lineTo(x, y);
      }
    }
    starPath.close();

    canvas.drawPath(
      starPath,
      Paint()
        ..color = primaryColor.withValues(alpha: 0.4)
        ..style = PaintingStyle.stroke
        ..strokeWidth = lineWidth * 0.5,
    );

    // Center hexagon
    _drawHexagon(canvas, center, innerRadius * 0.6, false);
  }

  @override
  bool shouldRepaint(covariant _HexagonalGridPainter oldDelegate) => true;
}
