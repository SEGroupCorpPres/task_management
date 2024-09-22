import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/features/data/local/data_sources/project_list.dart';
import 'package:task_management/features/data/local/models/project_model.dart';
import 'package:task_management/features/data/local/models/task.dart';
import 'package:task_management/features/presentation/bloc/task/task_bloc.dart';
import 'package:task_management/features/presentation/widgets/home_app_bar.dart';
import 'package:task_management/features/presentation/widgets/project_widget.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<ProjectModel> _projectList = [];
  List<Task> _taskList = [];
  final List<int> _qtyList = List.generate(6, (index) => 0);
  bool _isBlank = true;
  final List<VoidCallback> _onTapList = [
    () {},
    () {},
    () {},
    () {},
    () {},
    () {},
  ];

  void _getQty(List<Task> taskList) {
    for (Task task in taskList) {
      log('get qty');
      setState(() {
        switch (task.category) {
          case 'work':
            _qtyList[1]++;
          case 'meeting':
            _qtyList[2]++;
          case 'shopping':
            _qtyList[3]++;
          case 'party':
            _qtyList[4]++;
          case 'study':
            _qtyList[5]++;
          default:
            _qtyList[0]++;
        }
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    _projectList = ProjectListData().projectList(qtyList: _qtyList, onTapList: _onTapList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeAppBar(
          size: size,
          isBlank: _isBlank,
          task: _taskList.isEmpty ? null : _taskList.first,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0).r,
          child: Text(
            'Projects',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 15.sp, color: Colors.grey),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SizedBox(
            width: size.width,
            height: size.height - kBottomNavigationBarHeight.h - (!_isBlank ? 271.h : 160.h),
            child: SingleChildScrollView(
              child: BlocListener<TaskBloc, TaskState>(
                listener: (context, state) {
                  // TODO: implement listener}
                  if (state is TaskLoaded) {
                    if (state.tasks.isNotEmpty) {
                      _taskList = state.tasks;
                      _getQty(_taskList);
                      _projectList = ProjectListData().projectList(qtyList: _qtyList, onTapList: _onTapList);
                      _isBlank = false;
                    }
                  }
                },
                child: Wrap(
                  alignment: WrapAlignment.spaceEvenly,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 10.w,
                  runSpacing: 10.h,
                  children: _projectList
                      .map(
                        (item) => ProjectWidget(
                          size: size,
                          project: item,
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
