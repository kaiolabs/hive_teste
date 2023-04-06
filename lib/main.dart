import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'init_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InitApp.init();
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  getLanguageBox() async {
    Box languageBox = await Hive.openBox('language');
    return languageBox.get('language');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('A linguagem é: ${getLanguageBox()}'),
        ),
      ),
    );
  }
}
