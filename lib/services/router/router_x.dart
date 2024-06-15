import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/email_auth/screen/email_auth_screen.dart';
import '../../features/email_auth/screen/password_recovery.dart';
import '../../features/email_auth/screen/sign_in_screen.dart';
import '../../features/phone_auth/screen/otp_screen.dart';
import '../../features/phone_auth/screen/phone_auth_screen.dart';
import '../../features/splash/splash_screen.dart';
import '../../features/two_step_verify/screen/code_verification_screen.dart';
import '../../features/two_step_verify/screen/two_step_verify_screen.dart';
import '../../features/two_step_verify/screen/verify_auth_screen.dart';
import 'router_name.dart';

class RouterX {
  //
  static BuildContext get context =>
      router.routerDelegate.navigatorKey.currentState?.overlay?.context ??
      router.routerDelegate.navigatorKey.currentContext!;

  static final router = GoRouter(routes: [
    // splash
    GoRoute(
      name: RouteName.splash.name,
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),

    // phone
    GoRoute(
        name: RouteName.authPhone.name,
        path: '/phone',
        builder: (context, state) => const PhoneAuthScreen(),

        // routes
        routes: [
          // otp
          GoRoute(
            name: RouteName.authOtp.name,
            path: 'otp',
            builder: (context, state) => const OTPScreen(),
          ),

          // email auth
          GoRoute(
              name: RouteName.authEmail.name,
              path: 'email-auth',
              builder: (context, state) => const EmailAuthScreen(),

              //
              routes: [
                GoRoute(
                  name: RouteName.forgotPassword.name,
                  path: 'forgot-password',
                  builder: (context, state) => const ForgotPasswordScreen(),
                ),
              ]),

          //
          GoRoute(
            name: RouteName.authSignin.name,
            path: 'phone-signin',
            builder: (context, state) => const SigninScreen(),
          ),
        ]),

    //
    GoRoute(
        name: RouteName.twoStepVerify.name,
        path: '/two-step-verify',
        builder: (context, state) => const TwoStepVerifyScreen(),
        routes: [
          //
          GoRoute(
              name: RouteName.verifyAuth.name,
              path: 'verify-auth',
              builder: (context, state) => const VerifyAuthScreen()),

          //
          GoRoute(
              name: RouteName.codeVerify.name,
              path: 'code-verify',
              builder: (context, state) => const CodeVerificationScreen()),
        ]),

    //
    // GoRoute(
    //     name: RouteName.authEmail.name,
    //     path: '/email',
    //     builder: (context, state) => const PhoneAuthScreen(),
    //     routes: [
    //       //otp
    //       GoRoute(
    //         name: RouteName.authOtp.name,
    //         path: 'forgot-password',
    //         builder: (context, state) => const OTPScreen(),
    //       ),
    //     ]),
  ]);
}
