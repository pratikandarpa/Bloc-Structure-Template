import 'package:bloc_structure_template/common/constants/color_constants.dart';
import 'package:bloc_structure_template/common/enums/font_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme extends StatefulWidget {
  final Widget? child;

  const AppTheme({Key? key, @required this.child}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return AppThemeState();
  }

  static AppThemeState of(BuildContext context) {
    final _InheritedStateContainer? inheritedStateContainer = context.dependOnInheritedWidgetOfExactType();
    if (inheritedStateContainer == null) {
      return AppThemeState();
    } else {
      return inheritedStateContainer.data!;
    }
  }
}

class AppThemeState extends State<AppTheme> {
  TextStyle customTextStyle({double fontSize = 12, Color? color, FWT? fontWeightType, FFT? fontFamilyType, double? height, TextDecoration? decoration, FontStyle? fontStyle}) {
    return TextStyle(
        decoration: decoration,
        fontWeight: FontType.getFontWeightType(fontWeightType),
        fontFamily: FontType.getFontFamilyType(fontFamilyType),
        fontSize: (fontSize).sp,
        fontStyle: fontStyle,
        height: 1.5,
        color: color);
  }

  static TextStyle myTextStyle({double fontSize = 12, Color? color, FWT? fontWeightType, FFT? fontFamilyType, TextDecoration? decoration, FontStyle? fontStyle}) {
    return TextStyle(
        decoration: decoration,
        fontWeight: FontType.getFontWeightType(fontWeightType),
        fontFamily: FontType.getFontFamilyType(fontFamilyType),
        fontSize: (fontSize).sp,
        fontStyle: fontStyle,
        color: color);
  }

  BoxShadow commonBoxShadow() {
    return const BoxShadow(
      color: Color(0x0c000000),
      blurRadius: 20,
      offset: Offset(0, 0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedStateContainer(
      data: this,
      child: widget.child,
    );
  }

  InputDecoration chatInputDecoration(Color fillColor) => InputDecoration(
        filled: false,
        fillColor: fillColor,
        counter: null,
        contentPadding: EdgeInsets.zero,
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        // focusedBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
      );

  TextStyle textStyleLight(Color color, {double fontSize = 12, TextDecoration? decoration}) {
    return TextStyle(decoration: decoration, fontWeight: FontType.getFontWeightType(FWT.light), fontFamily: FontType.getFontFamilyType(FFT.roboto), fontSize: fontSize.sp, color: color);
  }

  TextStyle textStyleMedium(Color color, {double fontSize = 12, TextDecoration? decoration}) {
    return TextStyle(decoration: decoration, fontWeight: FontType.getFontWeightType(FWT.medium), fontFamily: FontType.getFontFamilyType(FFT.roboto), fontSize: fontSize.sp, color: color);
  }

  TextStyle textStyleSemiBold(Color color, {double fontSize = 12, TextDecoration? decoration}) {
    return TextStyle(decoration: decoration, fontWeight: FontType.getFontWeightType(FWT.semiBold), fontFamily: FontType.getFontFamilyType(FFT.roboto), fontSize: fontSize.sp, color: color);
  }

  TextStyle textStyleBold(Color color, {double fontSize = 12, TextDecoration? decoration}) {
    return TextStyle(decoration: decoration, fontWeight: FontType.getFontWeightType(FWT.bold), fontFamily: FontType.getFontFamilyType(FFT.roboto), fontSize: fontSize.sp, color: color);
  }

  TextStyle textStyleRegular(Color color, {double fontSize = 12, TextDecoration? decoration}) {
    return TextStyle(decoration: decoration, fontWeight: FontType.getFontWeightType(FWT.regular), fontFamily: FontType.getFontFamilyType(FFT.roboto), fontSize: fontSize.sp, color: color);
  }

  commonDivider() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 1,
      color: ColorConstants.borderColor,
    );
  }

  commonVerticalDivider(double height) {
    return Container(
      width: 1,
      height: height,
      color: ColorConstants.borderColor,
    );
  }

  commonBorder() {
    return Border.all(
      color: ColorConstants.borderColor,
      width: 1,
    );
  }

  errorStyle(double size) {
    return AppThemeState().customTextStyle(fontSize: size.sp, fontFamilyType: FFT.roboto, color: ColorConstants.errorColor, fontWeightType: FWT.regular);
  }

  static UnderlineInputBorder enableBorderStyle() {
    return UnderlineInputBorder(
      borderRadius: BorderRadius.circular(5.0.r),
      borderSide: BorderSide(color: ColorConstants.borderColor, width: 1.w),
    );
  }

  static UnderlineInputBorder disabledBorderStyle() {
    return UnderlineInputBorder(
      borderRadius: BorderRadius.circular(5.0.r),
      borderSide: BorderSide(
        color: ColorConstants.borderColor,
        width: 1.w,
      ),
    );
  }

  static UnderlineInputBorder focusBorderStyle() {
    return UnderlineInputBorder(
        borderRadius: BorderRadius.circular(5.0.r),
        borderSide: BorderSide(
          color: ColorConstants.primaryColor,
          width: 1.w,
        ));
  }

  static UnderlineInputBorder borderStyle() {
    return UnderlineInputBorder(
      borderRadius: BorderRadius.circular(5.0.r),
      borderSide: BorderSide(
        color: ColorConstants.borderColor,
        width: 1.w,
      ),
    );
  }

  static UnderlineInputBorder errorBorderStyle() {
    return UnderlineInputBorder(
      borderRadius: BorderRadius.circular(5.0.r),
      borderSide: BorderSide(
        color: ColorConstants.errorColor,
        width: 1.w,
      ),
    );
  }

/*onGetBackButton() {
    return InkWell(
      onTap: () {
        Get.back();
        // scaffoldKey.currentState!.openDrawer();
      },
      child: Padding(
        padding:
            const EdgeInsets.only(left: 15, right: 15, top: 16, bottom: 16),
        child: SvgPicture.asset(
          SVGPath.backIcon,
          color: ColorConstants.whiteColor,
        ),
      ),
    );
  }*/
}

class _InheritedStateContainer extends InheritedWidget {
  final AppThemeState? data;

  _InheritedStateContainer({
    Key? key,
    @required this.data,
    @required Widget? child,
  })  : assert(child != null),
        super(key: key, child: child!);

  @override
  bool updateShouldNotify(_InheritedStateContainer old) => true;
}
