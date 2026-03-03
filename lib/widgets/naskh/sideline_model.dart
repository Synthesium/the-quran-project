/// Sideline direction determines how the sideline image is positioned
/// relative to its target line.
enum SidelineDirection {
  /// Sideline extends upward from the target line (used on odd/left pages)
  up,

  /// Sideline extends downward from the target line (used on even/right pages)
  down,
}

/// Position of sidelines relative to the Quran page content
enum SidelinesPosition {
  /// Sidelines appear on the left side (for odd pages: 1, 3, 5...)
  left,

  /// Sidelines appear on the right side (for even pages: 2, 4, 6...)
  right,
}

/// Model representing a sideline image and its positioning information
class SidelineModel {
  /// The asset path to the sideline image
  final String assetPath;

  /// The line number (1-15) this sideline attaches to
  final int targetLine;

  /// The direction the sideline extends (UP or DOWN)
  final SidelineDirection direction;

  const SidelineModel({
    required this.assetPath,
    required this.targetLine,
    required this.direction,
  });
}

/// Helper class to determine page characteristics based on page number
class PageCharacteristics {
  final int pageNumber;

  const PageCharacteristics(this.pageNumber);

  /// Returns true if this is a left page (odd pages: 1, 3, 5...)
  bool get isLeftPage => pageNumber % 2 == 1;

  /// Returns true if this is a right page (even pages: 2, 4, 6...)
  bool get isRightPage => pageNumber % 2 == 0;

  /// Returns the position where sidelines should appear
  SidelinesPosition get sidelinesPosition =>
      isLeftPage ? SidelinesPosition.left : SidelinesPosition.right;

  /// Returns the default direction for sidelines on this page
  SidelineDirection get defaultSidelineDirection =>
      isLeftPage ? SidelineDirection.up : SidelineDirection.down;
}
