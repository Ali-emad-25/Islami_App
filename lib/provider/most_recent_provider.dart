import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MostRecentProvider extends ChangeNotifier {
  List<int> mostRecentList = [];

  void readMostRecent() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    List<String> mostRecentListAsString =
        sharedPreferences.getStringList('most_recent') ?? [];

    mostRecentList = mostRecentListAsString
        .map((element) => int.parse(element))
        .toList();
    notifyListeners();
  }
}
