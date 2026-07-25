import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_fonts.dart';
import 'package:islami/utils/app_style.dart';

class HadethItem extends StatefulWidget {
  int index;

  HadethItem({required this.index});

  @override
  State<HadethItem> createState() => _HadethItemState();
}

class _HadethItemState extends State<HadethItem> {
  String title = '';
  String content = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadHadethFile(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    return content.isEmpty
        ? Center(child: CircularProgressIndicator(color: AppColors.mainColor))
        : Container(
            padding: EdgeInsets.only(top: context.height * 0.015),
            margin: EdgeInsets.only(bottom: context.height * 0.015),
            decoration: BoxDecoration(
              color: AppColors.mainColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
                Image.asset(
                  AppAssets.bgHadeth,
                  height: .infinity,
                  width: .infinity,
                  fit: .fill,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: context.width * 0.05,
                    right: context.width * 0.05,
                    top: context.height * 0.035,
                    bottom: context.height * 0.09,
                  ),
                  child: Column(
                    spacing: context.height * 0.025,
                    children: [
                      Text(
                        title,
                        style: AppFonts.black24BoldCairo.copyWith(fontSize: 23),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Text(
                            content,
                            style: AppFonts.black20BoldNaskhArabic.copyWith(
                              height: context.height * 0.0025,
                            ),
                            textDirection: .rtl,
                            textAlign: .center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }

  void loadHadethFile(int index) async {
    String fileContent = await rootBundle.loadString(
      'assets/files/Hadeth/h$index.txt',
    );
    title = fileContent.substring(0, fileContent.indexOf('\n'));
    content = fileContent.substring(fileContent.indexOf('\n') + 1);
    await Future.delayed(Duration(seconds: 1), () => setState(() {}));
  }
}
