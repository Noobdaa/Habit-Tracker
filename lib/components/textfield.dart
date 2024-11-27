import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Mytextfield extends StatelessWidget {
  final TextEditingController controller; // Explicitly typing the controller
  final String hintText;
  final bool obscureText;

  const Mytextfield({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0), // Add some padding for better layout
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white10),
            borderRadius: BorderRadius.circular(12), // Added borderRadius
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.redAccent),
            borderRadius: BorderRadius.circular(12), // Added borderRadius
          ),
          fillColor: Colors.white12,
          filled: true,
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(
            fontSize: 14,
            color: Colors.grey
          )
        ),
      ),
    );
  }
}
