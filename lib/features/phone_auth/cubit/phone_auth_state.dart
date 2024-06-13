part of 'phone_auth_cubit.dart';

final class PhoneAuthState {
  final int secondsRemaining;
  final bool enableResend;

  PhoneAuthState({
    required this.secondsRemaining,
    required this.enableResend,
  });

  PhoneAuthState copyWith({
    int? secondsRemaining,
    bool? enableResend,
  }) {
    return PhoneAuthState(
      secondsRemaining: secondsRemaining ?? this.secondsRemaining,
      enableResend: enableResend ?? this.enableResend,
    );
  }
}
