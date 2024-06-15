import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secure_auth/features/phone_auth/cubit/phone_auth_cubit.dart';
import 'package:secure_auth/services/router/router_x.dart';

import 'two_step_verify_state.dart';

class TwoStepVerifyCubit extends Cubit<TwoStepVerifyState> {
  final etPhoneNo = TextEditingController();
  final etOtp = TextEditingController();
  final phoneC = RouterX.context.read<PhoneAuthCubit>();
  TwoStepVerifyCubit()
      : super(TwoStepVerifyState(secondsRemaining: 30, enableResend: false));
}
