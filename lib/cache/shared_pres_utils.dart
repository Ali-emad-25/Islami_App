import 'package:shared_preferences/shared_preferences.dart';

void saveLastSuraIndex(int newSuraIndex) async {
  final sharedPreferences = await SharedPreferences.getInstance();

  List<String> mostRecentList =
      sharedPreferences.getStringList('most_recent') ?? [];

  if (mostRecentList.contains('$newSuraIndex')) {
    mostRecentList.remove('$newSuraIndex');
    mostRecentList.insert(0, '$newSuraIndex');
  } else {
    mostRecentList.insert(0, '$newSuraIndex');
  }

  if (mostRecentList.length > 5) {
    mostRecentList.removeLast();
  }

  sharedPreferences.setStringList('most_recent', mostRecentList);
}

void introSet() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool('isFirstTime', false);
}

Future<bool> introGet() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool('isFirstTime') ?? true;
}
