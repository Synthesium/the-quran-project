import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../db/database.dart';

/// Generates unique Islamic geometric patterns for each surah
/// based on its characteristics (ayah count, revelation order, makki/madani)
class SurahPattern extends StatelessWidget {
  final SurahData surah;
  final double size;
  final Color? primaryColor;
  final Color? secondaryColor;
  final Color? backgroundColor;

  const SurahPattern({
    super.key,
    required this.surah,
    this.size = 300,
    this.primaryColor,
    this.secondaryColor,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final colors = _generateColorPalette(context);

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor ?? colors.background,
        borderRadius: BorderRadius.circular(size * 0.05),
      ),
      child: CustomPaint(
        size: Size(size, size),
        painter: _SurahPatternPainter(
          surah: surah,
          primary: primaryColor ?? colors.primary,
          secondary: secondaryColor ?? colors.secondary,
          accent: colors.accent,
        ),
      ),
    );
  }

  _PatternColors _generateColorPalette(BuildContext context) {
    // Generate unique hue based on surah number using golden ratio
    final baseHue = (surah.surahNumber * 137.508) % 360;

    // Makki surahs get warmer tones, Madani get cooler
    final isMakki = surah.revelationPlace?.toLowerCase() == 'makkah';
    final hueShift = isMakki ? 0 : 180;
    final hue = (baseHue + hueShift) % 360;

    // Saturation based on revelation order (earlier = more saturated)
    final saturation = 0.3 + (0.4 * (1 - (surah.revelationOrder ?? 57) / 114));

    // Lightness variation based on ayah count
    final lightness = 0.35 + (0.15 * (surah.totalVerses / 286));

    final primary = HSLColor.fromAHSL(1.0, hue, saturation + 0.2, lightness);
    final secondary = HSLColor.fromAHSL(1.0, (hue + 30) % 360, saturation, lightness + 0.1);
    final accent = HSLColor.fromAHSL(1.0, (hue + 60) % 360, saturation + 0.1, lightness + 0.2);
    final background = HSLColor.fromAHSL(1.0, hue, 0.08, 0.12);

    return _PatternColors(
      primary: primary.toColor(),
      secondary: secondary.toColor(),
      accent: accent.toColor(),
      background: background.toColor(),
    );
  }
}

class _PatternColors {
  final Color primary;
  final Color secondary;
  final Color accent;
  final Color background;

  _PatternColors({
    required this.primary,
    required this.secondary,
    required this.accent,
    required this.background,
  });
}

class _SurahPatternPainter extends CustomPainter {
  final SurahData surah;
  final Color primary;
  final Color secondary;
  final Color accent;

