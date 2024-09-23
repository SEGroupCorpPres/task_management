import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management/app/presentation/app/app_bloc.dart';
import 'package:task_management/core/constants.dart';
import 'package:task_management/features/data/local/models/category.dart';
import 'package:task_management/features/data/local/models/project_model.dart';
import 'package:task_management/features/presentation/bloc/task/task_bloc.dart';
import 'package:task_management/generated/assets.dart';

class ProjectListData {
  List<ProjectModel> projectList({required List<int> qtyList, required List<VoidCallback> onTapList, required BuildContext context}) => [
        ProjectModel(
          title: 'Personal',
          qty: qtyList[0],
          icon: Assets.iconsUser,
          iconColor: AppColors.tegPersonalBg,
          bg: AppColors.tegPersonalBg.withOpacity(.2),
          onTap: () {
            context.read<AppBloc>().add(const NavigateToProjectTasksScreen(category: Category.personal));
            context.read<TaskBloc>().add(LoadTasksByCategory(category: Category.personal.name));
          },
        ),
        ProjectModel(
          title: 'Work',
          qty: qtyList[1],
          icon: Assets.iconsBriefcase,
          iconColor: AppColors.tegWorkBg,
          bg: AppColors.tegWorkBg.withOpacity(.2),
          onTap: () {
            context.read<AppBloc>().add(const NavigateToProjectTasksScreen(category: Category.work));
            context.read<TaskBloc>().add(LoadTasksByCategory(category: Category.work.name));
          },
        ),
        ProjectModel(
          title: 'Meeting',
          qty: qtyList[2],
          icon: Assets.iconsPresentation,
          iconColor: AppColors.tegMeetingBg,
          bg: AppColors.tegMeetingBg.withOpacity(.2),
          onTap: () {
            context.read<AppBloc>().add(const NavigateToProjectTasksScreen(category: Category.meeting));
            context.read<TaskBloc>().add(LoadTasksByCategory(category: Category.meeting.name));
          },
        ),
        ProjectModel(
          title: 'Shopping',
          qty: qtyList[3],
          icon: Assets.iconsShoppingBasket,
          iconColor: AppColors.tegShoppingBg,
          bg: AppColors.tegShoppingBg.withOpacity(.2),
          onTap: () {
            context.read<AppBloc>().add(const NavigateToProjectTasksScreen(category: Category.shopping));
            context.read<TaskBloc>().add(LoadTasksByCategory(category: Category.shopping.name));
          },
        ),
        ProjectModel(
          title: 'Party',
          qty: qtyList[4],
          icon: Assets.iconsConfetti,
          iconColor: AppColors.tegPartyBg,
          bg: AppColors.tegPartyBg.withOpacity(.2),
          onTap: () {
            context.read<AppBloc>().add(const NavigateToProjectTasksScreen(category: Category.party));
            context.read<TaskBloc>().add(LoadTasksByCategory(category: Category.party.name));
          },
        ),
        ProjectModel(
          title: 'Study',
          qty: qtyList[5],
          icon: Assets.iconsMolecule,
          iconColor: AppColors.tegStudyBg,
          bg: AppColors.tegStudyBg.withOpacity(.2),
          onTap: () {
            context.read<AppBloc>().add(const NavigateToProjectTasksScreen(category: Category.study));
            context.read<TaskBloc>().add(LoadTasksByCategory(category: Category.study.name));
          },
        ),
      ];
}
