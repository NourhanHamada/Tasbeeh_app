part of 'azkar_details_cubit.dart';

@immutable
abstract class AzkarDetailsState {}

class AzkarDetailsInitial extends AzkarDetailsState {}

class AzkarLoadingState extends AzkarDetailsState{}
class AzkarSuccessState extends AzkarDetailsState{}
class AzkarErrorState extends AzkarDetailsState{}