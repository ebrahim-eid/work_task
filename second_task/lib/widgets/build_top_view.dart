import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class BuildTopView extends StatelessWidget {
  const BuildTopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         const Row(
          children: [
            CircleAvatar(
                radius: 14,
                backgroundColor: Colors.transparent,
                backgroundImage:
                AssetImage('assets/images/person.png')),
            SizedBox(
              width: 8,
            ),
            Text(
              'Hey, Ahmed',
              style:
              TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              width: 8,
            ),
            CircleAvatar(
                radius: 14,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage('assets/images/hand.png')),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        const Text(
          'Multi-Services for Your Real Estate Needs',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          'Explore diverse real estate services for all your needs: property management, construction, insurance and \nmore in one place.',
          style: TextStyle(
            fontSize: 14,
            color: HexColor('#707070'),
            height: 1.5,
            // fontWeight: FontWeight.bold
          ),
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
