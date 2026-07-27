import 'package:flutter/material.dart';
import 'package:islami/cache/shared_pres_utils.dart';
import 'package:islami/provider/most_recent_provider.dart';
import 'package:islami/ui/home/home_screen.dart';
import 'package:islami/ui/home/tabs/quran/quran_details_screen.dart';
import 'package:islami/ui/intro_screen.dart';
import 'package:islami/utils/app_routes.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool isFirstTime = await introGet();
  runApp(
    ChangeNotifierProvider(
      create: (context) => MostRecentProvider(),
      child: MyApp(isFirstTime: isFirstTime,),
    ),
  );
}


class MyApp extends StatelessWidget {
  final bool isFirstTime;
  const MyApp({super.key, required this.isFirstTime});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

    debugShowCheckedModeBanner: false,
      initialRoute: isFirstTime
          ? AppRoutes.introRouteName
          : AppRoutes.homeRouteName,
      routes: {
        AppRoutes.introRouteName: (context) => IntroScreen(),
        AppRoutes.homeRouteName: (context) => HomeScreen(),
        AppRoutes.quranDetailsRouteName: (context) => QuranDetailsScreen(),
      },
    );
  }
}
