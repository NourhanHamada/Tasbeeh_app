import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../view_model/cubit/azkar_details_cubit/azkar_details_cubit.dart';
import '../../widgets/azkar_details_widgets/azkar_details_card.dart';

class MorningZekrScreen extends StatelessWidget {
  const MorningZekrScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('أذكار الصباح'),
      ),
      body: BlocConsumer<AzkarDetailsCubit, AzkarDetailsState>(
        listener: (context, state) {},
        builder: (context, state) {
          print('State ------> $state');
          return AzkarDetailsCubit.morningList.length == 0
              ? Center(
                  child: const CircularProgressIndicator(),
                )
              : AzkarDetailsCard();
        },
      ),
    );
  }
}