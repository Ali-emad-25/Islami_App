import 'package:flutter/material.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_fonts.dart';
import 'package:islami/utils/app_style.dart';

class RadioTabBarBtn extends StatelessWidget {
  String text;
  bool isSelected;

  RadioTabBarBtn({super.key, required this.text, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: context.height * 0.009,
      ),
      alignment: .center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: isSelected
            ? AppColors.mainColor
            : AppColors.transparent,
      ),
      child: Text(
        text,
        style: isSelected
            ? AppFonts.black15BoldNaskhArabic
            : AppFonts.white15BoldNaskhArabic,
      ),
    );
  }
}
