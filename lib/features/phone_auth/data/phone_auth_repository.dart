import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:secure_auth/helper/endpoints.dart';

import '../../../services/dialog/dialog_x.dart';
import '../../../services/pref.dart';
import '../../../services/router/router_name.dart';
import '../../../services/router/router_x.dart';

class PhoneAuthRepository {
  static final firebaseAuth = FirebaseAuth.instance;
  static String verifyId = '';
  static int? _resendToken;

  //
  static Future<void> verifyPhoneNo({required String mobileNo}) async {
    try {
      DialogX.showProgressBar();
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
            RouterX.router.pop();
            if (e.code == 'invalid-phone-number') {
              DialogX.error(msg: 'You\'ve provided wrong number.');
              log(e.toString());
            }
          },
          codeSent: (String verificationId, int? forceResendingToken) async {
            log('verificationId --- $verificationId');
            RouterX.router.pop();
            _resendToken = forceResendingToken;
            verifyId = verificationId;
            RouterX.router.goNamed(RouteName.authOtp.name);
          },
          codeAutoRetrievalTimeout: (String verificationId) {
            RouterX.router.pop();
            DialogX.error(
                msg:
                    'The sms code has expired. Please re-send the verification code to try again.');
          });
    } catch (e) {
      RouterX.router.pop();
      DialogX.error(
          msg: 'Something went wrong.\nPease try again after sometimes.');
      log(e.toString());
    }
  }

  static Future<bool> signInWithCredential({required String otp}) async {
    try {
      // MyDialogs.showProgressBar();
      DialogX.showProgressBar();

      // Sign the user in (or link) with the credential
      final credentials = await firebaseAuth.signInWithCredential(

          // Create a PhoneAuthCredential with the code
          PhoneAuthProvider.credential(verificationId: verifyId, smsCode: otp));

      if (credentials.user != null) {
        Pref.userUid = credentials.user?.uid;
        Pref.signedIn = true;
        Pref.phoneSignin = true;
        return true;
      }
      RouterX.router.pop();
      return false;
    } on FirebaseAuthException catch (e) {
      log('err --- ${e.code}');
      RouterX.router.pop();
      DialogX.error(
          msg: 'Something went wrong.\nPlease try again after sometimes.');
      log('Error: $e');
      return false;
    }
  }

  Future<bool> twoStepVerification(Map<String, dynamic> jsonBody) async {
    try {
      final response =
          await http.post(Uri.parse(verifyOtp), body: jsonEncode(jsonBody));

      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      log('$e');
      DialogX.error(
          msg: 'Something went wrong.\nPease try again after sometimes.');
      return false;
    }
  }
}
