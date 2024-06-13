import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/email_auth/screen/email_auth_screen.dart';
import '../../features/email_auth/screen/password_recovery.dart';
import '../../features/phone_auth/screen/otp_screen.dart';
import '../../features/phone_auth/screen/phone_auth_screen.dart';
import '../../features/splash/splash_screen.dart';
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
