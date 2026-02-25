import 'package:flutter/material.dart';

/// A simple widget to render Japanese text with furigana (ruby text)
/// Parses text in the format: 漢字[かんじ]
class FuriganaTextWidget extends StatelessWidget {
  final String text;
  final TextStyle? baseStyle;
  final TextStyle? furiganaStyle;

  const FuriganaTextWidget({
    super.key,
    required this.text,
    this.baseStyle,
    this.furiganaStyle,
  });

  @override
  Widget build(BuildContext context) {
    final segments = _parseText(text);

    return SelectionArea(
      child: Wrap(
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.end,
        spacing: 0,
        runSpacing: 8,
        children: segments.map((segment) {
          if (segment.furigana != null) {
            return _buildRubyText(context, segment.text, segment.furigana!);
          } else {
            return Text(
              segment.text,
              style: baseStyle ?? const TextStyle(fontSize: 18),
            );
          }
        }).toList(),
      ),
    );
  }

  Widget _buildRubyText(BuildContext context, String text, String furigana) {
    final effectiveBaseStyle = baseStyle ?? const TextStyle(fontSize: 18);
    final effectiveFuriganaStyle = furiganaStyle ??
        TextStyle(
          fontSize: (effectiveBaseStyle.fontSize ?? 18) * 0.5,
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SelectionContainer.disabled(
          child: Text(
            furigana,
            style: effectiveFuriganaStyle,
          ),
        ),
        Text(
          text,
          style: effectiveBaseStyle,
        ),
      ],
    );
  }

  /// Parse text with furigana in format: 漢字[かんじ]
  /// Only kanji characters (CJK) immediately before brackets get furigana
  List<_TextSegment> _parseText(String input) {
    final segments = <_TextSegment>[];

    // Regex to match: (optional non-kanji text)(kanji)[furigana]
    // Kanji range: \u4E00-\u9FFF (CJK Unified Ideographs)
    // Also include: \u3400-\u4DBF (CJK Extension A) and \uF900-\uFAFF (CJK Compatibility)
    final regex = RegExp(
      r'([\u4E00-\u9FFF\u3400-\u4DBF\uF900-\uFAFF]+)\[([^\]]+)\]',
    );

    int lastEnd = 0;

    for (final match in regex.allMatches(input)) {
      // Add any text before this match as plain text
      if (match.start > lastEnd) {
        final plainText = input.substring(lastEnd, match.start);
        if (plainText.isNotEmpty) {
          segments.add(_TextSegment(plainText, null));
        }
      }

      // Add the kanji with furigana
      final kanji = match.group(1)!;
      final furigana = match.group(2)!;
      segments.add(_TextSegment(kanji, furigana));

      lastEnd = match.end;
    }

    // Add any remaining text after the last match
    if (lastEnd < input.length) {
      final remainingText = input.substring(lastEnd);
      if (remainingText.isNotEmpty) {
        segments.add(_TextSegment(remainingText, null));
      }
    }

    return segments;
  }
}

class _TextSegment {
  final String text;
  final String? furigana;

  _TextSegment(this.text, this.furigana);
}
