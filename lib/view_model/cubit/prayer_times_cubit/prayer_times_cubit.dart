import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tasbeeh/constants/my_strings.dart';
import 'package:tasbeeh/view_model/database/web_services/dio_helper.dart';

import '../../../model/prayer_times_model.dart';
part 'prayer_times_state.dart';

class PrayerTimesCubit extends Cubit<PrayerTimesState> {
  PrayerTimesCubit() : super(PrayerTimesInitial());

  static PrayerTimesCubit get(context) => BlocProvider.of(context);
   List<PrayerTimes> list = [];

  // void getData() async{
  //   emit(PrayerTimesLoading());
  //   DioHelper.getData(
  //       url: '$baseUrl$location.json?key=$apiKey'
  //   ).then((value) {
  //     print(value);
  //     for(var i in value.data){
  //       list.add(
  //         PrayerTimes.fromJson(i),
  //       );
  //     }
  //     emit(PrayerTimesSuccess());
  //   },
  //   ).catchError((onError){
  //     print(onError);
  //     emit(PrayerTimesError());
  //   });
  // }
}


