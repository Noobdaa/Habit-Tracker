import 'package:flutter/material.dart';
import 'package:i_am_cooked/components/Themes.dart';


class buttons extends StatelessWidget {
  final String label;
  final Function()? onTap;

  const buttons({super.key, required this.onTap, required this.label});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.all(3),
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            color: primaryclr,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3), // Increased opacity for more visible shadow
                spreadRadius: 2,
                blurRadius: 6, // Increased blur for softer shadow
                offset: Offset(0, 5), // Slightly lower shadow
              ),
              BoxShadow(
                color: Colors.black87.withOpacity(0.6),
                spreadRadius: 4,
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 33,
                fontWeight: FontWeight.w400,
                color: Colors.white, // Ensuring text is visible on colored background
              ),
            ),
          ),
        ),
      ),
    );
  }
}
