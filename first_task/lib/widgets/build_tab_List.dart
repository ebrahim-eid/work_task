import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import '../controller/app_cubit.dart';
import '../controller/app_states.dart';
import '../core/componants.dart';
import '../model/categories_model.dart';
List<CategoriesModel>cardList=[
  CategoriesModel(text: 'Constructions', image: 'assets/images/1.png'),
  CategoriesModel(text: 'Insurances', image: 'assets/images/2.png'),
  CategoriesModel(text: 'Legal', image: 'assets/images/4.png'),
  CategoriesModel(text: 'Buy & sell', image: 'assets/images/Services.png'),
  CategoriesModel(text: 'Accounting Services', image: 'assets/images/5.png'),
];
class BuildTabList extends StatelessWidget {
  const BuildTabList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder: (context,state){return Column(
          children: [
            Container(
                height: 68,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: HexColor('#F2F2F2')),
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      defaultMaterialButton(context,
                          text: 'Categories', value: 0),
                      const Spacer(),
                      defaultMaterialButton(context,
                          text: 'Services', value: 1),
                      const Spacer(),
                      defaultMaterialButton(context,
                          text: 'Orders(0)', value: 2),
                    ],
                  ),
                )),
            if (AppCubit.get(context).valueButton == 0)
              Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  const Row(
                    children: [
                      Text(
                        'Categories',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          // fontWeight: FontWeight.bold
                        ),
                      ),
                      Spacer(),
                      Text(
                        'See all',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                            decoration: TextDecoration.underline,
                            height: 1.5),
                      )
                    ],
                  ),
                  ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => cardView(cardList[index]),
                      separatorBuilder: (context, index) =>
                      const SizedBox(
                        height: 16,
                      ),
                      itemCount: cardList.length),
                ],
              ),
            if (AppCubit.get(context).valueButton == 2)
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  const Image(image: AssetImage('assets/images/EmptyState.png'),width: 250,height: 200,),
                  const SizedBox(height: 8,),
                  const Text('No orders found',style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),),
                  const SizedBox(height: 4,),
                  Text('you can place your needed orders',style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      color: HexColor('#707070')
                  ),),
                  Text('to let serve you.',style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      color: HexColor('#707070')
                  ),),
                ],
              ),
          ],
        );},
        );
  }
}
