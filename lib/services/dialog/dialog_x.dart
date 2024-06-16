import 'dart:developer';

import 'package:flutter/material.dart';

import '../../widgets/custom_loading.dart';
import '../router/router_x.dart';

class DialogX {
  static final snackbarKey = GlobalKey<ScaffoldMessengerState>();

  //show snackbar
  static void showSnackbar(final SnackBar snackBar) {
    try {
      snackbarKey.currentState?.showSnackBar(snackBar);
    } catch (e) {
      log('_showSnackbar: $e');
    }
  }

  //error
  static void error({required String msg}) {
    final snackBar = SnackBar(
      content: Text(
        msg,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.redAccent.withOpacity(.8),
    );

    showSnackbar(snackBar);
  }

  //success
  static void success({required String msg}) {
    final snackBar = SnackBar(
      content: Text(
        msg,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.green.withOpacity(.8),
    );

    showSnackbar(snackBar);
  }

  //info
  static void info({required String msg}) {
    final snackBar = SnackBar(
      content: Text(
        msg,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.black,
    );

    showSnackbar(snackBar);
  }

  //show common progress
  static void showProgressBar() =>
      dialog(const Center(child: CustomLoading(color: Colors.white)));

  // show dialog
  static void dialog(final Widget widget) {
    try {
      log('dialog called');

      //
      showDialog(
        context: RouterX.context,
        builder: (_) => Center(child: widget),
      );

      log('dialog executed');
    } catch (e) {
      log('_showDialog: $e');
    }
  }

  static void fullScreenDialog(final Widget widget) {
    try {
      //
      showDialog(
        context: RouterX.context,
        useSafeArea: false,
        builder: (_) => Center(child: widget),
      );
    } catch (e) {
      log('_fullScreenDialog: $e');
    }
  }
}
