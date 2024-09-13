import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  //Toast Message
  static toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message, webPosition: "center", textColor: Colors.black);
  }

  //FlushBar..
  static void flushBarErrorMessages(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.decelerate,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        padding: const EdgeInsets.all(15),
        reverseAnimationCurve: Curves.easeInOut,
        positionOffset: 20,
        flushbarPosition: FlushbarPosition.TOP,
        icon: const Icon(
          Icons.error,
          size: 28,
          color: Colors.white,
        ),
        message: message,
        borderRadius: BorderRadius.circular(8),
        title: "Error",
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
      )..show(
          context,
        ),
    );
  }

  //SnackBar...
  static snackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }
}
