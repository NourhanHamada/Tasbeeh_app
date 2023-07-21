import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../constants/my_strings.dart';
import '../../database/web_services/dio_helper.dart';

part 'azkar_details_state.dart';

class AzkarDetailsCubit extends Cubit<AzkarDetailsState> {
  AzkarDetailsCubit() : super(AzkarDetailsInitial());

  static AzkarDetailsCubit get(context) => BlocProvider.of(context);


  // Morning Zekr.
  static List<dynamic> morningList = [];
  Future getMorningZikr() async {
    emit(AzkarLoadingState());
    if (morningList.isEmpty) {
      DioHelper.getData(url: azkarBaseUrl + morning + endOfLink).then((value) {
        print('custom data ------>');
        morningList = value.data['content'];
        print(morningList);
        emit(AzkarSuccessState());
      }).catchError((onError) {
        print(onError.toString());
        emit(AzkarErrorState());
      });
    } else {
      emit(AzkarSuccessState());
    }
  }

  // Night Zekr.
  static List<dynamic> nightList = [];
  void getNightZikr() async {
    emit(AzkarLoadingState());
    if (nightList.isEmpty) {
      DioHelper.getData(url: azkarBaseUrl + night + endOfLink).then((value) {
        print('custom data ------>');
        nightList = value.data['content'];
        print(nightList);
        emit(AzkarSuccessState());
      }).catchError((onError) {
        print(onError.toString());
        emit(AzkarErrorState());
      });
    } else {
      emit(AzkarSuccessState());
    }
  }

// List<AzkarModel> bedTimeList = [];
// void getBedTimeZikr() async{
//   emit(AzkarLoadingState());
//   DioHelper.getData(
//     url: azkarBaseUrl +
//         bedTime +
//         endOfLink,
//   ).then((value) {
//     print('data ------> ');
//     print(value);
//     for(var i in value.data){
//       morningList.add(AzkarModel.fromJson(i));
//     }
//     emit(AzkarSuccessState());
//   }).catchError((onError){
//     print(onError);
//     emit(AzkarErrorState());
//   });
// }
}
