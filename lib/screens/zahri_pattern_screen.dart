import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Implementation of "Mathematical Modeling of a Class of Symmetrical Islamic Design"
/// by Mostafa Zahri (2019)
///
/// Based on periodic sequences on the unit circle to generate Islamic geometric patterns.
/// Reference: https://doi.org/10.3390/sym11040517

class ZahriPatternScreen extends StatefulWidget {
  const ZahriPatternScreen({super.key});

  @override
  State<ZahriPatternScreen> createState() => _ZahriPatternScreenState();
}

class _ZahriPatternScreenState extends State<ZahriPatternScreen> {
  // Pattern type selector
  int _selectedPatternType = 0;
  final List<String> _patternTypes = [
    'Single Cell',
    'Composite Cell',
    'Circular Composite',
    'Overlapping Cells',
  ];

  // Main parameters from the paper
  int _k = 1; // Number of loops
  int _n = 8; // First-come-back index (must be > 2*|k|)

  // For composite cells (odd n)
  int _kOdd = 1;
  int _nOdd = 9;

  // For circular composite
  int _surroundingCells = 6;
  int _k0 = 3;
  int _n0 = 20;
  int _k1 = 1;
  int _n1 = 26;

  // For overlapping cells
  int _overlappingLayers = 4;
  List<(int, int)> _overlappingParams = [(1, 20), (5, 42), (5, 74), (5, 74)];

  // Tessellation parameters
  int _tilesX = 4;
  int _tilesY = 4;

  // Visual parameters
  double _lineWidth = 2.0;
  bool _fillShapes = true;
  bool _showCircle = true;
  double _initialAngle = 0.0;

