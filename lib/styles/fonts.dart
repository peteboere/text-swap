import 'package:google_fonts/google_fonts.dart';

class AppFonts {

  /// Default app sans-serif font.
  static const String sansSerif = 'Lato';

  /// Default app serif font.
  static const String serif = 'PT Serif';

  /// Load google font by name.
  static get(String name) {
    return GoogleFonts
      .getFont(name)
      .fontFamily;
  }

  /// Default app font family.
  static get fontFamily {
    return get(serif);
  }
}

class AppFontSizes {

  /// Heading level 1.
  static const double h1 = 30;

  static const double closeButton = 30;
}
