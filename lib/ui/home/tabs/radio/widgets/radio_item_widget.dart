import 'package:flutter/material.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_fonts.dart';
import 'package:islami/utils/app_style.dart';

class RadioItemWidget extends StatelessWidget {
  String title;
  bool isPlayed;
  bool isMuted;
  RadioItemWidget({
    super.key,
    required this.title,
    this.isPlayed = false,
    this.isMuted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: context.height * 0.02),
      decoration: BoxDecoration(
        color: AppColors.mainColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        alignment: .bottomCenter,
        children: [
          isPlayed
              ? Positioned(
                  bottom: -context.height * 0.04,
                  child: Image.asset(AppAssets.bgRadioOn),
                )
              : Image.asset(AppAssets.bgRadioOff),
          Column(
            spacing: context.height * 0.025,
            children: [
              Text(title, style: AppFonts.black20BoldCairo),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  isPlayed ? Icons.pause : Icons.play_arrow_rounded,
                  size: 50,
                  color: AppColors.blackColor,
                ),
              ),
            ],
          ),
          Positioned(
            right: context.width * 0.23,
            bottom: context.height * 0.01,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                isMuted ? Icons.volume_off : Icons.volume_up,
                size: 30,
                color: AppColors.blackColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
