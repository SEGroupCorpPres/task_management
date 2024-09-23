import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_management/app/app.dart';
import 'package:task_management/app/presentation/app/app_bloc.dart';
import 'package:task_management/core/constants.dart';
import 'package:task_management/features/presentation/pages/home_page.dart';
import 'package:task_management/generated/assets.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});
  static Page page() => Platform.isIOS
      ? const CupertinoPage(
    child: IntroScreen(),
  )
      : const MaterialPage(
    child: IntroScreen(),
  );

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Flexible(child: SizedBox()),
          Flexible(
            flex: 2,
            child: SizedBox(
              width: size.width,
              height: 300.h,
              child: SvgPicture.asset(
                Assets.assetsImagesLogo,
                fit: BoxFit.none,
              ),
            ),
          ),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Reminders made simple',
                  style: Theme.of(context).textTheme.titleMedium,
                )
              ],
            ),
          ),
          Flexible(
            child: TextButton(
              style: Theme.of(context).textButtonTheme.style,
              onPressed: () => context.read<AppBloc>().add(NavigateToHomePage()),
    // Navigator.pushAndRemoveUntil(
    //             context,
    //             Platform.isIOS
    //                 ? CupertinoPageRoute(builder: (_) => HomePage())
    //                 : MaterialPageRoute(
    //                     builder: (_) => HomePage(),
    //                   ),
    //             (value) => false,
    //           ),
              child: Container(
                width: 200.w,
                height: 40.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  gradient: const LinearGradient(
                    end: Alignment.centerRight,
                    begin: Alignment.centerLeft,
                    colors: [AppColors.btnLinearGradientStart, AppColors.btnLinearGradientEnd],
                  ),
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
