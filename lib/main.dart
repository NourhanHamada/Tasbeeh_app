import 'package:adhan_dart/adhan_dart.dart';
import 'package:tasbeeh/view/screens/azkar_details_screens/night_zekr_screen.dart';
import 'package:tasbeeh/view/screens/splash_screen.dart';
import 'package:tasbeeh/view_model/cubit/azkar_details_cubit/azkar_details_cubit.dart';
import 'package:timezone/data/latest.dart' as timeZone;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:tasbeeh/view/components/theme_mode/dark_mode.dart';
import 'package:tasbeeh/view/components/theme_mode/light_mode.dart';
import 'package:tasbeeh/view/screens/azkar_details_screens/morning_zikr_screen.dart';
import 'package:tasbeeh/view/screens/layouts/app_layout_screen.dart';
import 'package:tasbeeh/view_model/cubit/azkar_details_card_cubit/azkar_details_card_cubit.dart';
import 'package:tasbeeh/view_model/cubit/bloc_observer.dart';
import 'package:tasbeeh/view_model/cubit/layout_cubit/layout_cubit.dart';
import 'package:tasbeeh/view_model/cubit/prayer_times_cubit/prayer_times_cubit.dart';
import 'package:tasbeeh/view_model/cubit/sebha_cubit/sebha_cubit.dart';
import 'package:tasbeeh/view_model/cubit/theme_cubit/theme_cubit.dart';
import 'package:tasbeeh/view_model/database/web_services/dio_helper.dart';

void main() async {
  // To Run ScreenUtilInit package.
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await DioHelper.init();
  // Current Date.
  HijriCalendar.setLocal('ar');
  Intl.defaultLocale = 'ar_SA';
  // Prayer Times Package.
  timeZone.initializeTimeZones();
  // Local Json
  WidgetsFlutterBinding.ensureInitialized();

  runApp(Tasbeeh());
}

class Tasbeeh extends StatelessWidget {
  const Tasbeeh({super.key});

  @override
  Widget build(BuildContext context) {
    CalculationParameters params = CalculationMethod.MuslimWorldLeague();
    params.madhab = Madhab.Hanafi;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => ThemeCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => LayoutCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => SebhaCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => AzkarDetailsCardCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) =>
          AzkarDetailsCubit()..getMorningZikr(),
        ),
        BlocProvider(
          create: (BuildContext context) => PrayerTimesCubit(),
        ),
      ],
      child: BlocConsumer<ThemeCubit, ThemeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: const Size(375, 811),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (BuildContext context, Widget? child) {
              return MaterialApp(
                initialRoute: '/',
                routes: {
                  '/layout': (context) => LayoutScreen(),
                  '/morningZekrScreen': (context) => MorningZekrScreen(),
                  '/nightZekrScreen': (context) => NightZekrScreen(),
                },
                debugShowCheckedModeBanner: false,
                theme: buildLightMode(context),
                darkTheme: buildDarkMode(context),
                themeMode: ThemeCubit.get(context).isDark
                    ? ThemeMode.dark
                    : ThemeMode.light,
                // onGenerateRoute: appRoutes.generateRoute,
                home: SplashScreen(),
              );
            },
          );
        },
      ),
    );
  }
}

// Dear programmer
// When I wrote this code, only god and
// I knew how it worked
// Now, only god know it!
//
// Therefor, if you are trying to optimize
// this routine and it fails (most surely),
// Please increase this counter as a
// warning for next person:

// total_hours_wasted_here = 254 :D
//
