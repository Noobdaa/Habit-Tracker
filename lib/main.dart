// main.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_am_cooked/db/db_helper.dart';
import 'package:sqflite/sqflite.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:i_am_cooked/pages/login.dart';
import 'package:i_am_cooked/pages/main_page.dart';
import 'Theme/Themedata.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDb();
  await GetStorage.init();
  runApp(const MyApp());
}

class GetStorage {
  static init() {}
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Habit Tracker',
      theme: Themes.dark,
      darkTheme: Themes.dark,
      themeMode: ThemeMode.dark,
      home: MainPage(),
    );
  }
}