import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secure_auth/helper/extensions.dart';

import '../../../helper/global.dart';
import '../../../widgets/custom_text_btn.dart';
import '../../../widgets/custom_text_field.dart';
import '../cubit/email_auth_cubit.dart';

class EmailAuthScreen extends StatelessWidget {
  const EmailAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = context.read<EmailAuthCubit>();

    //
    return Scaffold(
      appBar: AppBar(
        title: const Text('You\'re Just One Step Away'),
      ),

      //
      body: ListView(
        padding: EdgeInsets.symmetric(
            horizontal: mq.width * .04, vertical: mq.height * .02),

        //
        children: [
          // name
          CustomTextField(
            keyboardType: TextInputType.name,
            c: c.state.email.etName,
            hintText: 'Enter Name',
          ),
          SizedBox(height: mq.height * .03),

          // email
          CustomTextField(
            keyboardType: TextInputType.emailAddress,
            c: c.state.email.etEmail,
            hintText: 'Enter Email',
          ),
          SizedBox(height: mq.height * .03),

          // password
          CustomTextField(
            c: c.state.email.etPassword,
            hintText: 'Enter Password',
          ),
          SizedBox(height: mq.height * .03),

          // confirm password
          CustomTextField(
            c: c.state.email.etName,
            hintText: 'Confirm Password',
          ),
          SizedBox(height: mq.height * .06),

          //
          ElevatedButton(onPressed: () {}, child: const Text('Continue')),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Already have an account?'),
              CustomTextBtn(onTap: () {}, child: const Text('Sign In'))
            ],
          )

          //
        ].animateListFast,
      ),
    );
  }
}
