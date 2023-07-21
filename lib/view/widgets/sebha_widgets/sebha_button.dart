import 'package:flutter/material.dart';
import 'package:tasbeeh/view_model/cubit/sebha_cubit/sebha_cubit.dart';
import '../../../constants/my_colors.dart';
import '../../../view_model/cubit/theme_cubit/theme_cubit.dart';

class SebhaButton extends StatelessWidget {
  const SebhaButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: ThemeCubit.get(context).isDark
                ? MyColors.darkGreen
                : MyColors.navBar,
            spreadRadius: 9,
            blurRadius: 13,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: ClipOval(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: MyColors.mainColor,
            shape: CircleBorder(),
            shadowColor: ThemeCubit.get(context).isDark
                ? MyColors.darkGreen
                : MyColors.navBar,
            // elevation: 5,
          ),
          onPressed: () {
            SebhaCubit.get(context).increment();
          },
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(35.0),
              child: Column(
                children: [
                  Text(
                    '${SebhaCubit.get(context).number}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'سبح',
                    style: TextStyle(fontSize: 16, color: MyColors.darkGreen),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
