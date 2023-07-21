import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasbeeh/view_model/cubit/layout_cubit/layout_cubit.dart';
import 'package:tasbeeh/view_model/cubit/layout_cubit/layout_states.dart';

import '../../../view_model/cubit/theme_cubit/theme_cubit.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        LayoutCubit cubit = LayoutCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            leading: BlocConsumer<ThemeCubit, ThemeStates>(
              listener: (context, state) {
              },
              builder: (context, state) {
                return IconButton(
                  onPressed: () {
                    ThemeCubit.get(context).changeAppTheme();
                  },
                  icon: ThemeCubit
                      .get(context)
                      .isDark == false
                      ? Icon(Icons.brightness_2_outlined)
                      : Icon(Icons.brightness_4_outlined),
                );
              },
            ),
            title: Text(cubit.titles[cubit.currentIndex],
              style: GoogleFonts.cairo(textStyle: TextStyle(fontSize: 20)),
            ),
          ),
          body: cubit.Screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: cubit.bottomNavBarItems,
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeIndex(index);
            },
          ),
        );
      },
    );
  }
}
