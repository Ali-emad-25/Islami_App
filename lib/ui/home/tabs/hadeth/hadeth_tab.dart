import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami/ui/home/tabs/hadeth/widgets/hadeth_item.dart';
import 'package:islami/utils/app_style.dart';

class HadethTab extends StatelessWidget {
  HadethTab({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        enlargeCenterPage: true,
        height: context.height * 0.70,
      ),
      items: List.generate(50, (index) => index + 1).map((index) {
        return HadethItem(index: index);
      }).toList(),
    );
  }
}
