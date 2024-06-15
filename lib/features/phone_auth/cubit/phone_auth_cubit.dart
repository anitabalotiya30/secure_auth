import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'phone_auth_state.dart';

class PhoneAuthCubit extends Cubit<PhoneAuthState> {
  final phoneC = TextEditingController();
  final otpC = TextEditingController();

  Timer? timer;

  PhoneAuthCubit()
      : super(PhoneAuthState(secondsRemaining: 30, enableResend: false));

  void startResendTimer(final int seconds) {
    if (timer != null) {
      timer?.cancel();
      timer = null;
    }

    emit(state.copyWith(secondsRemaining: seconds, enableResend: false));

    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (state.secondsRemaining == 0) {
        emit(state.copyWith(enableResend: true));
        timer?.cancel();
      } else {
        emit(state.copyWith(secondsRemaining: state.secondsRemaining - 1));
      }
    });
  }
}
