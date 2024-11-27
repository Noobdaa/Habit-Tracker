import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  final Function()? onTap;

  const SignUp({super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15
        ),
        child: Container(
          height: 55,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Center(
            child: Text(
              "Create Account",
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

