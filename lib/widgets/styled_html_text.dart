import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';

/// Widget for rendering HTML content with proper styling
/// Used primarily for Ibn Kathir tafsir which contains HTML tags
class StyledHtmlText extends StatelessWidget {
  final String html;
  final TextStyle? baseStyle;
  final bool selectable;

  const StyledHtmlText({
    super.key,
    required this.html,
    this.baseStyle,
    this.selectable = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveBaseStyle = baseStyle ??
        GoogleFonts.ebGaramond(
          fontSize: 16,
          height: 1.6,
          color: theme.colorScheme.onSurface,
        );

    return Html(
      data: html,
      style: {
        // Base body style
        'body': Style(
          margin: Margins.zero,
          padding: HtmlPaddings.zero,
          fontFamily: effectiveBaseStyle.fontFamily,
          fontSize: FontSize(effectiveBaseStyle.fontSize ?? 16),
          lineHeight: LineHeight(effectiveBaseStyle.height ?? 1.6),
          color: effectiveBaseStyle.color,
        ),

        // Paragraphs
        'p': Style(
          margin: Margins.only(bottom: 12),
          fontFamily: effectiveBaseStyle.fontFamily,
          fontSize: FontSize(effectiveBaseStyle.fontSize ?? 16),
          lineHeight: LineHeight(effectiveBaseStyle.height ?? 1.6),
        ),

        // Headings (used for section titles in Ibn Kathir)
        'h2': Style(
          margin: Margins.only(top: 8, bottom: 12),
          fontFamily: effectiveBaseStyle.fontFamily,
          fontSize: FontSize((effectiveBaseStyle.fontSize ?? 16) * 1.3),
          fontWeight: FontWeight.bold,
          color: theme.colorScheme.primary,
        ),

        // Gray spans (parenthetical/clarifying content)
        'span.gray': Style(
          color: theme.colorScheme.onSurfaceVariant,
          fontStyle: FontStyle.italic,
        ),

        // Arabic text sections
        'p.ar': Style(
          direction: TextDirection.rtl,
          textAlign: TextAlign.right,
          fontFamily: 'AlQuran',
          fontSize: FontSize(20),
          lineHeight: const LineHeight(2.0),
          margin: Margins.symmetric(vertical: 8),
          color: theme.colorScheme.onSurface,
        ),

        // Div containers
        'div': Style(
          margin: Margins.zero,
          padding: HtmlPaddings.zero,
        ),
      },
      onLinkTap: (url, attributes, element) {
        // Handle link taps if needed in the future
      },
    );
  }
}
