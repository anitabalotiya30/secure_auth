import 'package:flutter/material.dart';

import '../helper/global.dart';

class Logo extends StatelessWidget {
  final double? height;
  const Logo({super.key, this.height});

  @override
  Widget build(BuildContext context) {
    return Image(
        image: const AssetImage('$imagePath/logo.png'),
        height: height ?? mq.height * .25);
  }
}
