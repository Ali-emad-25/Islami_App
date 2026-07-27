import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/model/quran_resources.dart';
import 'package:islami/provider/most_recent_provider.dart';
import 'package:islami/ui/home/tabs/quran/widgets/aya_widget.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_fonts.dart';
import 'package:islami/utils/app_style.dart';
import 'package:provider/provider.dart';

class QuranDetailsScreen extends StatefulWidget {
  QuranDetailsScreen({super.key});

  @override
  State<QuranDetailsScreen> createState() => _QuranDetailsScreenState();
}

class _QuranDetailsScreenState extends State<QuranDetailsScreen> {
  late MostRecentProvider provider;
  bool isListView = false;
  String verses = '';
  List<String> versesList = [];

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<MostRecentProvider>(context);
    int index = ModalRoute.of(context)?.settings.arguments as int;
    if (verses.isEmpty) {
      loadSuraFile(index);
    }
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        surfaceTintColor: Colors.transparent,
        title: Text(
          QuranResources.englishQuranSuraList[index],
          style: AppFonts.gold20BoldCairo,
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.mainColor),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isListView = !isListView;
              });
            },
            icon: Icon(isListView ? Icons.menu_book : Icons.article_outlined),
            iconSize: 30,
          ),
        ],
        actionsPadding: EdgeInsets.only(right: context.width * 0.04),
      ),
      body: SafeArea(
        child: Stack(
          alignment: .topCenter,
          children: [
            Image.asset(
              AppAssets.bgQuranDetails,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
            Column(
              spacing: context.height * 0.05,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: context.height * 0.03),
                  child: Text(
                    QuranResources.arabicQuranSuraList[index],
                    style: AppFonts.gold20BoldCairo,
                  ),
                ),
                Expanded(
                  child: verses.isEmpty
                      ? Center(
                          child: CircularProgressIndicator(
                            color: AppColors.mainColor,
                          ),
                        )
                      : isListView
                      ? ListView.separated(
                          itemBuilder: (context, index) {
                            return AyaWidget(
                              ayaText: versesList[index],
                              ayaNumber: index,
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(height: context.height * 0.009);
                          },
                          itemCount: versesList.length,
                        )
                      : Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: context.width * 0.05),
                          child: SingleChildScrollView(
                            child: Text(
                              verses,
                              style: AppFonts.gold25BoldNaskhArabic,
                              textDirection: .rtl,
                              textAlign: .center,
                            ),
                          ),
                        ),
                ),
                SizedBox(height: context.height * 0.07),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    provider.readMostRecent();
  }

  void loadSuraFile(int index) async {
    String fileContent = await rootBundle.loadString(
      'assets/files/quran/${index + 1}.txt',
    );
    List<String> lines = fileContent.split('\n');
    versesList = lines;

    verses = List.generate(
      lines.length,
      (i) => '${lines[i]}[${i + 1}]',
    ).join(' ');

    await Future.delayed(Duration(seconds: 1), () => setState(() {}));
  }
}
