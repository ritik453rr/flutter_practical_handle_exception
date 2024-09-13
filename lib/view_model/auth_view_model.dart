import 'package:exceptions_handle/model/user_model.dart';
import 'package:exceptions_handle/repository/auth_repository.dart';
import 'package:exceptions_handle/utils/routes/routes_name.dart';
import 'package:exceptions_handle/utils/utils.dart';
import 'package:exceptions_handle/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();
  bool _loading = false;
  bool _signUpLoading = false;

  bool get loading => _loading;
  bool get signUpLoading => _signUpLoading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setSignUpLoading(bool value) {
    _signUpLoading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.loginApi(data).then((value) {
      setLoading(false);
      final userPreferences =
          Provider.of<UserViewModel>(context, listen: false);
      userPreferences.saveUser(
        UserModel(
          token: value['token'].toString(),
        ),
      );
      Utils.flushBarErrorMessages("Login Successfully", context);
      Navigator.pushNamed(context, RoutesName.home);
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessages(error.toString(), context);
    });
  }

  Future<void> signUpApi(dynamic data, BuildContext context) async {
    setSignUpLoading(true);
    _myRepo.signUpApi(data).then((value) {
      setSignUpLoading(false);
      Utils.flushBarErrorMessages("SignUp Successfully", context);
      Navigator.pushNamed(context, RoutesName.home);
      print(value.toString());
    }).onError((error, stackTrace) {
      setSignUpLoading(false);
      Utils.flushBarErrorMessages(error.toString(), context);
    });
  }
}
