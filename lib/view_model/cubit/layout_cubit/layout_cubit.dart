import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:tasbeeh/view/screens/home_screen.dart';
import 'package:tasbeeh/view/screens/sebha_screen.dart';
import 'package:tasbeeh/view_model/cubit/layout_cubit/layout_states.dart';

import '../../../constants/my_colors.dart';
import '../../../constants/my_icons.dart';
import '../../../view/screens/azkar_screen.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutInitialState());

  static LayoutCubit get(context) => BlocProvider.of(context);

  var currentIndex = 0;


  List<String> titles = [
    '',
    'الأذكار',
    'السبحة الإلكترونية',
  ];

  List<Widget> Screens = [
    HomeScreen(),
    AzkarScreen(),
    SebhaScreen(),
  ];

  List<BottomNavigationBarItem> bottomNavBarItems = [
    BottomNavigationBarItem(
      icon: Image.asset(MyIcons.homeUnSelected),
      activeIcon: Image.asset(MyIcons.homeSelected),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Image.asset(MyIcons.bookUnSelected),
      activeIcon: Image.asset(MyIcons.bookSelected),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Image.asset(MyIcons.sebhaUnSelected),
      activeIcon: Image.asset(MyIcons.sebhaSelected),
      label: '',
    ),
  ];

  void changeIndex(index) {
    currentIndex = index;
    emit(ChangeBottomNavBarState());
  }
}
