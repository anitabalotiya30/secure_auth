import 'package:hive_flutter/hive_flutter.dart';

class Pref {
  static late Box _box;

  static Future<void> initializeHive() async {
    await Hive.initFlutter();
    _box = await Hive.openBox('data');
  }

  static bool get skipIntro => _box.get('skipIntro') ?? false;
  static set skipIntro(bool v) => _box.put('skipIntro', v);
}
