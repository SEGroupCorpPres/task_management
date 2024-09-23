import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:task_management/app/presentation/app/app_bloc.dart';
import 'package:task_management/core/constants.dart';
import 'package:task_management/features/data/local/models/task.dart';
import 'package:task_management/features/presentation/bloc/task/task_bloc.dart';
import 'package:task_management/features/presentation/widgets/blank_screen.dart';

class ProjectTasksScreen extends StatefulWidget {
  const ProjectTasksScreen({super.key});

  static Page page() => Platform.isIOS
      ? const CupertinoPage(
          child: ProjectTasksScreen(),
        )
      : const MaterialPage(
          child: ProjectTasksScreen(),
        );

  @override
  State<ProjectTasksScreen> createState() => _ProjectTasksScreenState();
}

class _ProjectTasksScreenState extends State<ProjectTasksScreen> {
  final ScrollController _scrollController = ScrollController();
  List<Task> _taskList = [];
  bool _isOnTap = false;
  bool _isBlank = true;

  // Helper function to get the DateTime relative to now
  void _onTap() {
    setState(() {
      _isOnTap = !_isOnTap;
    });
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  Widget _getStatusIcon({required Task task}) {
    switch (task.status) {
      case 'completed':
        // TODO: Handle this case.
        return Icon(
          CupertinoIcons.check_mark_circled_solid,
          color: CupertinoColors.activeGreen,
          size: 30.sp,
        );
      case 'canceled':
        // TODO: Handle this case.
        return Icon(
          CupertinoIcons.xmark_circle_fill,
          color: CupertinoColors.destructiveRed,
          size: 30.sp,
        );
      default:
        return Icon(
          CupertinoIcons.circle,
          color: CupertinoColors.inactiveGray,
          size: 30.sp,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (bool didPop, result) {
            if (didPop) {
              return;
            }
            context.read<AppBloc>().add(NavigateToHomePage());
          },
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: true,
              leading: IconButton(
                onPressed: () => context.read<AppBloc>().add(NavigateToHomePage()),
                icon: Icon(Icons.adaptive.arrow_back),
              ),
              backgroundColor: AppColors().getTaskColor(category: state.category!),
              title: Text(_taskList.isEmpty ? 'Projects' : _taskList.first.category.toUpperCase()),
            ),
            body: SizedBox(
              width: size.width,
              child: SingleChildScrollView(
                child: BlocBuilder<TaskBloc, TaskState>(
                  builder: (context, state) {
                    if (state is TaskLoaded) {
                      _taskList = state.tasks;
                      return _taskList.isEmpty
                          ? const BlankScreen()
                          : Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              height: size.height,
                              child: GroupedListView<Task, DateTime>(
                                physics: const BouncingScrollPhysics(),
                                controller: _scrollController,
                                elements: _taskList,
                                shrinkWrap: true,
                                groupBy: (Task task) => DateTime(
                                  DateTime.fromMillisecondsSinceEpoch(task.date).year,
                                  DateTime.fromMillisecondsSinceEpoch(task.date).month,
                                  DateTime.fromMillisecondsSinceEpoch(task.date).day,
                                ),
                                groupHeaderBuilder: (Task task) {
                                  DateTime date = DateTime.fromMillisecondsSinceEpoch(task.date);
                                  String formattedDate = DateFormat(
                                    'd MMMM yyyy, HH:mm',
                                  ).format(date);
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 10.h,
                                    ),
                                    child: Text(
                                      formattedDate,
                                      style: Theme.of(context).textTheme.titleMedium,
                                    ),
                                  );
                                },
                                itemComparator: (Task task1, Task task2) => task1.compareTo(task2),
                                itemBuilder: (context, Task task) {
                                  DateTime date = DateTime.fromMillisecondsSinceEpoch(task.date);
                                  String formattedDate = DateFormat(
                                    'd MMMM yyyy, HH:mm',
                                  ).format(date);
                                  DateFormat timeFormat = DateFormat.jm('en_US');
                                  String formattedTime = timeFormat.format(date);
                                  return Slidable(
                                    startActionPane: ActionPane(
                                      motion: const ScrollMotion(),
                                      children: [
                                        SlidableAction(
                                          onPressed: (context) {},
                                          backgroundColor: Colors.orangeAccent,
                                          foregroundColor: Colors.white,
                                          icon: CupertinoIcons.pen,
                                          label: 'Edit',
                                        ),
                                      ],
                                    ),
                                    endActionPane: ActionPane(
                                      motion: const ScrollMotion(),
                                      children: [
                                        SlidableAction(
                                          onPressed: (context) {
                                            context.read<TaskBloc>().add(DeleteExistingTask(id: task.id));
                                            _taskList.remove(task);
                                          },
                                          backgroundColor: CupertinoColors.destructiveRed,
                                          foregroundColor: Colors.white,
                                          icon: CupertinoIcons.trash,
                                          label: 'Edit',
                                        ),
                                      ],
                                    ),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      // onTap: _onTap,
                                      child: AnimatedContainer(
                                        margin: EdgeInsets.symmetric(vertical: 5.h),
                                        duration: const Duration(milliseconds: 300),
                                        // height: _isOnTap ? 100.h : 45.h,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(5.r),
                                          boxShadow: [
                                            BoxShadow(
                                              color: AppColors().getTaskColor(category: task.category).withOpacity(.2),
                                              blurRadius: 7,
                                              offset: const Offset(0, 7),
                                            ),
                                          ],
                                        ),
                                        child: Row(
                                          children: [
                                            AnimatedContainer(
                                              duration: const Duration(milliseconds: 300),
                                              width: 5.w,
                                              height: _isOnTap ? 100.h : 45.h,
                                              decoration: BoxDecoration(
                                                color: AppColors().getTaskColor(category: task.category),
                                                borderRadius: BorderRadius.horizontal(
                                                  left: Radius.circular(5.r),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 5.w),
                                            _getStatusIcon(task: task),
                                            SizedBox(width: 10.w),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      width: 60.w,
                                                      child: Text(
                                                        formattedTime,
                                                        style: Theme.of(context).textTheme.titleSmall,
                                                      ),
                                                    ),
                                                    SizedBox(width: 15.w),
                                                    Text(
                                                        task.title.length > 18 ? task.title.replaceRange(18, null, '...') : task.title,

                                                      style: Theme.of(context).textTheme.titleMedium,
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  task.address.length > 18 ? task.address.replaceRange(18, null, '...') : task.address,

                                                  style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 15.sp),
                                                ),
                                                AnimatedCrossFade(
                                                  secondChild: Text(
                                                      task.description.length > 18 ? task.description.replaceRange(18, null, '...') : task.description,

                                                    style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 13.sp, color: Colors.black45),
                                                  ),
                                                  firstChild: Container(),
                                                  crossFadeState: _isOnTap ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                                                  duration: Duration(milliseconds: _isOnTap ? 400 : 200),
                                                )
                                              ],
                                            ),
                                            const Spacer(),
                                            IconButton(
                                              onPressed: () {
                                                int isNotify = task.isNotify == 1 ? 0 : 1;
                                                context.read<TaskBloc>().add(UpdateExistingTask(task: task.copyWith(isNotify: isNotify)));
                                              },
                                              icon: Icon(
                                                CupertinoIcons.bell_fill,
                                                color: task.isNotify == 1 ? CupertinoColors.systemYellow : Colors.grey,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                useStickyGroupSeparators: true,
                                floatingHeader: true,
                                order: GroupedListOrder.ASC,
                              ),
                            );
                    } else if (state is TaskLoading) {
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    } else if (state is TaskError) {
                      return const Center(
                        child: Text('Something is wrong'),
                      );
                    } else {
                      return const Center(
                        child: Text('Something is wrong'),
                      );
                    }
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
