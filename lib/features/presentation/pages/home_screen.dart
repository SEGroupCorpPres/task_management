import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:task_management/core/constants.dart';
import 'package:task_management/features/data/local/data_sources/task_list.dart';
import 'package:task_management/features/data/local/models/category.dart';
import 'package:task_management/features/data/local/models/status.dart';
import 'package:task_management/features/data/local/models/task_model.dart';
import 'package:task_management/features/presentation/widgets/blank_screen.dart';
import 'package:task_management/features/presentation/widgets/home_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<TaskModel> _taskList = TaskListData().taskList;
  bool _isOnTap = false;

  void _onTap(){
    setState(() {
      _isOnTap = !_isOnTap;
    });
  }

  Color _getTaskColor({required TaskModel task}) {
    switch (task.category) {
      case Category.work:
        // TODO: Handle this case.
        return AppColors.tegWorkBg;
      case Category.meeting:
        // TODO: Handle this case.
        return AppColors.tegMeetingBg;
      case Category.shopping:
        // TODO: Handle this case.
        return AppColors.tegShoppingBg;
      case Category.party:
        // TODO: Handle this case.
        return AppColors.tegPartyBg;
      case Category.study:
        // TODO: Handle this case.
        return AppColors.tegStudyBg;
      default:
        // TODO: Handle this case.
        return AppColors.tegPersonalBg;
    }
  }

  Widget _getStatusIcon({required TaskModel task}) {
    switch (task.status) {
      case Status.completed:
        // TODO: Handle this case.
        return Icon(
          CupertinoIcons.check_mark_circled_solid,
          color: CupertinoColors.activeGreen,
          size: 30.sp,
        );
      case Status.canceled:
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
    initializeDateFormatting('en_US', null);
    return Column(
      children: [
        HomeAppBar(
          size: size,
          isBlank: _taskList.isEmpty ? true : false,
          task: _taskList[0],
        ),
        _taskList.isEmpty
            ? const BlankScreen()
            : Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                height: size.height - kBottomNavigationBarHeight.h - 220.h,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _taskList.length,
                  itemBuilder: (context, index) {
                    TaskModel task = _taskList[index];
                    DateTime date = task.date;
                    String formattedDate = DateFormat(
                      'd MMMM yyyy, HH:mm',
                    ).format(date);
                    DateFormat timeFormat = DateFormat.jm('en_US');
                    String formattedTime = timeFormat.format(date);
                    return InkWell(
                      splashColor: Colors.transparent,
                      onTap: _onTap,
                      child: AnimatedContainer(
                        margin: EdgeInsets.symmetric(vertical: 5.h),
                        duration: const Duration(milliseconds: 300),
                        height: _isOnTap ? 100.h : 45.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.r),
                          boxShadow: [
                            BoxShadow(
                              color: _getTaskColor(task: task).withOpacity(.2),
                              blurRadius: 7,
                              offset: const Offset(0, 7),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              width: 5.w,
                              height:  _isOnTap ? 100.h : 45.h,
                              decoration: BoxDecoration(
                                color: _getTaskColor(task: task),
                                borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(5.r),
                                ),
                              ),
                              child: const Column(),
                            ),
                            SizedBox(width: 5.w),
                            _getStatusIcon(task: task),
                            SizedBox(width: 10.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      formattedTime,
                                      style: Theme.of(context).textTheme.titleSmall,
                                    ),
                                    SizedBox(width: 15.w),
                                    Text(
                                      task.title,
                                      style: Theme.of(context).textTheme.titleMedium,
                                    ),
                                  ],
                                ),
                                Text(
                                  task.address,
                                  style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 15.sp),
                                ),
                                _isOnTap ?  Text(
                                  task.description,
                                  style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 13.sp, color: Colors.black45
                                  ),
                                ) : SizedBox(),
                              ],
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                CupertinoIcons.bell_fill,
                                color: CupertinoColors.systemYellow,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
        // GroupedListView<dynamic, String>(
        //   elements: _elements,
        //   groupBy: (element) => element['group'],
        //   groupSeparatorBuilder: (String groupByValue) => Text(groupByValue),
        //   itemBuilder: (context, dynamic element) => Text(element['name']),
        //   itemComparator: (item1, item2) => item1['name'].compareTo(item2['name']), // optional
        //   useStickyGroupSeparators: true, // optional
        //   floatingHeader: true, // optional
        //   order: GroupedListOrder.ASC, // optional
        //   footer: Text("Widget at the bottom of list"), // optional
        // ),
      ],
    );
  }
}
