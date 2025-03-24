import 'package:flutter/material.dart';
import 'package:getxstructure/utils/app_colors.dart';
import 'package:getxstructure/utils/text_style.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Size size;
  final String titleText;

  const CustomAppBar({super.key, required this.size, required this.titleText});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      centerTitle: true,
      backgroundColor: AppColors.primaryColor,
      elevation: 0,
      title: Text(
        titleText,
        style: textStyleW700(
          size.width * 0.052,
          AppColors.white,
          isMetropolis: true,
        ),
      ),
    );
  }
}
