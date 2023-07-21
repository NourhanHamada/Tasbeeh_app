import 'package:adhan_dart/adhan_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:tasbeeh/constants/my_colors.dart';
import 'package:tasbeeh/constants/my_icons.dart';
import 'package:tasbeeh/view_model/cubit/theme_cubit/theme_cubit.dart';
import 'package:timezone/timezone.dart' as timeZone;

class PrayerTimesCard extends StatelessWidget {
  const PrayerTimesCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // to get location from adhan package.
    final location = timeZone.getLocation('Africa/Cairo');
    DateTime date = timeZone.TZDateTime.from(DateTime.now(), location);
    Coordinates coordinates = Coordinates(26.8206, 30.8025);
    CalculationParameters params = CalculationMethod.MuslimWorldLeague();
    params.madhab = Madhab.Hanafi;
    PrayerTimes prayerTimes =
        PrayerTimes(coordinates, date, params, precision: true);
    // next Prayer name
    var nextPrayer = prayerTimes.nextPrayer();
    // convert english Prayer name to arabic.
    if (nextPrayer == 'fajr') {
      nextPrayer = 'صلاة الفجر';
    } else if (nextPrayer == 'sunrise') {
      nextPrayer = 'الشروق';
    } else if (nextPrayer == 'dhuhr') {
      nextPrayer = 'صلاة الظهر';
    } else if (nextPrayer == 'asr') {
      nextPrayer = 'صلاة العصر';
    } else if (nextPrayer == 'maghrib') {
      nextPrayer = 'صلاة المغرب';
    } else {
      nextPrayer = 'صلاة العشاء';
    }

    // Convenience Utilities
    String current =
        prayerTimes.currentPrayer(date: DateTime.now()); // date: date
    // DateTime? currentPrayerTime = prayerTimes.timeForPrayer(current)
    // Qibla Direction
    // var qiblaDirection = Qibla.qibla(coordinates);

    // Method to get arabic formatted date.
    String formatTime(DateTime time, timeZone.Location location) {
      final formatter = DateFormat('h:mm a', 'ar');
      final timeZoneTime = timeZone.TZDateTime.from(time, location);
      final formattedTime = formatter.format(timeZoneTime);
      return formattedTime;
    }
    // Using the formatTime method the format a date.
    final fajr = formatTime(prayerTimes.fajr!, location);
    final sunrise = formatTime(prayerTimes.sunrise!, location);
    final dhuhr = formatTime(prayerTimes.dhuhr!, location);
    final asr = formatTime(prayerTimes.asr!, location);
    final maghrib = formatTime(prayerTimes.maghrib!, location);
    final isha = formatTime(prayerTimes.isha!, location);

