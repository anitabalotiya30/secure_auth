import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secure_auth/helper/extensions.dart';

import '../../../helper/global.dart';
import '../../../services/router/router_name.dart';
import '../../../services/router/router_x.dart';
import '../../../widgets/country_code.dart';
import '../../../widgets/custom_list_tile.dart';
import '../../../widgets/custom_text_btn.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/logo.dart';
import '../cubit/phone_auth_cubit.dart';

class PhoneAuthScreen extends StatelessWidget {
  const PhoneAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = context.read<PhoneAuthCubit>();

    //
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('You\'re Just One Step Away'),
      ),

      //
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
            horizontal: mq.width * .04, vertical: mq.height * .02),

        //
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          //
          children: [
            //logo
            Logo(height: mq.height * .16),

            //
            SizedBox(height: mq.height * .05),
            Divider(
              height: mq.height * .05,
              color: sColor,
              thickness: 1.5,
            ),

            Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                //
                onTap: () =>
                    RouterX.router.goNamed(RouteName.twoStepVerify.name),

                //
                child: const Text(
                  'Enter your Mobile Number to continue',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black87,
                  ),
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
                const CountryCode(),

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
            ElevatedButton(
                onPressed: () {
                  RouterX.router.goNamed(RouteName.authOtp.name);
                },
                child: const Text('Get OTP')),

            //
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text('Already have an account?  ',
                  textAlign: TextAlign.center),
              CustomTextBtn(
                onTap: () => RouterX.router.goNamed(RouteName.authSignin.name),
                child: const Text('Sign In'),
              ),
            ]),

            SizedBox(height: mq.height * .04),

            //
            CustomListTile(
              onTap: () => RouterX.router.goNamed(RouteName.authEmail.name),
              text: 'Continue With Email',
              imgPath: 'ic_email.webp',
            ),
          ].animateList,
        ),
      ),
    );
  }
}
