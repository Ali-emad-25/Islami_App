import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami/cache/shared_pres_utils.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_fonts.dart';
import 'package:islami/utils/app_routes.dart';
import 'package:islami/utils/app_style.dart';

class IntroScreen extends StatelessWidget {
  late BuildContext context;

  IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: SafeArea(
        child: IntroductionScreen(
          globalBackgroundColor: AppColors.blackColor,

          showSkipButton: false,
          showBackButton: true,

          back: const Text(
            "Back",
            style: TextStyle(
              color: AppColors.mainColor,
              fontWeight: FontWeight.w500,
            ),
          ),

          next: const Text(
            "Next",
            style: TextStyle(
              color: AppColors.mainColor,
              fontWeight: FontWeight.w500,
            ),
          ),

          done: const Text(
            "Finish",
            style: TextStyle(
              color: AppColors.mainColor,
              fontWeight: FontWeight.w500,
            ),
          ),

          dotsDecorator: DotsDecorator(
            color: Colors.grey,
            activeColor: AppColors.mainColor,
            size: const Size(6, 6),
            activeSize: const Size(16, 6),
            spacing: EdgeInsets.symmetric(horizontal: context.width * 0.008),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),

          pages: [
            introPage(
              image: AppAssets.introImage1,
              title: 'Welcome To Islami App',
              body: '',
            ),

            introPage(
              image: AppAssets.introImage2,
              title: "Welcome To Islami",
              body: "We Are Very Excited To Have You In Our Community",
            ),

            introPage(
              image: AppAssets.introImage3,
              title: "Reading the quran",
              body: "Read, and your Lord is the Most Generous",
            ),

            introPage(
              image: AppAssets.introImage4,
              title: "Bearish",
              body: "Praise the name of your Lord, the Most High",
            ),

            introPage(
              image: AppAssets.introImage5,
              title: "Holy quran Radio",
              body:
                  "You can listen to the Holy quran Radio through the application for free and easily",
            ),
          ],

          onDone: () async {
            introSet();
            Navigator.pushReplacementNamed(context, AppRoutes.homeRouteName);
          },
        ),
      ),
    );
  }

  PageViewModel introPage({
    required String image,
    required String title,
    required String body,
  }) {
    return PageViewModel(
      titleWidget: const SizedBox(),
      bodyWidget: Column(
        children: [
          Image.asset(AppAssets.introLogo, width: context.width * 0.55),

          SizedBox(height: context.height * 0.02),

          SizedBox(
            height: context.height * 0.4,
            width: context.width * 0.8,
            child: Image.asset(image),
          ),

          SizedBox(height: context.height * 0.01),

          Text(
            title,
            textAlign: TextAlign.center,
            style: AppFonts.gold25BoldNaskhArabic,
          ),

          if (title.isNotEmpty)
            Padding(
              padding: EdgeInsets.only(top: context.height * 0.01),
              child: Text(
                body,
                textAlign: TextAlign.center,
                style: AppFonts.gold20BoldCairo.copyWith(fontSize: 17),
              ),
            ),
        ],
      ),
    );
  }
}
