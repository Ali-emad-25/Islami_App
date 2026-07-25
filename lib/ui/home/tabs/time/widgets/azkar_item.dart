import 'package:flutter/material.dart';
import 'package:islami/model/azkar.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_fonts.dart';
import 'package:islami/utils/app_style.dart';

class AzkarItem extends StatelessWidget {
  int index;

  AzkarItem({super.key, required this.index});

  static List<Azkar> azkar = [
    Azkar(title: 'Evening Azkar', image: AppAssets.eveningAzkar),
    Azkar(title: 'Morning Azkar', image: AppAssets.morningAzkar),
    Azkar(title: 'Walking Azkar', image: AppAssets.walkingAzkar),
    Azkar(title: 'Sleeping Azkar', image: AppAssets.sleepingAzkar),
  ];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(top: context.height * 0.02),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.mainColor, width: 2),
        ),
        child: Column(
          spacing: context.height * 0.005,
          children: [
            Image.asset(azkar[index].image),
            Text(azkar[index].title, style: AppFonts.white20BoldCairo),
          ],
        ),
      ),
    );
  }
}
