import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasbeeh/constants/my_colors.dart';
import 'package:tasbeeh/view_model/cubit/theme_cubit/theme_cubit.dart';

class RandomDuaaCard extends StatelessWidget {
  const RandomDuaaCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ThemeCubit, ThemeStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          color: ThemeCubit.get(context).isDark
              ? MyColors.darkGreenCard
              : MyColors.white,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'دعاء اليوم',
                  style: GoogleFonts.cairo(
                      textStyle:
                          TextStyle(color: MyColors.mainColor, fontSize: 14)),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  '(اللَّهُمَّ إنِّي أعُوذُ بكَ مِنَ الهَمِّ والحَزَنِ، والعَجْزِ والكَسَلِ، والبُخْلِ، والجُبْنِ، وضَلَعِ الدَّيْنِ، وغَلَبَةِ الرِّجالِ)',
                  style: GoogleFonts.cairo(
                      textStyle: TextStyle(
                          color: ThemeCubit.get(context).isDark
                              ? MyColors.white
                              : MyColors.black,
                          fontSize: 16,
                        fontWeight: FontWeight.w600
                      ),
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
