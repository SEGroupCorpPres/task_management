import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_management/core/constants.dart';
import 'package:task_management/generated/assets.dart';

class PlusButton extends StatelessWidget {
  const PlusButton({
    super.key,
    required this.onTap,
    this.icon = Assets.iconsAdd,
  });

  final VoidCallback onTap;
  final String? icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 50.r,
        height: 50.r,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              blurRadius: 9,
              color: AppColors.plusBtnBgShadow,
              offset: Offset(0, 7),
            ),
          ],
          borderRadius: BorderRadius.circular(25.r),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.plusBtnBg, AppColors.plusBtnBg2],
          ),
        ),
        child: SvgPicture.asset(
          icon!,
          fit: BoxFit.none,
          colorFilter: const ColorFilter.mode(
            Colors.white,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
