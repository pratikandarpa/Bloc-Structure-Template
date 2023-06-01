import 'package:bloc_structure_template/common/constants/color_constants.dart';
import 'package:bloc_structure_template/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonButton extends StatelessWidget {
  CommonButton({
    Key? key,
    this.backgroundColor,
    this.textColor,
    required this.buttonText,
    this.isBorder = true,
    this.borderColor = ColorConstants.primaryColor,
    required this.onTap,
    this.padding,
  }) : super(key: key);

  Color? backgroundColor = ColorConstants.primaryColor;
  Color? textColor = Colors.black;
  final String buttonText;
  final bool isBorder;
  final Color borderColor;
  final void Function() onTap;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10.r),
      color: backgroundColor ?? ColorConstants.primaryColor,
      elevation: 3,
      child: Ink(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: isBorder
              ? Border.all(
                  color: borderColor,
                  width: 1.0,
                )
              : const Border.fromBorderSide(BorderSide.none),
        ),
        padding: padding ??
            const EdgeInsets.all(
              10,
            ),
        child: InkWell(
          onTap: onTap,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(buttonText, textAlign: TextAlign.center, style: AppThemeState().textStyleSemiBold(textColor ?? ColorConstants.whiteColor)),
            ],
          ),
        ),
      ),
    );
  }
}
