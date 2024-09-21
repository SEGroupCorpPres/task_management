import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/core/constants.dart';

class PlusButton extends StatelessWidget {
  const PlusButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
        child: Icon(
          CupertinoIcons.plus,
          size: 40.sp,
          weight: 30.sp,
          color: Colors.white,
        ),
      ),
    );
  }
}
