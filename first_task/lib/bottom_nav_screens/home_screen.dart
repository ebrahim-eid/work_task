import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controller/app_cubit.dart';
import '../controller/app_states.dart';
import '../widgets/build_sliding_view.dart';
import '../widgets/build_tab_List.dart';
import '../widgets/build_top_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return  const Padding(
          padding:  EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            physics:  BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 BuildTopView(),
                 BuildSlidingView(),
                  BuildTabList(),
              ],
            ),
          ),
        );
      },
    );
  }
}
