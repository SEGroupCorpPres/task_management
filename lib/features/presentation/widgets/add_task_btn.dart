import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/core/constants.dart';
import 'package:task_management/features/presentation/bloc/task/task_bloc.dart';

class AddTaskBtn extends StatelessWidget {
   const AddTaskBtn({super.key, required this.onPressed});

final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: Theme.of(context).textButtonTheme.style!.copyWith(
        padding: WidgetStatePropertyAll<EdgeInsets>(
          EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 10.h,
          ),
        ),
      ),
      onPressed: onPressed,
      child: Container(
        height: 40.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          gradient: const LinearGradient(
            end: Alignment.centerRight,
            begin: Alignment.centerLeft,
            colors: [AppColors.addBtnLinearGradientStart, AppColors.addBtnLinearGradientEnd],
          ),
        ),
        child: const Text(
          'Add Task',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
