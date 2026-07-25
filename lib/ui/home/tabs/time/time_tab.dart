import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami/ui/home/tabs/time/widgets/azkar_item.dart';
import 'package:islami/ui/home/tabs/time/widgets/pray_time_item.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_fonts.dart';
import 'package:islami/utils/app_style.dart';

class TimeTab extends StatelessWidget {
  const TimeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width * 0.05),
        child: Column(
          spacing: context.height * 0.025,
          crossAxisAlignment: .start,
          children: [
            Container(
              width: .infinity,
              height: context.height * 0.37,
              clipBehavior: .antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                image: DecorationImage(
                  image: AssetImage(AppAssets.bgPrayTime),
                  fit: .fill,
                ),
              ),
              child: Column(
                crossAxisAlignment: .stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: context.width * 0.05,
                      right: context.width * 0.05,
                      top: context.height * 0.01,
                      bottom: context.height * 0.035,
                    ),
                    child: Stack(
                      alignment: .center,
                      children: [
                        Align(
                          alignment: .centerLeft,
                          child: Text(
                            '16 Jul,\n2024',
                            style: AppFonts.white16BoldCairo,
                          ),
                        ),
                        Column(
                          spacing: 5,
                          children: [
                            Text(
                              'Pray Time',
                              style: AppFonts.black20BoldCairo.copyWith(
                                color: AppColors.blackColor.withAlpha(0x99),
                              ),
                            ),
                            Text('Tuesday', style: AppFonts.black20BoldCairo),
                          ],
                        ),
                        Align(
                          alignment: .centerRight,
                          child: Text(
                            '09 Muh,\n1446',
                            style: AppFonts.white16BoldCairo,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: CarouselSlider(
                      options: CarouselOptions(
                        enlargeCenterPage: true,
                        viewportFraction: 0.36,
                      ),
                      items: List.generate(5, (index) => index).map((index) {
                        return PrayTimeItem(index: index);
                      }).toList(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: context.height * 0.008,
                      horizontal: context.width * 0.07,
                    ),
                    child: Stack(
                      alignment: .center,
                      children: [
                        Row(
                          mainAxisAlignment: .center,
                          children: [
                            Text(
                              'Next Pray ',
                              style: AppFonts.black16BoldCairo.copyWith(
                                color: AppColors.blackColor.withAlpha(0x99),
                              ),
                            ),
                            Text('- 02:32', style: AppFonts.black16BoldCairo),
                          ],
                        ),
                        Align(
                          alignment: .centerRight,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.volume_off,
                              color: AppColors.blackColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Text('Azkar', style: AppFonts.white15BoldNaskhArabic),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: context.width * 0.05,
                mainAxisSpacing: context.height * 0.024,
                mainAxisExtent: context.height * 0.28,
              ),
              itemBuilder: (context, index) {
                return AzkarItem(index: index);
              },
              itemCount: AzkarItem.azkar.length,
            ),
            SizedBox(height: context.height * 0.005),
          ],
        ),
      ),
    );
  }
}
