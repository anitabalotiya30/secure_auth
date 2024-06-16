import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:secure_auth/services/router/router_name.dart';

import '../../../services/dialog/dialog_x.dart';
import '../../../services/router/router_x.dart';
import '../data/phone_auth_repository.dart';

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

  Future<void> getOtp() async {
    if (phoneC.text.trim().length == 10) {
      await PhoneAuthRepository.verifyPhoneNo(mobileNo: phoneC.text);
    } else {
      DialogX.error(msg: 'Incorrect phone number.');
    }
  }

  Future<void> verifyOtp() async {
    if (otpC.text.trim().length == 6) {
      final verify =
          await PhoneAuthRepository.signInWithCredential(otp: otpC.text);
      if (verify) RouterX.router.goNamed(RouteName.twoStepVerify.name);
    } else {
      DialogX.error(msg: 'Incorrect phone number.');
    }
  }
}
