import 'package:flutter/material.dart';
import 'package:ssedisdik/src/constants/colors.dart';

class CustomAppbar extends StatelessWidget {
  final VoidCallback? onBackPressed;
  const CustomAppbar({super.key, this.onBackPressed});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.06,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
        color: primaryColor,
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            ),
            onPressed: onBackPressed ?? () => Navigator.pop(context),
          ),
          // Add more widgets here as needed
        ],
      ),
    );
  }
}
