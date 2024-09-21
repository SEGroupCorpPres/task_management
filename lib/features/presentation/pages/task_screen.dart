import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/features/data/local/data_sources/project_list.dart';
import 'package:task_management/features/data/local/models/project_model.dart';
import 'package:task_management/features/presentation/widgets/project_widget.dart';
import 'package:task_management/features/presentation/widgets/home_app_bar.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final List<ProjectModel> _projectList = ProjectListData().projectList;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeAppBar(
          size: size,
          isBlank: false,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0).r,
          child: Text(
            'Projects',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 15.sp,
                ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SizedBox(
            width: size.width,
            height: size.height - kBottomNavigationBarHeight.h - (true ? 271.h : 160.h),
            child: SingleChildScrollView(
              child: Wrap(
                alignment: WrapAlignment.spaceEvenly,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 10.w,
                runSpacing: 10.h,
                children: _projectList
                    .map(
                      (item) => ProjectWidget(size: size, project: item,),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
