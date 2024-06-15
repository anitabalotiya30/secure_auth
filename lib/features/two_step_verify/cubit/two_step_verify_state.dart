final class TwoStepVerifyState {
  final int secondsRemaining;
  final bool enableResend;

  TwoStepVerifyState({
    required this.secondsRemaining,
    required this.enableResend,
  });

  TwoStepVerifyState copyWith({
    int? secondsRemaining,
    bool? enableResend,
  }) {
    return TwoStepVerifyState(
      secondsRemaining: secondsRemaining ?? this.secondsRemaining,
      enableResend: enableResend ?? this.enableResend,
    );
  }
}
