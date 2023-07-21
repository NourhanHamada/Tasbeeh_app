part of 'prayer_times_cubit.dart';

@immutable
abstract class PrayerTimesState {}

class PrayerTimesInitial extends PrayerTimesState {}

class PrayerTimesLoading extends PrayerTimesState {}

class PrayerTimesSuccess extends PrayerTimesState {}

class PrayerTimesError extends PrayerTimesState {}


