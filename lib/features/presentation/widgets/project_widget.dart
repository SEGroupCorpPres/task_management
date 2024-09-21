import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_management/features/data/local/data_sources/project_list.dart';
import 'package:task_management/features/data/local/models/project_model.dart';
import 'package:task_management/features/presentation/widgets/home_app_bar.dart';

class ProjectWidget extends StatelessWidget {
  const ProjectWidget({
    super.key,
    required this.size, required this.project,
  });

  final Size size;
  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: project.onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15.h),
        width: size.width / 2 - 30.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.4),
              offset: const Offset(0, 5),
              blurRadius: 7,
            ),
          ],
        ),
        child: Column(
          children: [
            SizedBox(height: 10.h),
            CircleAvatar(
              backgroundColor: project.bg,
              radius: 30.r,
              child: SvgPicture.asset(project.icon),
            ),
            SizedBox(height: 5.h),
            Text(
              project.title,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 15.sp),
            ),
            SizedBox(height: 10.h),
            Text('${project.qty} Task'),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
