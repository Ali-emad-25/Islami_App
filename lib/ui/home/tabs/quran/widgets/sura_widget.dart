import 'package:flutter/material.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_fonts.dart';
import 'package:islami/utils/app_style.dart';

class SuraWidget extends StatelessWidget {
  String suraNameArabic;
  String suraNameEnglish;
  String ayaNumber;
  int index;

  SuraWidget({
    super.key,
    required this.suraNameEnglish,
    required this.suraNameArabic,
    required this.ayaNumber,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: context.width * 0.06,
      children: [
        Stack(
          alignment: .center,
          children: [
            Image.asset(AppAssets.bgSuraName),
            Text(
              '${index + 1}',
              style: AppFonts.white14BoldCairo.copyWith(fontSize: 16),
            ),
          ],
        ),
        Column(
          spacing: context.height * 0.005,
          crossAxisAlignment: .start,
          children: [
            Text(suraNameEnglish, style: AppFonts.white20BoldCairo),
            Text('$ayaNumber Verses', style: AppFonts.white14BoldCairo),
          ],
        ),
        Spacer(),
        Text(suraNameArabic, style: AppFonts.white20BoldCairo),
      ],
    );
  }
}
