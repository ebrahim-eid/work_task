import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'bottom_nav_screens/main_Screen.dart';
import 'controller/app_cubit.dart';
import 'core/constants.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>AppCubit()..getUserData(),
      child:  MaterialApp(
        theme: ThemeData(
          appBarTheme:  AppBarTheme(
            backgroundColor: appBarColor,
            iconTheme:  IconThemeData(
                color: HexColor('#101010'),size: 24,
            ),
            centerTitle: true,
            titleTextStyle: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold
            )
          ),
          scaffoldBackgroundColor: const Color(0xFFFAFAFA),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: HexColor('#FFFFFF'),
            selectedItemColor: Colors.red,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,

          )
        ),
        debugShowCheckedModeBanner: false,
        home:  const MainScreen(),
      ),
    );
  }
}
