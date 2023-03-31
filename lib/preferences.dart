import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  SharedPreferences? prefs;
  static const String bulbkey = 'bulb';
  static const String key1 = 'key';

  bool? getBulb() => prefs?.getBool(bulbkey);
}
