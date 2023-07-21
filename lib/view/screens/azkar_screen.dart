import 'package:flutter/material.dart';
import '../../constants/my_images.dart';
import '../widgets/azkar_widgets/azkar_card.dart';

class AzkarScreen extends StatelessWidget {
  AzkarScreen({Key? key}) : super(key: key);

  // final List<String> titles = [
  //   'أذكار الصباح'
  //       'أذكار المساء'
  //       'أذكار قيام الليل'
  //       'أذكار الصلاة'
  //       'أذكار النوم'
  //       'أدعية متنوعة'
  // ];
  //
  // final List images = [
  //   MyImages.morning,
  //   MyImages.night,
  //   MyImages.midnight,
  //   MyImages.pray,
  //   MyImages.bedtime,
  //   MyImages.random,
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: ListView(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/morningZekrScreen');
                },
                child: AzkarCard(
                  title: 'أذكار الصباح',
                  image: '${MyImages.morning}',
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, '/nightZekrScreen');
                },
                child: AzkarCard(
                  title: 'أذكار المساء',
                  image: '${MyImages.night}',
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20, right: 5),
                  child: Text(
                    'أذكار متنوعة',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
              AzkarCard(
                title: 'أذكار قيام الليل',
                image: '${MyImages.midnight}',
              ),
              AzkarCard(
                title: 'أذكار الصلاة',
                image: '${MyImages.pray}',
              ),
              AzkarCard(
                title: 'أذكار النوم',
                image: '${MyImages.bedtime}',
              ),
              AzkarCard(
                title: 'أدعية متنوعة',
                image: '${MyImages.random}',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
