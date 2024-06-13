import 'package:flutter/material.dart';

import '../../../widgets/custom_text_field.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('OTP Verification'),
      ),
      body: Column(
        children: [
          CustomTextField(c: TextEditingController(), hintText: 'Enter OTP')
        ],
      ),
    );
  }
}
