import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'phone_auth_state.dart';

class PhoneAuthCubit extends Cubit<PhoneAuthState> {
  final phoneC = TextEditingController();
  final otpC = TextEditingController();

  PhoneAuthCubit()
      : super(PhoneAuthState(secondsRemaining: 30, enableResend: false));
}
