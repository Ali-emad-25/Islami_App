import 'package:flutter/material.dart';
import 'package:islami/cache/shared_pres_utils.dart';
import 'package:islami/model/quran_resources.dart';
import 'package:islami/ui/home/tabs/quran/widgets/most_recent_widget.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_fonts.dart';
import 'package:islami/utils/app_routes.dart';
import 'package:islami/utils/app_style.dart';

import 'widgets/sura_widget.dart';

class QuranTab extends StatefulWidget {
  QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<int> filterList = List.generate(114, (index) => index);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: context.width * 0.05,
            right: context.width * 0.05,
            bottom: context.height * 0.02,
          ),
          child: TextField(
            cursorColor: AppColors.mainColor,
            style: AppFonts.white15BoldNaskhArabic,
            onChanged: (suraName) {
              searchBySuraName(suraName);
            },
            decoration: InputDecoration(
              prefixIcon: Image.asset(
                AppAssets.iconQuran,
                color: AppColors.mainColor,
              ),
              hintText: 'Sura Name',
              hintStyle: AppFonts.white15BoldNaskhArabic,

              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.mainColor, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),

              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.mainColor, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                MostRecentWidget(),
                Padding(
                  padding: EdgeInsets.only(
                    left: context.width * 0.05,
                    right: context.width * 0.05,
                    bottom: context.height * 0.01,
                  ),
                  child: Text(
                      'Suras List', style: AppFonts.white15BoldNaskhArabic),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.width * 0.05,
                  ),
                  child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          saveLastSuraIndex(filterList[index]);
                          Navigator.pushNamed(
                            context,
                            AppRoutes.quranDetailsRouteName,
                            arguments: filterList[index],
                          );
                        },
                        child: SuraWidget(
                          suraNameEnglish: QuranResources
                              .englishQuranSuraList[filterList[index]],
                          suraNameArabic: QuranResources
                              .arabicQuranSuraList[filterList[index]],
                          ayaNumber:
                              QuranResources.ayaNumberList[filterList[index]],
                          index: index,
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        thickness: 1,
                        color: AppColors.whiteColor,
                        height: context.height * 0.03,
                        indent: context.width * 0.07,
                        endIndent: context.width * 0.07,
                      );
                    },
                    itemCount: filterList.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void searchBySuraName(String suraName) {
    suraName = suraName.trim();

    if (suraName.isEmpty) {
      filterList = List.generate(114, (index) => index);
      setState(() {});
      return;
    }

    List<int> searchResult = [];

    for (int i = 0; i < QuranResources.englishQuranSuraList.length; i++) {
      if (QuranResources.englishQuranSuraList[i].toLowerCase().contains(
        suraName.toLowerCase(),
      )) {
        searchResult.add(i);
      }
      if (QuranResources.arabicQuranSuraList[i].toLowerCase().contains(
        suraName.toLowerCase(),
      )) {
        searchResult.add(i);
      }
    }

    filterList = searchResult;
    setState(() {});
  }
}
