import 'package:bloc_structure_template/common/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CommonShimmer extends StatelessWidget {
  final Widget childWidget;
  final bool isStart;

  const CommonShimmer({Key? key, required this.childWidget, this.isStart = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: ColorConstants.colorShimmerColor,
        highlightColor: ColorConstants.whiteColor,
        child: childWidget
    );
  }
}
