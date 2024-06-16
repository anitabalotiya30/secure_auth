import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secure_auth/features/phone_auth/data/phone_auth_repository.dart';
import 'package:secure_auth/services/router/router_name.dart';

import '../../../helper/global.dart';
import '../../../services/router/router_x.dart';
import '../../../widgets/custom_text_btn.dart';
import '../../../widgets/custom_text_field.dart';
import '../cubit/phone_auth_cubit.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = context.read<PhoneAuthCubit>();

    //
    return Scaffold(
      //
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('OTP Verification'),
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
            c: c.otpC,
            hintText: '- - - - - -',
            keyboardType: TextInputType.number,
            style: const TextStyle(letterSpacing: 3),
            textAlign: TextAlign.center,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(6),
            ],
            onSubmitted: (v) => c.verifyOtp(),
          ),

          // for giving some space
          SizedBox(height: mq.height * .06),

          //
          BlocSelector<PhoneAuthCubit, PhoneAuthState, int>(
            selector: (state) => state.secondsRemaining,

            //
            builder: (context, state) => state < 0
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 12),

                    //
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Resend OTP in ',
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
                : CustomTextBtn(
                    onTap: () => PhoneAuthRepository.verifyPhoneNo(
                        mobileNo: c.phoneC.text),
                    child: const Text('Resend?')),
          ),

          //
          ElevatedButton(onPressed: c.verifyOtp, child: const Text('Submit'))
        ],
      ),
    );
  }
}
