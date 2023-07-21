import 'package:flutter/material.dart';
import 'package:tasbeeh/view_model/cubit/sebha_cubit/sebha_cubit.dart';
import '../../../constants/my_colors.dart';
import '../../../constants/my_icons.dart';
import '../../../view_model/cubit/theme_cubit/theme_cubit.dart';

class SebhaResetButton extends StatelessWidget {
  const SebhaResetButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          // elevation: 3,
          shape: CircleBorder(),
          backgroundColor: ThemeCubit.get(context).isDark
              ? MyColors.darkGreen
              : MyColors.white,
        ),
        onPressed: () {
          SebhaCubit.get(context).reset();
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(MyIcons.reset),
          ),
        ),
      ),
    );
  }
}
