import 'package:flutter/material.dart';
import 'package:islami/model/pray.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_fonts.dart';
import 'package:islami/utils/app_style.dart';

class PrayTimeItem extends StatelessWidget {
  int index;
  PrayTimeItem({super.key, required this.index});

  List<Pray> pray = [
    Pray(prayName: 'Fajr', prayTime: '04:29', amOrPm: 'AM'),
    Pray(prayName: 'Sunrise', prayTime: '06:12', amOrPm: 'AM'),
    Pray(prayName: 'Dhuhr', prayTime: '01:06', amOrPm: 'PM'),
    Pray(prayName: 'Asr', prayTime: '04:46', amOrPm: 'PM'),
    Pray(prayName: 'Maghrib', prayTime: '08:00', amOrPm: 'PM'),
    Pray(prayName: 'Isha', prayTime: '9:31', amOrPm: 'PM'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: .infinity,
      padding: EdgeInsets.symmetric(vertical: context.height * 0.01),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.blackColor, AppColors.mainColor],
        ),
      ),
      child: Column(
        mainAxisAlignment: .spaceEvenly,
        children: [
          Text(pray[index].prayName, style: AppFonts.white15BoldNaskhArabic,),
          Text(pray[index].prayTime, style: AppFonts.white36BoldCairo,),
          Text(pray[index].amOrPm, style: AppFonts.white15BoldNaskhArabic),
        ],
      ),
    );
  }
}
