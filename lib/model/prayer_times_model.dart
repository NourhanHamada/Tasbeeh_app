final String apiEndpoint = 'https://muslimsalat.com/eg.json?key=498beb417688abfe9acd5f6657fcad48';

class PrayerTimes {
  final String fajr;
  final String sunrise;
  final String dhuhr;
  final String asr;
  final String maghrib;
  final String isha;

  PrayerTimes({
    required this.fajr,
    required this.sunrise,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
  });

  factory PrayerTimes.fromJson(Map<String, dynamic> json) {
    return PrayerTimes(
      fajr: json['timings']['Fajr'],
      sunrise: json['timings']['Sunrise'],
      dhuhr: json['timings']['Dhuhr'],
      asr: json['timings']['Asr'],
      maghrib: json['timings']['Maghrib'],
      isha: json['timings']['Isha'],
    );
  }
}

class PrayerDetails {
  final String date;
  final PrayerTimes timings;

  PrayerDetails({
    required this.date,
    required this.timings,
  });

  factory PrayerDetails.fromJson(Map<String, dynamic> json) {
    return PrayerDetails(
      date: json['date']['readable'],
      timings: PrayerTimes.fromJson(json),
    );
  }
}

class PrayerTimesResponse {
  final String status;
  final List<PrayerDetails> data;

  PrayerTimesResponse({
    required this.status,
    required this.data,
  });

  factory PrayerTimesResponse.fromJson(Map<String, dynamic> json) {
    List<PrayerDetails> prayerDetails = [];
    for (var item in json['data']) {
      prayerDetails.add(PrayerDetails.fromJson(item));
    }
    return PrayerTimesResponse(
      status: json['status'],
      data: prayerDetails,
    );
  }
}

