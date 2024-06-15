import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secure_auth/helper/extensions.dart';

import '../../../helper/global.dart';
import '../../../widgets/custom_text_btn.dart';
import '../../../widgets/custom_text_field.dart';
import '../cubit/two_step_verify_cubit.dart';
import '../cubit/two_step_verify_state.dart';

class CodeVerificationScreen extends StatelessWidget {
  const CodeVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = context.read<TwoStepVerifyCubit>();

    //
    return Scaffold(
      //
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Verification'),
      ),

      //
      body: ListView(
        padding: EdgeInsets.symmetric(
            horizontal: mq.width * .04, vertical: mq.height * .02),
        physics: const BouncingScrollPhysics(),
        //
        children: [
          // otp field
          CustomTextField(
            c: c.etOtp,
            hintText: '- - - - - -',
            keyboardType: TextInputType.number,
            style: const TextStyle(letterSpacing: 3),
            textAlign: TextAlign.center,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(6),
            ],
          ),

          // for giving some space
          SizedBox(height: mq.height * .06),

          //
          BlocSelector<TwoStepVerifyCubit, TwoStepVerifyState, int>(
            selector: (state) => state.secondsRemaining,

            //
            builder: (context, state) => state > 0
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 12),

                    //
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Resend Verification Code in ',
                        style: const TextStyle(color: Colors.black),

                        //
                        children: [
                          TextSpan(
                            text: '00: ${state >= 10 ? '$state' : '0$state'}',
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.black87,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                : CustomTextBtn(onTap: () {}, child: const Text('Resend?')),
          ),

          //
          ElevatedButton(onPressed: () {}, child: const Text('Verify'))
        ].animateListFast,
      ),
    );
  }
}
