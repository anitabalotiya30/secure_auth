import 'package:flutter/material.dart';

import '../helper/global.dart';

class CountryCode extends StatelessWidget {
  const CountryCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: mq.width * .2,
      margin: const EdgeInsets.only(right: 10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: sColor,
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('🇮🇳'),

          //
          SizedBox(width: 5),

          //
          Text('+91'),
        ],
      ),
    );
  }
}
