import 'package:adhan_dart/adhan_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasbeeh/constants/my_colors.dart';
import 'package:tasbeeh/constants/my_icons.dart';
import 'package:timezone/timezone.dart' as timeZone;

class LocationCard extends StatefulWidget {
  LocationCard({
    Key? key,
  }) : super(key: key);

  @override
  State<LocationCard> createState() => _LocationCardState();
}

class _LocationCardState extends State<LocationCard> {
  void initState() {
    _getCurrentLocation();
    super.initState();
  }

  Future<void> _getCurrentLocation() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      List<Placemark> placemarks = await placemarkFromCoordinates(
          position.latitude, position.longitude,
          localeIdentifier: 'ar_SA');
      setState(() {
        address = "${placemarks.first.country}, ${placemarks.first.locality}";
      });
    } catch (e) {
      print(e);
    }
  }
  String address = '';

  @override
  Widget build(BuildContext context) {
    // // to get location from adhan package.
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
    // next prayer time.
    var nextPrayer2 = prayerTimes.nextPrayer();
    var nextPrayerTime =
        '${prayerTimes.timeForPrayer(nextPrayer2)?.hour}:${prayerTimes.timeForPrayer(nextPrayer2)?.minute}';

    return Card(
      elevation: 5,
      color: MyColors.mainColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  address,
                  style: GoogleFonts.cairo(
                    textStyle: TextStyle(color: MyColors.white, fontSize: 15),
                  ),
                ),
                SizedBox(
                  width: 3.w,
                ),
                Image.asset(MyIcons.location)
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              'متبقي على',
              style: GoogleFonts.cairo(
                textStyle: TextStyle(color: MyColors.white, fontSize: 15),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 40,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'دقيقة  ',
                        style: GoogleFonts.cairo(
                          textStyle: TextStyle(
                            color: MyColors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Text(
                        nextPrayerTime,
                        style: GoogleFonts.cairo(
                          textStyle: TextStyle(
                            color: MyColors.white,
                            fontSize: 28,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  nextPrayer,
                  style: GoogleFonts.cairo(
                      textStyle: TextStyle(
                    color: MyColors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  )),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

