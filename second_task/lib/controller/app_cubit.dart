import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bottom_nav_screens/assets_screen.dart';
import '../bottom_nav_screens/home_screen.dart';
import '../bottom_nav_screens/profile_screen.dart';
import '../bottom_nav_screens/support_screen.dart';
import '../model/user_model.dart';
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
  void changeCarousalView(index) {
    current = index;
    print(index);
    emit(AppChangeCarousalViewState());
  }

  int valueButton = 0;

  void changeValueButton(int value) {
    valueButton = value;
    emit(AppChangeValueButtonState());
  }

  List<UserModel> users = [];

  Future<List<UserModel>> getUserData() async {
   http.Response response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
   try{
     List <dynamic>data= jsonDecode(response.body);
     for (int i = 0; i < data.length; i++) {
       users.add(
         UserModel.fromJson(data[i]),
       );
     }
     print(users[0].name);
     emit(AppSuccessState());
   }catch(e){
     print(e.toString());
     emit(AppErrorState());
   }
   return users;
  }



}

