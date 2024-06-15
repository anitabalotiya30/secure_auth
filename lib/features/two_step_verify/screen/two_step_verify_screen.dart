import 'package:flutter/material.dart';
import 'package:secure_auth/helper/extensions.dart';

import '../../../helper/global.dart';
import '../../../services/router/router_name.dart';
import '../../../services/router/router_x.dart';
import '../../../widgets/custom_text_btn.dart';

class TwoStepVerifyScreen extends StatelessWidget {
  const TwoStepVerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: AppBar(title: const Text('Two Step Verification')),

      //
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: mq.width * .04, vertical: mq.height * .02),

        //
        child: Column(
          children: [
            //
            Image.asset('$imagePath/security.webp', height: mq.height * .35),
            SizedBox(height: mq.height * .04),

            //
            const Text(
              'For extra security, turn on two-step verification.',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),

            //
            const Spacer(),
            ElevatedButton(
                onPressed: () =>
                    RouterX.router.goNamed(RouteName.verifyAuth.name),
                child: const Text('Turn On')),

            //
            SizedBox(height: mq.height * .02),
            CustomTextBtn(onTap: () {}, child: const Text('Skip'))
          ].animateListFast,
        ),
      ),
    );
  }
}
