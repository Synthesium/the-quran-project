import 'package:flutter/material.dart';

/// A widget displaying the ayah (verse) number using the AlQuran font's
/// built-in decorative ayah markers (PUA characters U+F500-U+F69A)
class AyahMarker extends StatelessWidget {
  final int verseNumber;
  final double size;
  final Color? color;

  const AyahMarker({
    super.key,
    required this.verseNumber,
    this.size = 32,
    this.color,
  });

  /// Get the Unicode character for the ayah number marker
  /// The AlQuran font has pre-made circular markers at U+F4FF + N
  String _getAyahMarkerChar(int number) {
    // Ayah markers are at U+F500 for 1, U+F501 for 2, etc.
    // Formula: U+F4FF + number
    final codePoint = 0xF4FF + number;
    return String.fromCharCode(codePoint);
  }

  @override
  Widget build(BuildContext context) {
    final effectiveColor = color ?? Theme.of(context).colorScheme.primary;

    return Text(
      _getAyahMarkerChar(verseNumber),
      style: TextStyle(
        fontFamily: 'AlQuran',
        fontSize: size,
        color: effectiveColor,
        height: 1.0,
      ),
    );
  }
}
