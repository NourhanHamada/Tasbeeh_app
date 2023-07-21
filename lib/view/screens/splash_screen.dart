import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:tasbeeh/constants/my_colors.dart';
import 'package:tasbeeh/constants/my_images.dart';
import 'package:tasbeeh/view/screens/layouts/app_layout_screen.dart';
import 'package:tasbeeh/view_model/cubit/theme_cubit/theme_cubit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: MyImages.splash,
      nextScreen: LayoutScreen(),
      duration: 3000,
      backgroundColor:
          ThemeCubit.get(context).isDark ? MyColors.black : MyColors.white,
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
