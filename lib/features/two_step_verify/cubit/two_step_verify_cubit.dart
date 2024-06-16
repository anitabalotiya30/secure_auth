import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../services/router/router_x.dart';
import '../../phone_auth/cubit/phone_auth_cubit.dart';
import 'two_step_verify_state.dart';

class TwoStepVerifyCubit extends Cubit<TwoStepVerifyState> {
  final etPhoneNo = TextEditingController();
  final etOtp = TextEditingController();
  final phoneAuthCubit = RouterX.context.read<PhoneAuthCubit>();
  TwoStepVerifyCubit()
      : super(TwoStepVerifyState(secondsRemaining: 30, enableResend: false));
}
