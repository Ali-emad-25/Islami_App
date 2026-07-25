import 'package:flutter/material.dart';
import 'package:islami/ui/home/tabs/radio/widgets/radio_tab_bar_btn.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_style.dart';

import 'widgets/radio_item_widget.dart';

class RadioTab extends StatefulWidget {
  RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.width * 0.05),
      child: DefaultTabController(
        length: 2,
        child: Column(
          spacing: context.height * 0.015,
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.blackColor.withAlpha(0x70),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TabBar(
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
                dividerColor: AppColors.transparent,
                indicatorColor: AppColors.transparent,
                labelPadding: .zero,
                tabs: [
                  RadioTabBarBtn(text: 'Radio', isSelected: selectedIndex == 0),
                  RadioTabBarBtn(
                    text: 'Reciters',
                    isSelected: selectedIndex == 1,
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: selectedIndex == 0
                    ? Column(
                        crossAxisAlignment: .stretch,
                        spacing: context.height * 0.015,
                        children: [
                          RadioItemWidget(title: 'Radio Ibrahim Al-Akdar'),
                          RadioItemWidget(
                            title: 'Radio Al-Qaria Yassen',
                            isPlayed: true,
                            isMuted: true,
                          ),
                          RadioItemWidget(title: 'Radio Ahmed Al-trabulsi'),
                          RadioItemWidget(
                            title: 'Radio Addokali Mohammad Alalim',
                          ),
                          SizedBox(height: context.height * 0.005),
                        ],
                      )
                    : Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
