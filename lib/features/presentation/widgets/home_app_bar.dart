import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:task_management/features/data/local/models/task.dart';
import 'package:task_management/generated/assets.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
    required this.size,
    this.isBlank = true,
    this.task,
  });

  final Size size;
  final bool? isBlank;
  final Task? task;

  @override
  Widget build(BuildContext context) {
    String? formattedTime;
    if (task != null) {
      DateFormat timeFormat = DateFormat.jm('en_US');
      formattedTime = timeFormat.format((DateTime.fromMillisecondsSinceEpoch(task!.date)));
    }

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
        !isBlank!
            ? Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: SafeArea(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    width: size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Colors.white.withOpacity(.6),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  formattedTime!,
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                SizedBox(width: 15.w),
                                Text(
                                  task!.title,
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ],
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              task!.address,
                              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                  ),
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              task!.description,
                              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: Colors.white,
                                    fontSize: 15.sp,
                                  ),
                            ),
                            SizedBox(height: 15.h),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const Icon(
                              CupertinoIcons.xmark,
                              color: Colors.white,
                            ),
                            SvgPicture.asset(
                              Assets.iconsBell,
                              width: 80.w,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}
