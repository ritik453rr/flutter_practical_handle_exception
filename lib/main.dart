import 'package:exceptions_handle/utils/routes/routes.dart';
import 'package:exceptions_handle/utils/routes/routes_name.dart';
import 'package:exceptions_handle/view_model/auth_view_model.dart';
import 'package:exceptions_handle/view_model/home_view_model.dart';
import 'package:exceptions_handle/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeViewModel(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RoutesName.splash,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
