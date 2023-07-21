import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../azkar_details_cubit/azkar_details_cubit.dart';

part 'azkar_details_card_state.dart';

class AzkarDetailsCardCubit extends Cubit<AzkarDetailsCardState> {
  AzkarDetailsCardCubit() : super(AzkarDetailsCardInitial());

  static AzkarDetailsCardCubit get(context) => BlocProvider.of(context);

  var isVisibleList = List.filled(AzkarDetailsCubit.morningList.length, true);
  List<int> repeatValue = List.generate(AzkarDetailsCubit.morningList.length,
      (index) => AzkarDetailsCubit.morningList[index]['repeat']);

  void cardUnVisible(int index, bool isVisible) {
    if (repeatValue[index] > 0) {
      repeatValue[index]--;
    }
    AzkarDetailsCubit.morningList[index]['repeat'] = repeatValue[index];
    if (repeatValue[index] <= 0) {
      isVisibleList[index] = isVisible;
    }
    print(repeatValue[index]);
    emit(CardUnVisibleState());
  }
}
