import 'dart:ui';

import 'package:task_management/core/constants.dart';
import 'package:task_management/features/data/local/models/project_model.dart';
import 'package:task_management/generated/assets.dart';

class ProjectListData {
  List<ProjectModel> projectList({required List<int> qtyList, required List<VoidCallback> onTapList}) => [
        ProjectModel(
          title: 'Personal',
          qty: qtyList[0],
          icon: Assets.iconsUser,
          iconColor: AppColors.tegPersonalBg,
          bg: AppColors.tegPersonalBg.withOpacity(.2),
          onTap: onTapList[0],
        ),
        ProjectModel(
          title: 'Work',
          qty: qtyList[1],
          icon: Assets.iconsBriefcase,
          iconColor: AppColors.tegWorkBg,
          bg: AppColors.tegWorkBg.withOpacity(.2),
          onTap: onTapList[1],
        ),
        ProjectModel(
          title: 'Meeting',
          qty: qtyList[2],
          icon: Assets.iconsPresentation,
          iconColor: AppColors.tegMeetingBg,
          bg: AppColors.tegMeetingBg.withOpacity(.2),
          onTap: onTapList[2],
        ),
        ProjectModel(
          title: 'Shopping',
          qty: qtyList[3],
          icon: Assets.iconsShoppingBasket,
          iconColor: AppColors.tegShoppingBg,
          bg: AppColors.tegShoppingBg.withOpacity(.2),
          onTap: onTapList[3],
        ),
        ProjectModel(
          title: 'Party',
          qty: qtyList[4],
          icon: Assets.iconsConfetti,
          iconColor: AppColors.tegPartyBg,
          bg: AppColors.tegPartyBg.withOpacity(.2),
          onTap: onTapList[4],
        ),
        ProjectModel(
          title: 'Study',
          qty: qtyList[5],
          icon: Assets.iconsMolecule,
          iconColor: AppColors.tegStudyBg,
          bg: AppColors.tegStudyBg.withOpacity(.2),
          onTap: onTapList[5],
        ),
      ];
}
