import 'package:flutter/material.dart';

import '../helper/global.dart';
import 'custom_text_btn.dart';

class CustomListTile extends StatelessWidget {
  final String text;
  final String imgPath;
  final VoidCallback onTap;
  const CustomListTile(
      {super.key,
      required this.text,
      required this.onTap,
      required this.imgPath});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(child: Divider()),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: mq.width * .02),
              child: const Text(
                'OR',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
            ),
            const Expanded(child: Divider())
          ],
        ),
        SizedBox(height: mq.height * .02),

        //
        CustomTextBtn(
          fgColor: Colors.black87,
          bgColor: sColor,
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,

            //
            children: [
              Image.asset('$iconPath/$imgPath', height: mq.height * .03),
              SizedBox(width: mq.width * .02),

              //
              Text(
                text,
                style: const TextStyle(
                    fontWeight: FontWeight.w500, fontSize: 15.5),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
