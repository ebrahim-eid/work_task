import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bottom_nav_screens/assets_screen.dart';
import '../bottom_nav_screens/home_screen.dart';
import '../bottom_nav_screens/profile_screen.dart';
import '../bottom_nav_screens/support_screen.dart';
import 'app_states.dart';

class AppCubit extends Cubit <AppStates> {

  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);


  List<Widget>screens =
  [
    const HomeScreen(),
    const AssetsScreen(),
    const SupportScreen(),
    const ProfileScreen()
  ];

  int currentIndex = 0;

  void changeBottomNavIndex(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavState());
  }

  int current = 0;
  void changeCarousalView(int index){

  current =index;
      emit(AppChangeCarousalViewState());
    }




  int valueButton = 0;

  void changeValueButton(int value) {
    valueButton = value;
    emit(AppChangeValueButtonState());
  }


}

