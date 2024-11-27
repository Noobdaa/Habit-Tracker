import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';

const Color primaryclr = Colors.red;
const Color purpleclr = Color(0xFFFF8F00);
const Color blueclr =Color(0xFFE64A19);
const Color pinkclr = Color(0xFF01579B);
const Color yellowclr = Colors.yellow;

TextStyle get subHeadingStyle{
  return GoogleFonts.poppins(
    textStyle: TextStyle(
      fontSize:18,
      fontWeight: FontWeight.normal,
      color: Colors.white70
    )
  );
}

TextStyle get headingStyle{
  return GoogleFonts.poppins(
      textStyle: TextStyle(
          fontSize:22 ,
          fontWeight:FontWeight.w600,
          color: Colors.white
      )
  );
}

TextStyle get titleStyle{
  return GoogleFonts.poppins(
      textStyle: TextStyle(
          fontSize:15 ,
          fontWeight:FontWeight.w500,
          color: Colors.white70,
      )
  );
}

TextStyle get subtitleStyle{
  return GoogleFonts.poppins(
      textStyle: TextStyle(
          fontSize:13 ,
          fontWeight:FontWeight.w500,
          color: Colors.grey
      )
  );
}