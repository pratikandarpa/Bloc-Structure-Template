import 'dart:math';

import 'package:bloc_structure_template/common/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class CustomSnackBar extends StatefulWidget {
  const CustomSnackBar.success({
    Key? key,
    required this.message,
    this.onCloseClick,
    this.messagePadding = const EdgeInsets.symmetric(horizontal: 24),
    this.icon = const Icon(
      Icons.sentiment_very_satisfied,
      color: Color(0x15000000),
      size: 120,
    ),
    this.textStyle = const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: Colors.white,
    ),
    this.maxLines = 2,
    this.iconRotationAngle = 32,
    this.iconPositionTop = -10,
    this.iconPositionLeft = -8,
    this.backgroundColor = ColorConstants.green,
    this.boxShadow = kDefaultBoxShadow,
    this.borderRadius = kDefaultBorderRadius,
    this.textScaleFactor = 1.0,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  const CustomSnackBar.info({
    Key? key,
    required this.message,
    this.onCloseClick,
    this.messagePadding = const EdgeInsets.symmetric(horizontal: 24),
    this.icon = const Icon(
      Icons.sentiment_neutral,
      color: Color(0x15000000),
      size: 120,
    ),
    this.textStyle = const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: Colors.white,
    ),
    this.maxLines = 2,
    this.iconRotationAngle = 32,
    this.iconPositionTop = -10,
    this.iconPositionLeft = -8,
    this.backgroundColor = ColorConstants.borderColor,
    this.boxShadow = kDefaultBoxShadow,
    this.borderRadius = kDefaultBorderRadius,
    this.textScaleFactor = 1.0,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  const CustomSnackBar.error({
    Key? key,
    required this.message,
    this.onCloseClick,
    this.messagePadding = const EdgeInsets.symmetric(horizontal: 24),
    this.icon = const Icon(
      Icons.error_outline,
      color: Color(0x15000000),
      size: 120,
    ),
    this.textStyle = const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: Colors.white,
    ),
    this.maxLines = 2,
    this.iconRotationAngle = 32,
    this.iconPositionTop = -10,
    this.iconPositionLeft = -8,
    this.backgroundColor = ColorConstants.red,
    this.boxShadow = kDefaultBoxShadow,
    this.borderRadius = kDefaultBorderRadius,
    this.textScaleFactor = 1.0,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  final String message;
  final Widget icon;
  final Color backgroundColor;
  final TextStyle textStyle;
  final int maxLines;
  final int iconRotationAngle;
  final List<BoxShadow> boxShadow;
  final BorderRadius borderRadius;
  final double iconPositionTop;
  final double iconPositionLeft;
  final EdgeInsetsGeometry messagePadding;
  final double textScaleFactor;
  final TextAlign textAlign;
  final VoidCallback? onCloseClick;

  @override
  CustomSnackBarState createState() => CustomSnackBarState();
}

class CustomSnackBarState extends State<CustomSnackBar> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      clipBehavior: Clip.hardEdge,
      height: 70,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: widget.borderRadius,
        boxShadow: widget.boxShadow,
      ),
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                widget.message,
                style: theme.textTheme.bodyText2?.merge(widget.textStyle),
                textAlign: widget.textAlign,
                overflow: TextOverflow.ellipsis,
                maxLines: widget.maxLines,
                textScaleFactor: widget.textScaleFactor,
              ),
            ),
          ),
          GestureDetector(
            onTap: widget.onCloseClick,
            child: Container(
              height: 32,
              width: 32,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: widget.backgroundColor,
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  border: Border.all(color: Colors.white)),
              child: const Icon(
                Icons.close,
                size: 24,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const kDefaultBoxShadow = [
  BoxShadow(
    color: Colors.black26,
    offset: Offset(0, 8),
    spreadRadius: 1,
    blurRadius: 30,
  ),
];

const kDefaultBorderRadius = BorderRadius.all(Radius.circular(12));

void showSuccessSnackBar(BuildContext context, String message ) {
  AnimationController? localAnimationController;

  showTopSnackBar(
    animationDuration: const Duration(milliseconds: 1000),
    reverseAnimationDuration: const Duration(milliseconds: 350),
    displayDuration: const Duration(milliseconds: 2000),
    onAnimationControllerInit: (controller) =>
        localAnimationController = controller,
    dismissType: DismissType.onSwipe,
    dismissDirection: [
      DismissDirection.horizontal,
      DismissDirection.vertical,
      DismissDirection.endToStart,
      DismissDirection.up,
      DismissDirection.startToEnd
    ],
    Overlay.of(context),
    CustomSnackBar.success(
      onCloseClick: () {
        localAnimationController?.reverse();
      },
      message: message,
    ),
  );
}

void showErrorSnackBar(BuildContext context, String message ) {
  AnimationController? localAnimationController;

  showTopSnackBar(
    animationDuration: const Duration(milliseconds: 1000),
    reverseAnimationDuration: const Duration(milliseconds: 350),
    displayDuration: const Duration(milliseconds: 2000),
    onAnimationControllerInit: (controller) =>
        localAnimationController = controller,
    dismissType: DismissType.onSwipe,
    dismissDirection: [
      DismissDirection.horizontal,
      DismissDirection.vertical,
      DismissDirection.endToStart,
      DismissDirection.up,
      DismissDirection.startToEnd
    ],
    Overlay.of(context),
    CustomSnackBar.error(
      onCloseClick: () {
        localAnimationController?.reverse();
      },
      message: message,
    ),
  );
}
