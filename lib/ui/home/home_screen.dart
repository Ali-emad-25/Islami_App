import 'package:flutter/material.dart';
import 'package:islami/ui/home/tabs/hadeth/hadeth_tab.dart';
import 'package:islami/ui/home/tabs/quran/quran_tab.dart';
import 'package:islami/ui/home/tabs/radio/radio_tab.dart';
import 'package:islami/ui/home/tabs/sebha/sebha_tab.dart';
import 'package:islami/ui/home/tabs/time/time_tab.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_fonts.dart';
import 'package:islami/utils/app_style.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabsList = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];
  List<String> backgroundImages = [
    AppAssets.quranBg,
    AppAssets.hadethBg,
    AppAssets.sebhaBg,
    AppAssets.radioBg,
    AppAssets.timeBg,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: AppColors.transparent, toolbarHeight: 0),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.mainColor,
        selectedItemColor: AppColors.whiteColor,
        unselectedItemColor: AppColors.blackColor,
        showUnselectedLabels: false,
        selectedLabelStyle: AppFonts.white15BoldNaskhArabic,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          builtBottomNavigationBarItem(
            icon: AppAssets.iconQuran,
            label: 'quran',
            index: 0,
          ),
          builtBottomNavigationBarItem(
            icon: AppAssets.iconHadeth,
            label: 'Hadeth',
            index: 1,
          ),
          builtBottomNavigationBarItem(
            icon: AppAssets.iconSebha,
            label: 'Sebha',
            index: 2,
          ),
          builtBottomNavigationBarItem(
            icon: AppAssets.iconRadio,
            label: 'Radio',
            index: 3,
          ),
          builtBottomNavigationBarItem(
            icon: AppAssets.iconTime,
            label: 'Time',
            index: 4,
          ),
        ],
      ),
      body: Stack(
        children: [
          Image.asset(
            backgroundImages[selectedIndex],
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
          SafeArea(
            child: Column(
              children: [
                SizedBox(height: context.height * 0.02),
                Image.asset(
                  AppAssets.logoIntroImage,
                  width: context.width * 0.65,
                ),
                Expanded(child: tabsList[selectedIndex]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem builtBottomNavigationBarItem({
    required String icon,
    required String label,
    required int index,
  }) {
    return BottomNavigationBarItem(
      icon: selectedIndex == index
          ? Container(
              margin: EdgeInsets.symmetric(vertical: context.height * 0.005),
              padding: EdgeInsets.symmetric(
                vertical: context.height * 0.007,
                horizontal: context.width * 0.05,
              ),
              decoration: BoxDecoration(
                color: AppColors.bgIcon,
                borderRadius: BorderRadius.circular(66),
              ),
              child: ImageIcon(AssetImage(icon)),
            )
          : ImageIcon(AssetImage(icon)),
      label: label,
    );
  }
}