  // Colors
  Color _primaryColor = const Color(0xFF1565C0);
  Color _secondaryColor = const Color(0xFFFFD54F);
  Color _backgroundColor = const Color(0xFF0D1B2A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(
        title: const Text('Zahri Islamic Patterns'),
        backgroundColor: _backgroundColor,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(_showCircle ? Icons.circle_outlined : Icons.circle),
            onPressed: () => setState(() => _showCircle = !_showCircle),
            tooltip: 'Toggle Circle',
          ),
          IconButton(
            icon: Icon(_fillShapes ? Icons.format_color_fill : Icons.format_color_reset),
            onPressed: () => setState(() => _fillShapes = !_fillShapes),
            tooltip: 'Toggle Fill',
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
          // Info display
          _buildInfoDisplay(),
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
                    _buildPatternTypeSelector(),
                    const SizedBox(height: 16),
                    _buildPatternControls(),
                    const SizedBox(height: 16),
                    _buildVisualControls(),
                    const SizedBox(height: 16),
                    _buildColorPresets(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoDisplay() {
    final a = _calculateParameterA();
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildInfoItem('k (loops)', _getActiveK().toString()),
          _buildInfoItem('n (come-back)', _getActiveN().toString()),
          _buildInfoItem('a', a.toStringAsFixed(4)),
          _buildInfoItem('Formula', _selectedPatternType == 1 ? 'o(k,n)' : 'e(k,n)'),
        ],
      ),
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Column(
      children: [
        Text(label, style: const TextStyle(color: Colors.white54, fontSize: 10)),
        const SizedBox(height: 2),
        Text(value, style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
      ],
    );
  }

  int _getActiveK() {
    switch (_selectedPatternType) {
      case 0:
        return _k;
      case 1:
        return _kOdd;
      case 2:
        return _k0;
      case 3:
        return _overlappingParams[0].$1;
      default:
        return _k;
    }
  }

  int _getActiveN() {
    switch (_selectedPatternType) {
      case 0:
        return _n;
      case 1:
        return _nOdd;
      case 2:
        return _n0;
      case 3:
        return _overlappingParams[0].$2;
      default:
        return _n;
    }
  }

  double _calculateParameterA() {
    switch (_selectedPatternType) {
      case 0:
        return ZahriPatternMath.e(_k, _n);
      case 1:
        return ZahriPatternMath.o(_kOdd, _nOdd);
      case 2:
        return ZahriPatternMath.e(_k0, _n0);
      case 3:
        return ZahriPatternMath.e(_overlappingParams[0].$1, _overlappingParams[0].$2);
      default:
        return 0.5;
    }
  }

  CustomPainter _getPatternPainter() {
    switch (_selectedPatternType) {
      case 0:
        return ZahriSingleCellPainter(
          k: _k,
          n: _n,
          tilesX: _tilesX,
          tilesY: _tilesY,
          initialAngle: _initialAngle,
          lineWidth: _lineWidth,
          fillShapes: _fillShapes,
          showCircle: _showCircle,
          primaryColor: _primaryColor,
          secondaryColor: _secondaryColor,
          backgroundColor: _backgroundColor,
        );
      case 1:
        return ZahriCompositeCellPainter(
          k: _kOdd,
          n: _nOdd,
          tilesX: _tilesX,
          tilesY: _tilesY,
          initialAngle: _initialAngle,
          lineWidth: _lineWidth,
          fillShapes: _fillShapes,
          showCircle: _showCircle,
          primaryColor: _primaryColor,
          secondaryColor: _secondaryColor,
          backgroundColor: _backgroundColor,
        );
      case 2:
        return ZahriCircularCompositePainter(
          k0: _k0,
          n0: _n0,
          k1: _k1,
          n1: _n1,
          surroundingCells: _surroundingCells,
          tilesX: _tilesX,
          tilesY: _tilesY,
          initialAngle: _initialAngle,
          lineWidth: _lineWidth,
          fillShapes: _fillShapes,
          showCircle: _showCircle,
          primaryColor: _primaryColor,
          secondaryColor: _secondaryColor,
          backgroundColor: _backgroundColor,
        );
      case 3:
        return ZahriOverlappingCellsPainter(
          params: _overlappingParams,
          tilesX: _tilesX,
          tilesY: _tilesY,
          initialAngle: _initialAngle,
          lineWidth: _lineWidth,
          fillShapes: _fillShapes,
          showCircle: _showCircle,
          primaryColor: _primaryColor,
          secondaryColor: _secondaryColor,
          backgroundColor: _backgroundColor,
        );
      default:
        return ZahriSingleCellPainter(
          k: _k,
          n: _n,
          tilesX: _tilesX,
          tilesY: _tilesY,
          initialAngle: _initialAngle,
          lineWidth: _lineWidth,
          fillShapes: _fillShapes,
          showCircle: _showCircle,
          primaryColor: _primaryColor,
          secondaryColor: _secondaryColor,
          backgroundColor: _backgroundColor,
        );
    }
  }

  Widget _buildPatternTypeSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Pattern Type (from Paper)',
          style: TextStyle(color: Colors.white70, fontSize: 12),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 36,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _patternTypes.length,
            itemBuilder: (context, index) {
              final isSelected = index == _selectedPatternType;
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ChoiceChip(
                  label: Text(_patternTypes[index]),
                  selected: isSelected,
                  onSelected: (selected) {
                    if (selected) {
                      setState(() => _selectedPatternType = index);
                    }
                  },
                  selectedColor: _primaryColor,
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.white : Colors.white70,
                    fontSize: 11,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPatternControls() {
    switch (_selectedPatternType) {
      case 0:
        return _buildSingleCellControls();
      case 1:
        return _buildCompositeCellControls();
      case 2:
        return _buildCircularCompositeControls();
      case 3:
        return _buildOverlappingControls();
      default:
        return _buildSingleCellControls();
    }
  }

  Widget _buildSingleCellControls() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Single Cell Parameters (even n)',
          style: TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          'a = e(k,n) = (1/2)(4k/n + 1)',
          style: TextStyle(color: Colors.white38, fontSize: 10, fontStyle: FontStyle.italic),
        ),
        const SizedBox(height: 8),
        _buildSlider(
          label: 'k (loops)',
          value: _k.toDouble(),
          min: 1,
          max: 15,
          divisions: 14,
          onChanged: (v) => setState(() => _k = v.round()),
        ),
        _buildSlider(
          label: 'n (first-come-back, even)',
          value: _n.toDouble(),
          min: 4,
          max: 100,
          divisions: 48,
          onChanged: (v) {
            int newN = v.round();
            if (newN.isOdd) newN++;
            setState(() => _n = newN);
          },
        ),
        _buildTileControls(),
      ],
    );
  }

