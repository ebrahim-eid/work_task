import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../controller/app_cubit.dart';
import '../model/user_model.dart';

Widget defaultMaterialButton(context,
        {required String text, required int value}) =>
    SizedBox(
      width: 96,
      height: 30,
      child: MaterialButton(
        padding: const EdgeInsets.all(8),
        color: AppCubit.get(context).valueButton == value
            ? Colors.red
            : const Color(0xFFF2F2F2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        onPressed: () {
          AppCubit.get(context).changeValueButton(value);
        },
        child: Text(
          text,
          style: TextStyle(
              fontSize: 14,
              color: AppCubit.get(context).valueButton == value
                  ? Colors.white
                  : Colors.black),
        ),
      ),
    );

Widget cardView(UserModel model) => Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Text(
                '${model.id}',
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.black
                    // fontWeight: FontWeight.bold
                    ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              model.name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                // fontWeight: FontWeight.bold
              ),
            ),
            const Spacer(),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_forward,
                  color: HexColor('#8C8C8C'),
                ))
          ],
        ),
      ),
    );

Widget caroselView(
  context, {
  required String image,
  required String contentText,
  String? greyText,
  required String buttonText,
  required double space,
}) =>
    Container(
      height: 152,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: HexColor('#fff5f5'),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 26),
                Text(
                  contentText,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 4,
                ),
                greyText == null
                    ? const SizedBox(
                        height: 4,
                      )
                    : Text(greyText,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey)),
                SizedBox(
                  height: space,
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  width: 128,
                  height: 32,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Colors.red),
                  child: MaterialButton(
                      onPressed: () {},
                      child: Text(
                        buttonText,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      )),
                )
              ],
            ),
          ),
          Image(image: AssetImage(image)),
        ],
      ),
    );
