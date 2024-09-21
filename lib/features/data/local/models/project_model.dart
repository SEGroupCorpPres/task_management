import 'dart:ui';

// 'title': 'Personal',
// 'qty': 0,
// 'icon': Assets.iconsUser,
// 'icon_color': AppColors.tegPersonalBg,
// 'bg': AppColors.tegPersonalBg.withOpacity(.36),
// 'on_tap': (){},

class ProjectModel {
  final String title;
  final int qty;
  final String icon;
  final Color iconColor;
  final Color bg;
  final VoidCallback onTap;

  ProjectModel({
    required this.title,
    required this.qty,
    required this.icon,
    required this.iconColor,
    required this.bg,
    required this.onTap,
  });
}
