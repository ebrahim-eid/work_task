import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controller/app_cubit.dart';

import '../controller/app_states.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        return const Center(
          child: Text(''),
        );
      },
    );
  }
}
