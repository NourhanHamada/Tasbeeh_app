import 'package:flutter/material.dart';
import 'package:tasbeeh/constants/my_colors.dart';

class AzkarCard extends StatelessWidget {
  final String title;
  final String image;

  AzkarCard({
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Image.asset(
            image,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Text(
              title,
              style: TextStyle(
                color: MyColors.white,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
