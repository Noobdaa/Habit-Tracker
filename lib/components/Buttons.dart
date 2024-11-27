import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  final Function()? onTap;

  const Mybutton({super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15
        ),
        child: Container(
          height: 55,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              "Sign In",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}


