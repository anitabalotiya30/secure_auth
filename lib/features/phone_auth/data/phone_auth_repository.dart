import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class PhoneAuthRepository {
  static final firebaseAuth = FirebaseAuth.instance;
  static String verifyId = '';
  static int? _resendToken;

  //
  static void verifyPhoneNo(
      {required String mobileNo, required String countryCode}) async {
    if (mobileNo.isNotEmpty) {
      try {
        // MyDialogs.showProgressBar();
        // phoneNo = mobileNo;
        final phoneNoWithCode = '+91$mobileNo';

        log('phoneNoWithCode ----- $phoneNoWithCode, verifyId ------ $verifyId, resendToken ----- $_resendToken');
        await firebaseAuth.verifyPhoneNumber(
            phoneNumber: phoneNoWithCode,
            timeout: const Duration(seconds: 30),
            forceResendingToken: _resendToken,

            //
            verificationCompleted: (PhoneAuthCredential credential) async {
              // ANDROID ONLY!

              // Sign the user in (or link) with the auto-generated credential
              await firebaseAuth.signInWithCredential(credential);
            },

            //
            verificationFailed: (FirebaseAuthException e) {
              // Get.back();
              if (e.code == 'invalid-phone-number') {
                // MyDialogs.error(msg: 'You\'ve provided wrong number.');
                log(e.toString());
              }
            },
            codeSent: (String verificationId, int? forceResendingToken) async {
              // Get.back();
              _resendToken = forceResendingToken;
              verifyId = verificationId;
              // Get.to(() => OtpSCreen(phoneNo: phoneNoWithCode));
            },
            codeAutoRetrievalTimeout: (String verificationId) {});
      } catch (e) {
        // Get.back();
        // MyDialogs.error(
        //     msg: 'Something went wrong.\nPease try again after sometimes.');
        log(e.toString());
      }
    } else {
      // MyDialogs.error(msg: 'Please provide the Mobile Number.');
    }
  }
}
