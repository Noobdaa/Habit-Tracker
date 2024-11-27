import 'package:flutter/material.dart';

const Color rd = Color(0xFFF44336FF);
const Color blk = Color(0xFF000000FF);
const Color gry = Color(0xFF272626FF);
const Color ltgry = Color(0xFF777777FF);

class Themes{
  static final light = ThemeData(
    primaryColor: Colors.red,
    brightness: Brightness.light
  );

  static final dark = ThemeData(
      primaryColor: Colors.red,
      brightness: Brightness.dark
  );
}