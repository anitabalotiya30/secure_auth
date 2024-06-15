import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:secure_auth/helper/extensions.dart';

import '../../../helper/global.dart';
import '../../../services/router/router_name.dart';
import '../../../services/router/router_x.dart';
import '../../../widgets/custom_text_btn.dart';
import '../../../widgets/custom_text_field.dart';
import '../cubit/email_auth_cubit.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = context.read<EmailAuthCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),

      //
      body: ListView(
        padding: EdgeInsets.symmetric(
            horizontal: mq.width * .04, vertical: mq.height * .02),

        //
        children: [
          // password
          CustomTextField(
            c: c.state.email.etEmail,
            hintText: 'Enter Email',
          ),
          SizedBox(height: mq.height * .03),

          // confirm password
          CustomTextField(
            c: c.state.email.etName,
            hintText: 'Enter Password',
          ),
          SizedBox(height: mq.height * .06),

          //
          ElevatedButton(
              onPressed: RouterX.router.pop, child: const Text('Continue')),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Do\'t have an account?'),
              CustomTextBtn(
                  onTap: () => context.goNamed(RouteName.authEmail.name),
                  child: const Text('Sign Up'))
            ],
          ),
        ].animateListFast,
      ),
    );
  }
}
