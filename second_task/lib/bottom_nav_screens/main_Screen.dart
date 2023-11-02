import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controller/app_cubit.dart';
import '../controller/app_states.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        return  Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: (){},
              icon: const Icon(Icons.menu_outlined),
            ),
            title: const Text('Home'),
          ),
          body: AppCubit.get(context).screens[AppCubit.get(context).currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index){
              AppCubit.get(context).changeBottomNavIndex(index);
            },
            currentIndex: AppCubit.get(context).currentIndex,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.dashboard_customize_outlined),label: 'Assets'),
              BottomNavigationBarItem(icon: Icon(Icons.support_agent),label: 'Support'),
              BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profile'),

            ],
          ),
        );
      },
    );
  }
}
