import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart'; //for date format
import 'package:intl/date_symbol_data_local.dart'; //for date locale
import 'package:hijri/hijri_calendar.dart';
import 'package:tasbeeh/constants/my_colors.dart'; // for hijri date
import 'package:tasbeeh/view/widgets/home_widgets/location_card.dart';
import 'package:tasbeeh/view/widgets/home_widgets/prayer_times_card.dart';
import '../widgets/home_widgets/random_duaa_card.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    initializeDateFormatting(); // Initial dateFormatter package before Run code.
    super.initState();
  }

  HijriCalendar today = HijriCalendar.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    DateFormat.MMMMEEEEd('ar_SA').format(
                      DateTime.now(),
                    ),
                    style:
                        GoogleFonts.cairo(textStyle: TextStyle(fontSize: 18)),
                  ),
                  Text(
                    today.toFormat("dd MMMM yyyy"),
                    style: GoogleFonts.cairo(
                        textStyle: TextStyle(
                      color: MyColors.tasbehButton,
                      fontSize: 12,
                    )),
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              LocationCard(),
              SizedBox(
                height: 15.h,
              ),
              PrayerTimesCard(),
              SizedBox(
                height: 15.h,
              ),
              RandomDuaaCard(),
            ],
          ),
        ),
      ),
    );
  }
}


