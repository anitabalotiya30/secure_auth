import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'email_auth_state.dart';

class EmailAuthCubit extends Cubit<EmailAuthState> {
  EmailAuthCubit() : super(EmailAuthState());
}