  _SurahPatternPainter({
    required this.surah,
    required this.primary,
    required this.secondary,
    required this.accent,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final maxRadius = size.width / 2 * 0.9;

    // Determine pattern complexity based on surah properties
    final starPoints = _calculateStarPoints();
    final layers = _calculateLayers();
    final rotationOffset = (surah.surahNumber * 3.0) % 360;

    // Draw from outer to inner for proper layering
    _drawOuterBorder(canvas, center, maxRadius, rotationOffset);
    _drawInterlockingRings(canvas, center, maxRadius * 0.85, layers, rotationOffset);
    _drawMiddleRosette(canvas, center, maxRadius * 0.6, starPoints, rotationOffset);
    _drawInnerStar(canvas, center, maxRadius * 0.35, starPoints, rotationOffset);
    _drawCenterMedallion(canvas, center, maxRadius * 0.18, rotationOffset);
  }

  int _calculateStarPoints() {
    // Star points: 5-12 based on ayah count modulo
    // Preference for Islamic numbers: 6, 8, 10, 12
    final mod = surah.totalVerses % 8;
    final points = [6, 8, 10, 12, 6, 8, 10, 12][mod];
    return points;
  }

  int _calculateLayers() {
    // More ayahs = more layers (2-5)
    if (surah.totalVerses <= 20) return 2;
    if (surah.totalVerses <= 50) return 3;
    if (surah.totalVerses <= 100) return 4;
    return 5;
  }

  void _drawOuterBorder(Canvas canvas, Offset center, double radius, double rotation) {
    final paint = Paint()
      ..color = primary.withValues(alpha: 0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = radius * 0.02;

    // Outer circle
    canvas.drawCircle(center, radius, paint);

    // Decorative scalloped border
    final scallops = 24 + (surah.surahNumber % 12);
    final scallopRadius = radius * 0.04;

    for (var i = 0; i < scallops; i++) {
      final angle = (i * 360 / scallops + rotation) * math.pi / 180;
      final x = center.dx + radius * math.cos(angle);
      final y = center.dy + radius * math.sin(angle);

      canvas.drawCircle(
        Offset(x, y),
        scallopRadius,
        Paint()..color = secondary.withValues(alpha: 0.4),
      );
    }
  }

  void _drawInterlockingRings(
    Canvas canvas,
    Offset center,
    double radius,
    int layers,
    double rotation,
  ) {
    for (var layer = 0; layer < layers; layer++) {
      final layerRadius = radius * (1 - layer * 0.15);
      final ringCount = 6 + layer * 2;
      final ringRadius = layerRadius * 0.12;

      final layerRotation = rotation + (layer * 15);

      for (var i = 0; i < ringCount; i++) {
        final angle = (i * 360 / ringCount + layerRotation) * math.pi / 180;
        final x = center.dx + layerRadius * math.cos(angle);
        final y = center.dy + layerRadius * math.sin(angle);

        // Draw interlocking circular motif
        _drawCircularMotif(
          canvas,
          Offset(x, y),
          ringRadius,
          layer.isEven ? primary : secondary,
          6,
          angle * 180 / math.pi,
        );
      }
    }
  }

  void _drawCircularMotif(
    Canvas canvas,
    Offset center,
    double radius,
    Color color,
    int petals,
    double rotation,
  ) {
    final paint = Paint()
      ..color = color.withValues(alpha: 0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = radius * 0.15;

    // Draw overlapping circles creating a flower pattern
    for (var i = 0; i < petals; i++) {
      final angle = (i * 360 / petals + rotation) * math.pi / 180;
      final petalCenter = Offset(
        center.dx + radius * 0.5 * math.cos(angle),
        center.dy + radius * 0.5 * math.sin(angle),
      );
      canvas.drawCircle(petalCenter, radius * 0.6, paint);
    }

    // Center dot
    canvas.drawCircle(
      center,
      radius * 0.15,
      Paint()..color = color.withValues(alpha: 0.7),
    );
  }

  void _drawMiddleRosette(
    Canvas canvas,
    Offset center,
    double radius,
    int points,
    double rotation,
  ) {
    // Draw multiple overlapping star polygons for rosette effect
    for (var layer = 0; layer < 3; layer++) {
      final layerRadius = radius * (1 - layer * 0.2);
      final layerRotation = rotation + layer * (180 / points);
      final color = layer == 0 ? primary : (layer == 1 ? secondary : accent);

      _drawStarPolygon(
        canvas,
        center,
        layerRadius,
        points,
        layerRotation,
        color.withValues(alpha: 0.4 - layer * 0.1),
        filled: layer == 0,
      );
    }

    // Add radiating lines
    _drawRadiatingLines(canvas, center, radius * 1.1, radius * 0.4, points * 2, rotation);
  }

  void _drawStarPolygon(
    Canvas canvas,
    Offset center,
    double radius,
    int points,
    double rotation,
    Color color, {
    bool filled = true,
  }) {
    final innerRadius = radius * 0.45;
    final path = Path();

    for (var i = 0; i < points * 2; i++) {
      final angle = (i * 180 / points + rotation - 90) * math.pi / 180;
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
        ..style = filled ? PaintingStyle.fill : PaintingStyle.stroke
        ..strokeWidth = radius * 0.03,
    );
  }

  void _drawRadiatingLines(
    Canvas canvas,
    Offset center,
    double outerRadius,
    double innerRadius,
    int count,
    double rotation,
  ) {
    final paint = Paint()
      ..color = accent.withValues(alpha: 0.25)
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    for (var i = 0; i < count; i++) {
      final angle = (i * 360 / count + rotation) * math.pi / 180;
      final innerX = center.dx + innerRadius * math.cos(angle);
      final innerY = center.dy + innerRadius * math.sin(angle);
      final outerX = center.dx + outerRadius * math.cos(angle);
      final outerY = center.dy + outerRadius * math.sin(angle);

      canvas.drawLine(Offset(innerX, innerY), Offset(outerX, outerY), paint);
    }
  }

  void _drawInnerStar(
    Canvas canvas,
    Offset center,
    double radius,
    int points,
    double rotation,
  ) {
    // Main inner star
    _drawStarPolygon(
      canvas,
      center,
      radius,
      points,
      rotation + 180 / points / 2,
      primary.withValues(alpha: 0.7),
      filled: true,
    );

    // Outline
    _drawStarPolygon(
      canvas,
      center,
      radius * 1.05,
      points,
      rotation + 180 / points / 2,
      secondary.withValues(alpha: 0.5),
      filled: false,
    );

    // Inner decorative ring
    final ringPaint = Paint()
      ..color = accent.withValues(alpha: 0.4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = radius * 0.05;

    canvas.drawCircle(center, radius * 0.6, ringPaint);
  }

  void _drawCenterMedallion(Canvas canvas, Offset center, double radius, double rotation) {
    // Solid background circle
    canvas.drawCircle(
      center,
      radius,
      Paint()..color = primary.withValues(alpha: 0.8),
    );

    // Decorative ring
    canvas.drawCircle(
      center,
      radius * 0.85,
      Paint()
        ..color = secondary.withValues(alpha: 0.6)
        ..style = PaintingStyle.stroke
        ..strokeWidth = radius * 0.08,
    );

    // Inner glow
    final gradient = RadialGradient(
      colors: [
        accent.withValues(alpha: 0.6),
        accent.withValues(alpha: 0.0),
      ],
    );

    canvas.drawCircle(
      center,
      radius * 0.6,
      Paint()..shader = gradient.createShader(Rect.fromCircle(center: center, radius: radius * 0.6)),
    );

    // Center dot
    canvas.drawCircle(
      center,
      radius * 0.15,
      Paint()..color = Colors.white.withValues(alpha: 0.8),
    );
  }

  @override
  bool shouldRepaint(_SurahPatternPainter oldDelegate) {
    return oldDelegate.surah.surahNumber != surah.surahNumber ||
        oldDelegate.primary != primary ||
        oldDelegate.secondary != secondary;
  }
}
