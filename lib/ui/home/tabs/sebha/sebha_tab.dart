import 'package:flutter/material.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_fonts.dart';
import 'package:islami/utils/app_style.dart';

class SebhaTab extends StatefulWidget {
  SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double angel = 0;
  int counter = 0;
  String text = 'سبحان اللَّه';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(bottom: context.height * 0.025),
          alignment: .center,
          child: Text(
            'سَبِّحِ اسْمَ رَبِّكَ الأعلى',
            style: AppFonts.white36BoldCairo,
          ),
        ),
        Stack(
          alignment: .center,
          children: [
            Positioned(
              top: 0,
              left: context.width * 0.44,
              child: Image.asset(AppAssets.sebhaHead),
            ),
            Padding(
              padding: EdgeInsets.only(top: context.height * 0.09),
              child: Stack(
                alignment: .center,
                children: [
                  Column(
                    spacing: context.height * 0.02,
                    children: [
                      Text(text, style: AppFonts.white36BoldCairo),
                      Text('$counter', style: AppFonts.white36BoldCairo),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        angel += 0.03;
                        counter++;

                        if (counter < 33) {
                          text = 'سبحان اللَّه';
                        } else if (counter < 66) {
                          text = 'الحمد للَّه';
                        } else if (counter < 99) {
                          text = 'اللَّه أكبر';
                        } else {
                          counter = 0;
                          text = 'سبحان اللَّه';
                        }
                      });
                    },
                    child: AnimatedRotation(
                      turns: angel,
                      duration: Duration(milliseconds: 150),
                      child: Image.asset(
                        AppAssets.sebhaBody,
                        width: context.width * 0.9,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
