import 'package:flutter/material.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_fonts.dart';
import 'package:islami/utils/app_style.dart';

class AyaWidget extends StatelessWidget {
  String ayaText;
  int ayaNumber;

  AyaWidget({required this.ayaText, required this.ayaNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: context.width * 0.05),
      padding: EdgeInsets.symmetric(
        vertical: context.height * 0.017,
        horizontal: context.width * 0.03,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.mainColor, width: 1),
      ),
      child: Text(
        '$ayaText [${ayaNumber + 1}]',
        style: AppFonts.gold25BoldNaskhArabic,
        textAlign: .center,
        textDirection: .rtl,
      ),
    );
  }
}
