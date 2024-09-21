import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/app/presentation/pages/intro_screen.dart';
import 'package:task_management/core/theme.dart';
import 'package:task_management/features/presentation/pages/home_page.dart';

class App extends StatelessWidget {
   App({super.key});

  // final AppTheme theme = AppTheme();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          themeMode: ThemeMode.light,
          theme: lightTheme,
          home: child,
        );
      },
      // child: IntroScreen(),
      child: HomePage(),
    );
  }
}
