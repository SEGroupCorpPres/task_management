import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/generated/assets.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
    required this.size,
    this.isBlank = true,
  });

  final Size size;
  final bool? isBlank;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: size.width,
          child: Image.asset(
            isBlank! ? Assets.imagesSmallRectangleBg : Assets.imagesBigRectangleBg,
            fit: BoxFit.fitHeight,
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Image.asset(Assets.imagesBigEllipseBg),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Image.asset(Assets.imagesSmallEllipseBg),
        ),
      ],
    );
  }
}
