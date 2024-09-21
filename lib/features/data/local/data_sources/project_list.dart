import 'package:task_management/core/constants.dart';
import 'package:task_management/features/data/local/models/project_model.dart';
import 'package:task_management/generated/assets.dart';

class ProjectListData {

  List<ProjectModel> projectList = [
    ProjectModel(
      title: 'Personal',
      qty: 0,
      icon: Assets.iconsUser,
      iconColor: AppColors.tegPersonalBg,
      bg: AppColors.tegPersonalBg.withOpacity(.2),
      onTap: () {},
    ),
    ProjectModel(
      title: 'Work',
      qty: 0,
      icon: Assets.iconsBriefcase,
      iconColor: AppColors.tegWorkBg,
      bg: AppColors.tegWorkBg.withOpacity(.2),
      onTap: () {},
    ),
    ProjectModel(
      title: 'Meeting',
      qty: 0,
      icon: Assets.iconsPresentation,
      iconColor: AppColors.tegMeetingBg,
      bg: AppColors.tegMeetingBg.withOpacity(.2),
      onTap: () {},
    ),
    ProjectModel(
      title: 'Shopping',
      qty: 0,
      icon: Assets.iconsShoppingBasket,
      iconColor: AppColors.tegShoppingBg,
      bg: AppColors.tegShoppingBg.withOpacity(.2),
      onTap: () {},
    ),
    ProjectModel(
      title: 'Party',
      qty: 0,
      icon: Assets.iconsConfetti,
      iconColor: AppColors.tegPartyBg,
      bg: AppColors.tegPartyBg.withOpacity(.2),
      onTap: () {},
    ),
    ProjectModel(
      title: 'Study',
      qty: 0,
      icon: Assets.iconsMolecule,
      iconColor: AppColors.tegStudyBg,
      bg: AppColors.tegStudyBg.withOpacity(.2),
      onTap: () {},
    ),
  ];
}
