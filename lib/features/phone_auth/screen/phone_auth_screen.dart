import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secure_auth/helper/extensions.dart';
import 'package:secure_auth/widgets/custom_text_field.dart';

import '../../../helper/global.dart';
import '../../../services/router/router_name.dart';
import '../../../services/router/router_x.dart';
import '../../../widgets/custom_text_btn.dart';
import '../../../widgets/logo.dart';
import '../cubit/phone_auth_cubit.dart';

class PhoneAuthScreen extends StatelessWidget {
  const PhoneAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = context.read<PhoneAuthCubit>();

    //
    return Scaffold(
      appBar: AppBar(
        title: const Text('You\'re Just One Step Away'),
      ),

      //
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: mq.width * .04, vertical: mq.height * .02),

        //
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          //
          children: [
            //logo
            Logo(height: mq.height * .17),

            //
            SizedBox(height: mq.height * .05),
            Divider(
              height: mq.height * .05,
              color: sColor,
              thickness: 1.5,
            ),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Enter your Mobile Number to continue',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.black87,
                ),
              ),
            ),

            //
            SizedBox(height: mq.height * .02),

            //
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //
                Container(
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
                        Text(flag),

                        //
                        SizedBox(width: 5),

                        //
                        Text('+91'),
                      ],
                    )),

                //
                Expanded(
                  child: CustomTextField(
                    keyboardType: TextInputType.number,
                    c: c.phoneC,
                    hintText: 'Phone Number',
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(10),
                    ],
                    // onSubmitted: (v) => c.getOTP(),
                  ),
                ),
              ],
            ),

            //for adding some space
            SizedBox(height: mq.height * .04),

            //
            ElevatedButton(onPressed: () {}, child: const Text('Get OTP')),

            //
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text('Already have an account?  ',
                  textAlign: TextAlign.center),
              CustomTextBtn(
                onTap: () {
                  // to handle already browsing user
                  // final path = RouterX.getProductPath();
                  // path == null
                  //     ? RouterX.router.goNamed(RouteName.tab.name)
                  //     : RouterX.router.go(path);
                },
                child: const Text('Sign In'),
              ),
            ]),

            SizedBox(height: mq.height * .02),

            //
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
              onTap: () {
                RouterX.router.goNamed(RouteName.authEmail.name);
                // to handle already browsing user
                // final path = RouterX.getProductPath();
                // path == null
                //     ? RouterX.router.goNamed(RouteName.tab.name)
                //     : RouterX.router.go(path);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,

                //
                children: [
                  Image.asset('$iconPath/ic_email.webp',
                      height: mq.height * .035),
                  SizedBox(width: mq.width * .02),

                  //
                  const Text(
                    'Continue With Email',
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 15.5),
                  ),
                ],
              ),
            ),
          ].animateList,
        ),
      ),
    );
  }
}
