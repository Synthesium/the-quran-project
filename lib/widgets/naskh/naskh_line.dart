import 'package:flutter/material.dart';

class NaskhLine extends StatelessWidget {
  final int pageNumber;
  final int lineNumber;
  final double height;

  const NaskhLine({
    super.key,
    required this.pageNumber,
    required this.lineNumber,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: Image.asset(
        'assets/naskh_app_extract/pages/$pageNumber/$lineNumber.png',
        fit: BoxFit.contain,
        filterQuality: FilterQuality.high,
        errorBuilder: (context, error, stackTrace) {
          // Return empty container for missing/empty lines
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
