import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasbeeh/view_model/cubit/sebha_cubit/sebha_states.dart';

class SebhaCubit extends Cubit<SebhaStates> {
  SebhaCubit() : super(SebhaInitialState());

  static SebhaCubit get(context) => BlocProvider.of(context);

  var number = 0;

  void increment() {
    number++;
    emit(SebhaIncrementState());
  }

  void reset() {
    number = 0;
    emit(SebhaResetState());
  }
}
