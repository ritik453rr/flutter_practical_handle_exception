import 'package:exceptions_handle/model/user_model.dart';
import 'package:exceptions_handle/utils/routes/routes_name.dart';
import 'package:exceptions_handle/view_model/user_view_model.dart';
import 'package:flutter/material.dart';

class SplashServices {
  Future<UserModel> getUserData() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) async {
    getUserData().then((value) async {
      if (value.token == 'null' || value.token == "") {
        await Future.delayed(Duration(seconds: 2));
        Navigator.pushNamed(context, RoutesName.login);
      } else {
        await Future.delayed(Duration(seconds: 2));
        Navigator.pushNamed(context, RoutesName.home);
      }
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
    });
  }
}