    return BlocConsumer<ThemeCubit, ThemeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        ThemeCubit cubit = ThemeCubit.get(context);
        return Card(
          elevation: 5,
          color: cubit.isDark ? MyColors.dark : MyColors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: 140.w,
                decoration: BoxDecoration(
                  color: MyColors.mainColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'مواعيد الصلاة',
                        style: GoogleFonts.cairo(
                          textStyle: TextStyle(
                            color:
                                cubit.isDark ? MyColors.black : MyColors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Image.asset(
                        MyIcons.mosque,
                        color: cubit.isDark ? MyColors.black : MyColors.white,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2.3,
                child: Padding(
                  padding: EdgeInsets.all(
                    16,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '$fajr',
                            style: GoogleFonts.cairo(
                              textStyle: TextStyle(
                                color: current == 'sunrise' ||
                                        current == 'dhuhr' ||
                                        current == 'asr' ||
                                        current == 'maghrib' ||
                                        current == 'isha'
                                    ? MyColors.salahFinished
                                    : current == 'fajr'
                                        ? MyColors.mainColor
                                    : ThemeCubit.get(context).isDark ? MyColors.white
                                    : MyColors.black,
                              ),
                            ),
                          ),
                          Text(
                            'الفجر',
                            style: GoogleFonts.cairo(
                              textStyle: TextStyle(
                                color: current == 'sunrise' ||
                                        current == 'dhuhr' ||
                                        current == 'asr' ||
                                        current == 'maghrib' ||
                                        current == 'isha'
                                    ? MyColors.salahFinished
                                    : current == 'fajr'
                                        ? MyColors.mainColor
                                    : ThemeCubit.get(context).isDark ? MyColors.white
                                    : MyColors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '$sunrise',
                            style: GoogleFonts.cairo(
                              textStyle: TextStyle(
                                color: current == 'dhuhr' ||
                                        current == 'asr' ||
                                        current == 'maghrib' ||
                                        current == 'isha'
                                    ? MyColors.salahFinished
                                    : current == 'sunrise'
                                        ? MyColors.mainColor
                                    : ThemeCubit.get(context).isDark ? MyColors.white
                                    : MyColors.black,
                              ),
                            ),
                          ),
                          Text(
                            'الشروق',
                            style: GoogleFonts.cairo(
                              textStyle: TextStyle(
                                color: current == 'dhuhr' ||
                                        current == 'asr' ||
                                        current == 'maghrib' ||
                                        current == 'isha'
                                    ? MyColors.salahFinished
                                    : current == 'sunrise'
                                        ? MyColors.mainColor
                                    : ThemeCubit.get(context).isDark ? MyColors.white
                                    : MyColors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '$dhuhr',
                            style: GoogleFonts.cairo(
                              textStyle: TextStyle(
                                color: current == 'asr' ||
                                        current == 'maghrib' ||
                                        current == 'isha'
                                    ? MyColors.salahFinished
                                    : current == 'dhuhr'
                                        ? MyColors.mainColor
                                    : ThemeCubit.get(context).isDark ? MyColors.white
                                    : MyColors.black,
                              ),
                            ),
                          ),
                          Text(
                            'الظهر',
                            style: GoogleFonts.cairo(
                              textStyle: TextStyle(
                                color: current == 'asr' ||
                                        current == 'maghrib' ||
                                        current == 'isha'
                                    ? MyColors.salahFinished
                                    : current == 'dhuhr'
                                        ? MyColors.mainColor
                                    : ThemeCubit.get(context).isDark ? MyColors.white
                                    : MyColors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '$asr',
                            style: GoogleFonts.cairo(
                              textStyle: TextStyle(
                                color: current == 'maghrib' || current == 'isha'
                                    ? MyColors.salahFinished
                                    : current == 'asr'
                                        ? MyColors.mainColor
                                    : ThemeCubit.get(context).isDark ? MyColors.white
                                    : MyColors.black,
                              ),
                            ),
                          ),
                          Text(
                            'العصر',
                            style: GoogleFonts.cairo(
                              textStyle: TextStyle(
                                color: current == 'maghrib' || current == 'isha'
                                    ? MyColors.salahFinished
                                    : current == 'asr'
                                        ? MyColors.mainColor
                                    : ThemeCubit.get(context).isDark ? MyColors.white
                                    : MyColors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '$maghrib',
                            style: GoogleFonts.cairo(
                              textStyle: TextStyle(
                                color: current == 'isha'
                                    ? MyColors.salahFinished
                                    : current == 'maghrib'
                                        ? MyColors.mainColor
                                    : ThemeCubit.get(context).isDark ? MyColors.white
                                    : MyColors.black,
                              ),
                            ),
                          ),
                          Text(
                            'المغرب',
                            style: GoogleFonts.cairo(
                              textStyle: TextStyle(
                                color: current == 'isha'
                                    ? MyColors.salahFinished
                                    : current == 'maghrib'
                                        ? MyColors.mainColor
                                    : ThemeCubit.get(context).isDark ? MyColors.white
                                    : MyColors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '$isha',
                            style: GoogleFonts.cairo(
                              textStyle: TextStyle(
                                color: current == ''
                                    ? MyColors.salahFinished
                                    : current == 'isha'
                                        ? MyColors.mainColor
                                    : ThemeCubit.get(context).isDark ? MyColors.white
                                    : MyColors.black,
                              ),
                            ),
                          ),
                          Text(
                            'العشاء',
                            style: GoogleFonts.cairo(
                              textStyle: TextStyle(
                                color: current == ''
                                    ? MyColors.salahFinished
                                    : current == 'isha'
                                        ? MyColors.mainColor
                                    : ThemeCubit.get(context).isDark ? MyColors.white
                                        : MyColors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
