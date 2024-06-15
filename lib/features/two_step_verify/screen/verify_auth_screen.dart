import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secure_auth/helper/extensions.dart';
import 'package:secure_auth/services/router/router_name.dart';
import 'package:secure_auth/services/router/router_x.dart';

import '../../../helper/global.dart';
import '../../../widgets/country_code.dart';
import '../../../widgets/custom_text_field.dart';
import '../cubit/two_step_verify_cubit.dart';

class VerifyAuthScreen extends StatelessWidget {
  const VerifyAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = context.read<TwoStepVerifyCubit>();

    //
    return Scaffold(
      appBar: AppBar(title: const Text('Verification')),

      //
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: mq.width * .04, vertical: mq.height * .04),

        //
        child: Column(
          //
          children: [
            const Text(
                'Would you like to continue using this number to receive the verification code, or use a different one?'),

            //
            SizedBox(height: mq.height * .04),

            //
            Row(
              children: [
                const CountryCode(),

                //
                Expanded(
                  child: CustomTextField(
                    c: c.etPhoneNo,
                    hintText: 'Phone Number',
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(10),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),

            ElevatedButton(
                onPressed: () =>
                    RouterX.router.goNamed(RouteName.codeVerify.name),
                child: const Text('Send Verification Code'))
          ].animateListFast,
        ),
      ),
    );
  }
}
