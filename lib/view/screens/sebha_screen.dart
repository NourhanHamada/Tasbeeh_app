import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasbeeh/view_model/cubit/sebha_cubit/sebha_states.dart';
import 'package:tasbeeh/view_model/cubit/theme_cubit/theme_cubit.dart';
import '../../view_model/cubit/sebha_cubit/sebha_cubit.dart';
import '../widgets/sebha_widgets/sebha_button.dart';
import '../widgets/sebha_widgets/sebha_reset_button.dart';

class SebhaScreen extends StatelessWidget {
  const SebhaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SebhaCubit, SebhaStates>(
      listener: (BuildContext context, Object? state) {},
      builder: (BuildContext context, state) {
        return Scaffold(
          body: Center(
            child: BlocConsumer<ThemeCubit, ThemeStates>(
              listener: (context, state) {},
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SebhaButton(),
                    SizedBox(
                      height: 60.h,
                    ),
                    SebhaResetButton(),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
