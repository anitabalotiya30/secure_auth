import 'package:hive_flutter/hive_flutter.dart';

class Pref {
  static late Box _box;

  static Future<void> initializeHive() async {
    await Hive.initFlutter();
    _box = await Hive.openBox('data');
  }

  static bool get skipIntro => _box.get('skipIntro') ?? false;
  static set skipIntro(bool v) => _box.put('skipIntro', v);

  static String? get userUid => _box.get('userUid');
  static set userUid(String? v) => _box.put('userUid', v);

  static bool get signedIn => _box.get('signedIn') ?? false;
  static set signedIn(bool v) => _box.put('signedIn', v);

  static bool get phoneSignin => _box.get('phoneSignin') ?? false;
  static set phoneSignin(bool v) => _box.put('phoneSignin', v);
}
