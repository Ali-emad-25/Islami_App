import 'package:flutter/material.dart';
import 'package:islami/model/quran_resources.dart';
import 'package:islami/provider/most_recent_provider.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_fonts.dart';
import 'package:islami/utils/app_routes.dart';
import 'package:islami/utils/app_style.dart';
import 'package:provider/provider.dart';

class MostRecentWidget extends StatefulWidget {
  const MostRecentWidget({super.key});

  @override
  State<MostRecentWidget> createState() => _MostRecentWidgetState();
}

class _MostRecentWidgetState extends State<MostRecentWidget> {
  late MostRecentProvider provider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPersistentFrameCallback(
      (timeStamp) => provider.readMostRecent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<MostRecentProvider>(context);
    return Visibility(
      visible: provider.mostRecentList.isNotEmpty,
      child: Padding(
        padding: EdgeInsets.only(
          left: context.width * 0.05,
          bottom: context.height * 0.02,
        ),
        child: Column(
          spacing: context.height * 0.01,
          crossAxisAlignment: .start,
          children: [
            Text('Most Recently', style: AppFonts.white15BoldNaskhArabic),
            SizedBox(
              height: context.height * 0.18,
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        AppRoutes.quranDetailsRouteName,
                        arguments: provider.mostRecentList[index],
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                        right: context.width * 0.02,
                        left: context.width * 0.05,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: .start,
                            mainAxisAlignment: .spaceEvenly,
                            children: [
                              Text(
                                QuranResources.englishQuranSuraList[provider
                                    .mostRecentList[index]],
                                style: AppFonts.black24BoldCairo,
                              ),
                              Text(
                                QuranResources.arabicQuranSuraList[provider
                                    .mostRecentList[index]],
                                style: AppFonts.black24BoldCairo,
                              ),
                              Text(
                                '${QuranResources.ayaNumberList[provider.mostRecentList[index]]} Verses',
                                style: AppFonts.black14BoldCairo,
                              ),
                            ],
                          ),
                          Image.asset(AppAssets.bgImageMostRecently),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(width: context.width * .025);
                },
                itemCount: provider.mostRecentList.length,
                scrollDirection: .horizontal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