  Widget _buildCompositeCellControls() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Composite Cell Parameters (odd n)',
          style: TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          'a = o(k,n) = (1/2)((4k-1)/n + 1)',
          style: TextStyle(color: Colors.white38, fontSize: 10, fontStyle: FontStyle.italic),
        ),
        const SizedBox(height: 8),
        _buildSlider(
          label: 'k (loops)',
          value: _kOdd.toDouble(),
          min: 1,
          max: 10,
          divisions: 9,
          onChanged: (v) => setState(() => _kOdd = v.round()),
        ),
        _buildSlider(
          label: 'n (first-come-back, odd)',
          value: _nOdd.toDouble(),
          min: 5,
          max: 51,
          divisions: 23,
          onChanged: (v) {
            int newN = v.round();
            if (newN.isEven) newN++;
            setState(() => _nOdd = newN);
          },
        ),
        _buildTileControls(),
      ],
    );
  }

  Widget _buildCircularCompositeControls() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Circular Composite Parameters',
          style: TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        _buildSlider(
          label: 'Surrounding Cells (H)',
          value: _surroundingCells.toDouble(),
          min: 4,
          max: 12,
          divisions: 8,
          onChanged: (v) => setState(() => _surroundingCells = v.round()),
        ),
        Row(
          children: [
            Expanded(
              child: _buildSlider(
                label: 'k₀ (center)',
                value: _k0.toDouble(),
                min: 1,
                max: 15,
                divisions: 14,
                onChanged: (v) => setState(() => _k0 = v.round()),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildSlider(
                label: 'n₀ (center)',
                value: _n0.toDouble(),
                min: 4,
                max: 80,
                divisions: 38,
                onChanged: (v) {
                  int newN = v.round();
                  if (newN.isOdd) newN++;
                  setState(() => _n0 = newN);
                },
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: _buildSlider(
                label: 'k₁ (surround)',
                value: _k1.toDouble(),
                min: 1,
                max: 10,
                divisions: 9,
                onChanged: (v) => setState(() => _k1 = v.round()),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildSlider(
                label: 'n₁ (surround)',
                value: _n1.toDouble(),
                min: 4,
                max: 80,
                divisions: 38,
                onChanged: (v) {
                  int newN = v.round();
                  if (newN.isOdd) newN++;
                  setState(() => _n1 = newN);
                },
              ),
            ),
          ],
        ),
        _buildTileControls(),
      ],
    );
  }

  Widget _buildOverlappingControls() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Overlapping Cells Parameters',
          style: TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        _buildSlider(
          label: 'Layers',
          value: _overlappingLayers.toDouble(),
          min: 2,
          max: 6,
          divisions: 4,
          onChanged: (v) {
            final newLayers = v.round();
            setState(() {
              _overlappingLayers = newLayers;
              while (_overlappingParams.length < newLayers) {
                _overlappingParams.add((1, 20));
              }
              if (_overlappingParams.length > newLayers) {
                _overlappingParams = _overlappingParams.sublist(0, newLayers);
              }
            });
          },
        ),
        const SizedBox(height: 8),
        _buildOverlappingPresets(),
        _buildTileControls(),
      ],
    );
  }

  Widget _buildOverlappingPresets() {
    final presets = [
      // From paper figures
      [(1, 20), (1, 20), (1, 20), (1, 20)], // Figure 14a
      [(5, 42), (5, 46), (5, 74), (5, 74)], // Figure 14b
      [(3, 42), (1, 32), (4, 42), (3, 64)], // Figure 14c
      [(5, 66), (1, 44), (3, 64), (4, 64)], // Figure 14d
      [(7, 76), (1, 44), (5, 72), (1, 20)], // Figure 15a
      [(3, 40), (2, 20), (2, 22), (3, 44)], // Figure 15e
    ];

    final presetNames = ['14a', '14b', '14c', '14d', '15a', '15e'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Paper Figure Presets',
          style: TextStyle(color: Colors.white54, fontSize: 10),
        ),
        const SizedBox(height: 4),
        SizedBox(
          height: 32,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: presets.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    backgroundColor: _primaryColor.withValues(alpha: 0.3),
                  ),
                  onPressed: () {
                    setState(() {
                      _overlappingParams = presets[index].map((p) => (p.$1, p.$2)).toList();
                      _overlappingLayers = _overlappingParams.length;
                    });
                  },
                  child: Text(
                    'Fig ${presetNames[index]}',
                    style: const TextStyle(fontSize: 10, color: Colors.white),
                  ),
                ),
              );
            },
          ),
        ),
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

  Widget _buildVisualControls() {
    return Column(
      children: [
        _buildSlider(
          label: 'Line Width',
          value: _lineWidth,
          min: 0.5,
          max: 5.0,
          onChanged: (v) => setState(() => _lineWidth = v),
        ),
        _buildSlider(
          label: 'Initial Angle (α)',
          value: _initialAngle,
          min: 0,
          max: 360,
          onChanged: (v) => setState(() => _initialAngle = v),
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
            Text(label, style: const TextStyle(color: Colors.white70, fontSize: 11)),
            Text(
              value.toStringAsFixed(divisions != null ? 0 : 2),
              style: const TextStyle(color: Colors.white, fontSize: 11),
            ),
          ],
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: _primaryColor,
            thumbColor: _primaryColor,
            inactiveTrackColor: Colors.white24,
            trackHeight: 2,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
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

  Widget _buildColorPresets() {
    final presets = [
      (const Color(0xFF1565C0), const Color(0xFFFFD54F), const Color(0xFF0D1B2A)),
      (const Color(0xFF2E7D32), const Color(0xFFFFD54F), const Color(0xFF1B2E1B)),
      (const Color(0xFFC62828), const Color(0xFFFFD54F), const Color(0xFF2E0D0D)),
      (const Color(0xFF00838F), const Color(0xFFFFD54F), const Color(0xFF0D1B1B)),
      (const Color(0xFFFFFFFF), const Color(0xFF424242), const Color(0xFF000000)),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Color Presets', style: TextStyle(color: Colors.white70, fontSize: 12)),
        const SizedBox(height: 8),
        Row(
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
                    gradient: LinearGradient(colors: [preset.$1, preset.$2]),
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.white24),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

// =============================================================================
// MATHEMATICAL CORE - Based on the research paper
// =============================================================================

/// Mathematical functions from the Zahri paper
class ZahriPatternMath {
  /// Come-back mapping for even n (Formula 15)
  /// e(k,n) = (1/2)(4k/n + 1)
  static double e(int k, int n) {
    assert(n > 0 && n.isEven, 'n must be positive and even');
    return 0.5 * (4 * k / n + 1);
  }

  /// Come-back mapping for odd n (Formula 16)
  /// o(k,n) = (1/2)((4k-1)/n + 1)
  static double o(int k, int n) {
    assert(n > 0 && n.isOdd, 'n must be positive and odd');
    return 0.5 * ((4 * k - 1) / n + 1);
  }

  /// Generate the up-down sequence x_a(n) on the unit circle (Formula 1)
  /// x_a(0) = α
  /// x_a(n) = x_a(n-1) + aπ if n is odd
  /// x_a(n) = x_a(n-1) - (1-a)π if n is even
  static List<double> generateSequence(double a, int steps, {double alpha = 0}) {
    final sequence = <double>[alpha];
    for (var i = 1; i <= steps; i++) {
      final prev = sequence[i - 1];
      if (i.isOdd) {
        sequence.add(prev + a * math.pi);
      } else {
        sequence.add(prev - (1 - a) * math.pi);
      }
    }
    return sequence;
  }

  /// Convert sequence angles to Cartesian coordinates on unit circle
  static List<Offset> sequenceToPoints(List<double> sequence, Offset center, double radius) {
    return sequence.map((angle) {
      return Offset(
        center.dx + radius * math.cos(angle),
        center.dy + radius * math.sin(angle),
      );
    }).toList();
  }

  /// Calculate the range number n_r (maximal index in the range)
  /// This is the number of unique points before repetition starts
  static int calculateRangeNumber(double a, int maxIterations) {
    final sequence = generateSequence(a, maxIterations);
    final seen = <double>{};
    const epsilon = 1e-9;

    for (var i = 0; i < sequence.length; i++) {
      // Normalize angle to [0, 2π)
      var normalizedAngle = sequence[i] % (2 * math.pi);
      if (normalizedAngle < 0) normalizedAngle += 2 * math.pi;

      // Check if we've seen this angle (with tolerance)
      bool found = false;
      for (final seenAngle in seen) {
        if ((normalizedAngle - seenAngle).abs() < epsilon ||
            (normalizedAngle - seenAngle - 2 * math.pi).abs() < epsilon) {
          found = true;
          break;
        }
      }

      if (found && i > 0) {
        return i - 1;
      }
      seen.add(normalizedAngle);
    }
    return maxIterations;
  }
}

// =============================================================================
// PATTERN PAINTERS
// =============================================================================

/// Single Cell Pattern (Section 4.1 of paper)
/// For even n, creates symmetric patterns
class ZahriSingleCellPainter extends CustomPainter {
  final int k;
  final int n;
  final int tilesX;
  final int tilesY;
  final double initialAngle;
  final double lineWidth;
  final bool fillShapes;
  final bool showCircle;
  final Color primaryColor;
  final Color secondaryColor;
  final Color backgroundColor;

  ZahriSingleCellPainter({
    required this.k,
    required this.n,
    required this.tilesX,
    required this.tilesY,
    required this.initialAngle,
    required this.lineWidth,
    required this.fillShapes,
    required this.showCircle,
    required this.primaryColor,
    required this.secondaryColor,
    required this.backgroundColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Calculate a from e(k, n)
    final a = ZahriPatternMath.e(k, n);

    // Calculate cell size based on tiles
    final cellWidth = size.width / tilesX;
    final cellHeight = size.height / tilesY;
    final cellSize = math.min(cellWidth, cellHeight);
    final radius = cellSize * 0.45;

    // Offset to center the grid
    final offsetX = (size.width - tilesX * cellSize) / 2;
    final offsetY = (size.height - tilesY * cellSize) / 2;

    // Generate the sequence
    final alpha = initialAngle * math.pi / 180;
    final sequence = ZahriPatternMath.generateSequence(a, n, alpha: alpha);

    // Draw each cell in the grid
    for (var ty = 0; ty < tilesY; ty++) {
      for (var tx = 0; tx < tilesX; tx++) {
        final center = Offset(
          offsetX + tx * cellSize + cellSize / 2,
          offsetY + ty * cellSize + cellSize / 2,
        );
        _drawSingleCell(canvas, center, radius, sequence);
      }
    }
  }

  void _drawSingleCell(Canvas canvas, Offset center, double radius, List<double> sequence) {
    final points = ZahriPatternMath.sequenceToPoints(sequence, center, radius);

    if (showCircle) {
      // Draw the unit circle
      canvas.drawCircle(
        center,
        radius,
        Paint()
          ..color = primaryColor.withValues(alpha: 0.2)
          ..style = PaintingStyle.stroke
          ..strokeWidth = lineWidth * 0.5,
      );
    }

    // Create path from sequence points
    if (points.length >= 2) {
      final path = Path()..moveTo(points[0].dx, points[0].dy);
      for (var i = 1; i < points.length; i++) {
        path.lineTo(points[i].dx, points[i].dy);
      }
      path.close();

      // Fill the shape
      if (fillShapes) {
        canvas.drawPath(
          path,
          Paint()..color = secondaryColor.withValues(alpha: 0.3),
        );
      }

      // Draw the outline
      canvas.drawPath(
        path,
        Paint()
          ..color = primaryColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = lineWidth
          ..strokeCap = StrokeCap.round
          ..strokeJoin = StrokeJoin.round,
      );

      // Draw vertices
      for (var i = 0; i < points.length; i++) {
        canvas.drawCircle(
          points[i],
          lineWidth * 1.2,
          Paint()..color = secondaryColor,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant ZahriSingleCellPainter oldDelegate) => true;
}

/// Composite Cell Pattern (Section 4.2 of paper)
/// For odd n, combines 4 cells with different initial angles
class ZahriCompositeCellPainter extends CustomPainter {
  final int k;
  final int n;
  final int tilesX;
  final int tilesY;
  final double initialAngle;
  final double lineWidth;
  final bool fillShapes;
  final bool showCircle;
  final Color primaryColor;
  final Color secondaryColor;
  final Color backgroundColor;

  ZahriCompositeCellPainter({
    required this.k,
    required this.n,
    required this.tilesX,
    required this.tilesY,
    required this.initialAngle,
    required this.lineWidth,
    required this.fillShapes,
    required this.showCircle,
    required this.primaryColor,
    required this.secondaryColor,
    required this.backgroundColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Calculate a from o(k, n) for odd n
    final a = ZahriPatternMath.o(k, n);

    // For composite cells, we need 2x2 tiles minimum
    final compositeWidth = size.width / tilesX;
    final compositeHeight = size.height / tilesY;
    final compositeSize = math.min(compositeWidth, compositeHeight);
    final cellSize = compositeSize / 2;
    final radius = cellSize * 0.45;

    final offsetX = (size.width - tilesX * compositeSize) / 2;
    final offsetY = (size.height - tilesY * compositeSize) / 2;

    // The four initial angles for composite cells (from paper: π/4, 3π/4, 5π/4, 7π/4)
    final alphas = [
      math.pi / 4 + initialAngle * math.pi / 180,
      3 * math.pi / 4 + initialAngle * math.pi / 180,
      5 * math.pi / 4 + initialAngle * math.pi / 180,
      7 * math.pi / 4 + initialAngle * math.pi / 180,
    ];

    // Draw composite cells in grid
    for (var ty = 0; ty < tilesY; ty++) {
      for (var tx = 0; tx < tilesX; tx++) {
        final compositeCenter = Offset(
          offsetX + tx * compositeSize + compositeSize / 2,
          offsetY + ty * compositeSize + compositeSize / 2,
        );

        // Draw 4 sub-cells with different initial angles
        final positions = [
          Offset(compositeCenter.dx - cellSize / 2, compositeCenter.dy - cellSize / 2), // top-left
          Offset(compositeCenter.dx + cellSize / 2, compositeCenter.dy - cellSize / 2), // top-right
          Offset(compositeCenter.dx - cellSize / 2, compositeCenter.dy + cellSize / 2), // bottom-left
          Offset(compositeCenter.dx + cellSize / 2, compositeCenter.dy + cellSize / 2), // bottom-right
        ];

        for (var i = 0; i < 4; i++) {
          final sequence = ZahriPatternMath.generateSequence(a, n, alpha: alphas[i]);
          _drawCell(canvas, positions[i], radius, sequence, i);
        }
      }
    }
  }

  void _drawCell(Canvas canvas, Offset center, double radius, List<double> sequence, int quadrant) {
    final points = ZahriPatternMath.sequenceToPoints(sequence, center, radius);

    if (showCircle) {
      canvas.drawCircle(
        center,
        radius,
        Paint()
          ..color = primaryColor.withValues(alpha: 0.15)
          ..style = PaintingStyle.stroke
          ..strokeWidth = lineWidth * 0.3,
      );
    }

    if (points.length >= 2) {
      final path = Path()..moveTo(points[0].dx, points[0].dy);
      for (var i = 1; i < points.length; i++) {
        path.lineTo(points[i].dx, points[i].dy);
      }
      path.close();

      if (fillShapes) {
        canvas.drawPath(
          path,
          Paint()..color = secondaryColor.withValues(alpha: 0.25),
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
    }
  }

  @override
  bool shouldRepaint(covariant ZahriCompositeCellPainter oldDelegate) => true;
}

/// Circular Composite Pattern (Section 4.3 of paper)
/// Central cell surrounded by H cells arranged in a circle
class ZahriCircularCompositePainter extends CustomPainter {
  final int k0;
  final int n0;
  final int k1;
  final int n1;
  final int surroundingCells;
  final int tilesX;
  final int tilesY;
  final double initialAngle;
  final double lineWidth;
  final bool fillShapes;
  final bool showCircle;
  final Color primaryColor;
  final Color secondaryColor;
  final Color backgroundColor;

  ZahriCircularCompositePainter({
    required this.k0,
    required this.n0,
    required this.k1,
    required this.n1,
    required this.surroundingCells,
    required this.tilesX,
    required this.tilesY,
    required this.initialAngle,
    required this.lineWidth,
    required this.fillShapes,
    required this.showCircle,
    required this.primaryColor,
    required this.secondaryColor,
    required this.backgroundColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final a0 = ZahriPatternMath.e(k0, n0);
    final a1 = ZahriPatternMath.e(k1, n1);

    // Calculate composite unit size
    final unitWidth = size.width / tilesX;
    final unitHeight = size.height / tilesY;
    final unitSize = math.min(unitWidth, unitHeight);

    final offsetX = (size.width - tilesX * unitSize) / 2;
    final offsetY = (size.height - tilesY * unitSize) / 2;

    // Radii for center and surrounding cells
    final centerRadius = unitSize * 0.18;
    final surroundRadius = unitSize * 0.12;
    final orbitRadius = unitSize * 0.32;

    // Draw each composite unit
    for (var ty = 0; ty < tilesY; ty++) {
      for (var tx = 0; tx < tilesX; tx++) {
        final unitCenter = Offset(
          offsetX + tx * unitSize + unitSize / 2,
          offsetY + ty * unitSize + unitSize / 2,
        );

        // Draw center cell
        final alpha = initialAngle * math.pi / 180;
        final centerSequence = ZahriPatternMath.generateSequence(a0, n0, alpha: alpha);
        _drawCell(canvas, unitCenter, centerRadius, centerSequence, primaryColor, true);

        // Draw surrounding cells
        for (var i = 0; i < surroundingCells; i++) {
          final angle = i * 2 * math.pi / surroundingCells;
          final surroundCenter = Offset(
            unitCenter.dx + orbitRadius * math.cos(angle),
            unitCenter.dy + orbitRadius * math.sin(angle),
          );

          final surroundSequence = ZahriPatternMath.generateSequence(a1, n1, alpha: alpha);
          _drawCell(canvas, surroundCenter, surroundRadius, surroundSequence, secondaryColor, false);
        }
      }
    }
  }

  void _drawCell(
    Canvas canvas,
    Offset center,
    double radius,
    List<double> sequence,
    Color color,
    bool isCenter,
  ) {
    final points = ZahriPatternMath.sequenceToPoints(sequence, center, radius);

    if (showCircle) {
      canvas.drawCircle(
        center,
        radius,
        Paint()
          ..color = color.withValues(alpha: 0.2)
          ..style = PaintingStyle.stroke
          ..strokeWidth = lineWidth * 0.3,
      );
    }

    if (points.length >= 2) {
      final path = Path()..moveTo(points[0].dx, points[0].dy);
      for (var i = 1; i < points.length; i++) {
        path.lineTo(points[i].dx, points[i].dy);
      }
      path.close();

      if (fillShapes) {
        canvas.drawPath(
          path,
          Paint()..color = color.withValues(alpha: isCenter ? 0.4 : 0.25),
        );
      }

      canvas.drawPath(
        path,
        Paint()
          ..color = isCenter ? primaryColor : secondaryColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = lineWidth * (isCenter ? 1.0 : 0.7)
          ..strokeCap = StrokeCap.round
          ..strokeJoin = StrokeJoin.round,
      );
    }
  }

  @override
  bool shouldRepaint(covariant ZahriCircularCompositePainter oldDelegate) => true;
}

/// Overlapping Cells Pattern (Section 4.4 of paper)
/// Multiple concentric cells with different parameters
class ZahriOverlappingCellsPainter extends CustomPainter {
  final List<(int, int)> params; // List of (k, n) pairs for each layer
  final int tilesX;
  final int tilesY;
  final double initialAngle;
  final double lineWidth;
  final bool fillShapes;
  final bool showCircle;
  final Color primaryColor;
  final Color secondaryColor;
  final Color backgroundColor;

  ZahriOverlappingCellsPainter({
    required this.params,
    required this.tilesX,
    required this.tilesY,
    required this.initialAngle,
    required this.lineWidth,
    required this.fillShapes,
    required this.showCircle,
    required this.primaryColor,
    required this.secondaryColor,
    required this.backgroundColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final cellWidth = size.width / tilesX;
    final cellHeight = size.height / tilesY;
    final cellSize = math.min(cellWidth, cellHeight);
    final maxRadius = cellSize * 0.45;

    final offsetX = (size.width - tilesX * cellSize) / 2;
    final offsetY = (size.height - tilesY * cellSize) / 2;

    final alpha = initialAngle * math.pi / 180;

    // Generate all sequences
    final sequences = <List<double>>[];
    for (final param in params) {
      final a = ZahriPatternMath.e(param.$1, param.$2);
      sequences.add(ZahriPatternMath.generateSequence(a, param.$2, alpha: alpha));
    }

    // Draw each cell in the grid
    for (var ty = 0; ty < tilesY; ty++) {
      for (var tx = 0; tx < tilesX; tx++) {
        final center = Offset(
          offsetX + tx * cellSize + cellSize / 2,
          offsetY + ty * cellSize + cellSize / 2,
        );

        // Draw layers from outermost to innermost
        for (var layer = 0; layer < sequences.length; layer++) {
          final layerRadius = maxRadius * (1 - layer * 0.2);
          final sequence = sequences[layer];

          // Alternate colors between layers
          final color = layer.isEven ? primaryColor : secondaryColor;
          _drawLayer(canvas, center, layerRadius, sequence, color, layer);
        }

        if (showCircle) {
          // Draw outer circle
          canvas.drawCircle(
            center,
            maxRadius,
            Paint()
              ..color = primaryColor.withValues(alpha: 0.3)
              ..style = PaintingStyle.stroke
              ..strokeWidth = lineWidth * 0.5,
          );
        }
      }
    }
  }

  void _drawLayer(
    Canvas canvas,
    Offset center,
    double radius,
    List<double> sequence,
    Color color,
    int layerIndex,
  ) {
    final points = ZahriPatternMath.sequenceToPoints(sequence, center, radius);

    if (points.length >= 2) {
      final path = Path()..moveTo(points[0].dx, points[0].dy);
      for (var i = 1; i < points.length; i++) {
        path.lineTo(points[i].dx, points[i].dy);
      }
      path.close();

      if (fillShapes) {
        canvas.drawPath(
          path,
          Paint()..color = color.withValues(alpha: 0.2 - layerIndex * 0.03),
        );
      }

      canvas.drawPath(
        path,
        Paint()
          ..color = color
          ..style = PaintingStyle.stroke
          ..strokeWidth = lineWidth * (1 - layerIndex * 0.1)
          ..strokeCap = StrokeCap.round
          ..strokeJoin = StrokeJoin.round,
      );
    }
  }

  @override
  bool shouldRepaint(covariant ZahriOverlappingCellsPainter oldDelegate) => true;
}
