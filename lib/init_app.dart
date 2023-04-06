import 'package:hive/hive.dart';

import 'init_hive.dart';

class InitApp {
  static Future<void> init() async {
    await InitHiveService.init();

    Box languageBox = await Hive.openBox('language');

    if (languageBox.get('language') == null) {
      languageBox.put('language', 'Português');
    }
  }
}
