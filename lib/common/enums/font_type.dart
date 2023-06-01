import 'dart:ui';

enum FFT { roboto, cabin, barlow }

enum FWT { light, regular, medium, semiBold, bold, extraBold }

class FontType {
  static getFontFamilyType(FFT? fontFamilyType) {
    switch (fontFamilyType) {
      case FFT.roboto:
        return "Roboto";
      case FFT.cabin:
        return "Cabin";
      case FFT.barlow:
        return "Barlow";
      default:
        return "Roboto";
    }
  }

  static FontWeight getFontWeightType(FWT? fontWeightType) {
    switch (fontWeightType) {
      case FWT.light:
        return FontWeight.w300;
      case FWT.regular:
        return FontWeight.w400;
      case FWT.medium:
        return FontWeight.w500;
      case FWT.semiBold:
        return FontWeight.w600;
      case FWT.bold:
        return FontWeight.w700;
      case FWT.extraBold:
        return FontWeight.w800;
      default:
        return FontWeight.normal;
    }
  }
}
