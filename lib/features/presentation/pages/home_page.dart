import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_management/core/constants.dart';
import 'package:task_management/features/data/local/models/category.dart';
import 'package:task_management/features/data/local/models/status.dart';
import 'package:task_management/features/data/local/models/task.dart';
import 'package:task_management/features/data/local/models/task_form_model.dart';
import 'package:task_management/features/presentation/bloc/task/task_bloc.dart';
import 'package:task_management/features/presentation/pages/home_screen.dart';
import 'package:task_management/features/presentation/pages/task_screen.dart';
import 'package:task_management/features/presentation/widgets/plus_button.dart';
import 'package:task_management/features/presentation/widgets/task_form_field.dart';
import 'package:task_management/generated/assets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final FocusNode _titleFocusNode = FocusNode();
  final FocusNode _descFocusNode = FocusNode();
  final FocusNode _addressFocusNode = FocusNode();
  final FocusNode _dateFocusNode = FocusNode();
  DateTime? _selectedDate;
  final int _categoryLength = Category.values.length;
  int _selectedChoice = 0;

  int _selectedIndex = 0;
  bool _isOpenAddTaskScreen = false;
  final List<Widget> _screens = [
    const HomeScreen(),
    const TaskScreen(),
  ];

  void _openAddTaskScreen() {
    setState(() {
      _isOpenAddTaskScreen = !_isOpenAddTaskScreen;
      if (_isOpenAddTaskScreen) {
        Future.delayed(const Duration(milliseconds: 200), () {
          _titleFocusNode.requestFocus();
        });
      } else {
        _titleController.clear();
        _descController.clear();
        _addressController.clear();
        _selectedDate = null;
        _titleFocusNode.unfocus();
        _descFocusNode.unfocus();
        _addressFocusNode.unfocus();
        _dateFocusNode.unfocus();
      }
    });
  }

  String _getSelectedChoice(int index) {
    switch (index) {
      case 1:
        return Category.work.name;
      case 2:
        return Category.meeting.name;
      case 3:
        return Category.shopping.name;
      case 4:
        return Category.party.name;
      case 5:
        return Category.study.name;
      default:
        return Category.personal.name;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // WidgetsBinding.instance.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_titleFocusNode);
    });
  }

  void _onTapNavItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  bool _isFocus() {
    if (_titleFocusNode.hasFocus || _descFocusNode.hasFocus || _addressFocusNode.hasFocus || _dateFocusNode.hasFocus) {
      return true;
    }
    return false;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _titleController.dispose();
    _titleFocusNode.dispose();
    _descController.dispose();
    _descFocusNode.dispose();
    _addressController.dispose();
    _addressFocusNode.dispose();
    _dateController.dispose();
    _dateFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.read<TaskBloc>().add(LoadTasks());
    final Size size = MediaQuery.sizeOf(context);
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, result) {
        if (_isFocus()) {
          return;
        } else {
          _isOpenAddTaskScreen = false;
        }
        //
      },
      child: Stack(
        children: [
          Scaffold(
            key: _scaffoldKey,
            // extendBody: true,
            body: _screens[_selectedIndex],
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: PlusButton(onTap: _openAddTaskScreen),
            bottomNavigationBar: BottomNavigationBar(

              currentIndex: _selectedIndex,
              onTap: (index) => _onTapNavItem(index),
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    _selectedIndex == 0 ? Assets.iconsHome : Assets.iconsInactiveHome,
                  ),
                  label: 'Home',
                ),
                const BottomNavigationBarItem(icon: Icon(Icons.grid_view_outlined), label: 'Task'),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: AnimatedCrossFade(
              firstChild: Container(
                width: size.width,
              ),
              secondChild: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: size.height * .97,
                    width: size.width,
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.elliptical(size.width, 45.h),
                      ),
                      color: Colors.white,
                    ),
                    height: size.height * .97 - 20.h,
                    width: size.width,
                    padding: EdgeInsets.only(top: 25.h),
                    child: Column(
                      children: [
                        Text(
                          'Add New Task',
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 15.sp),
                        ),
                        Form(
                          key: _formKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Material(
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                                  child: TaskFormField(
                                    taskFormModel: TaskFormModel(
                                      onTapOutside: (event) {
                                        _titleFocusNode.unfocus();
                                      },
                                      fieldController: _titleController,
                                      hint: 'Task title',
                                      fieldFocusNode: _titleFocusNode,
                                      errorText: 'Title don\'t empty',
                                      validator: (String? value) {
                                        // Title don\'t empty
                                        if (value == null || value.isEmpty) {
                                          return 'Enter a title';
                                        }

                                        return null; // If title don't empty
                                      },
                                    ),
                                  ),
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: List.generate(
                                      (_categoryLength),
                                      (index) => Container(
                                        margin: EdgeInsets.only(left: index == 0 ? 20.w : 0, right: index == _categoryLength - 1 ? 20.w : 5.w),
                                        child: ChipTheme(
                                          data: ChipThemeData(shape: RoundedRectangleBorder(side: const BorderSide(color: Colors.transparent), borderRadius: BorderRadius.circular(5.r))),
                                          child: ChoiceChip(
                                            onSelected: (value) {
                                              setState(() {
                                                _selectedChoice = index;
                                              });
                                            },
                                            selected: _selectedChoice == index,
                                            avatar: _selectedChoice != index
                                                ? CircleAvatar(
                                                    radius: 5.r,
                                                    backgroundColor: _selectedChoice != index ? AppColors().getTaskColor(category: Category.values[index].name) : Colors.white,
                                                  )
                                                : null,
                                            checkmarkColor: AppColors().getTaskColor(category: Category.values[index].name),
                                            selectedColor: AppColors().getTaskColor(category: Category.values[index].name),
                                            showCheckmark: false,
                                            label: Text(
                                              Category.values[index].name,
                                              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                                    color: _selectedChoice == index ? Colors.white : Colors.grey,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const Divider(),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                                  child: TaskFormField(
                                    taskFormModel: TaskFormModel(
                                      onTapOutside: (event) {
                                        _descFocusNode.unfocus();
                                      },
                                      fieldController: _descController,
                                      hint: 'Task description',
                                      fieldFocusNode: _descFocusNode,
                                      errorText: 'Description don\'t empty',
                                      validator: (String? value) {
                                        return null; // If title don't empty
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                                  child: TaskFormField(
                                    taskFormModel: TaskFormModel(
                                      fieldController: _addressController,
                                      hint: 'Task address',
                                      onTapOutside: (event) {
                                        _addressFocusNode.unfocus();
                                      },
                                      fieldFocusNode: _addressFocusNode,
                                      errorText: 'Address don\'t empty',
                                      validator: (String? value) {
                                        return null; // If title don't empty
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                                  child: DateTimeFormField(
                                    initialValue: null,
                                    validator: (DateTime? value) {
                                      // Date don\'t null
                                      if (value == null) {
                                        return 'Enter a date';
                                      }
                                      return null; // If date don't null
                                    },
                                    onChanged: (DateTime? date) {
                                      setState(() {
                                        _selectedDate = date;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // SizedBox(height: 10.h),
                        TextButton(
                          style: Theme.of(context).textButtonTheme.style!.copyWith(
                                padding: WidgetStatePropertyAll<EdgeInsets>(
                                  EdgeInsets.symmetric(
                                    horizontal: 20.w,
                                    vertical: 10.h,
                                  ),
                                ),
                              ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              final id = DateTime.now().microsecondsSinceEpoch;
                              Task task = Task(
                                id: id,
                                title: _titleController.text,
                                description: _descController.text,
                                date: _selectedDate!.millisecondsSinceEpoch,
                                address: _addressController.text,
                                status: Status.inProgress.name,
                                category: _getSelectedChoice(_selectedChoice!),
                                isNotify: 0,
                              );

                              context.read<TaskBloc>().add(AddTask(task: task));
                              _openAddTaskScreen();
                            }
                          },
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
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0.h,
                    child: Material(
                      color: Colors.transparent,
                      child: PlusButton(
                        onTap: _openAddTaskScreen,
                        icon: Assets.iconsXmark,
                      ),
                    ),
                  )
                ],
              ),
              crossFadeState: !_isOpenAddTaskScreen ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 300),
            ),
          ),
        ],
      ),
    );
  }
}
