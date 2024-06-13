import 'package:flutter/material.dart';

import '../services/router/router_x.dart';

class BackBtn extends StatelessWidget {
  final Color color;

  const BackBtn({super.key, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        splashRadius: 25,
        onPressed: RouterX.router.pop,
        tooltip: 'Back',
        icon: Icon(Icons.arrow_back, color: color));
  }
}
