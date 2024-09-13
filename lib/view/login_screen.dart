import 'package:exceptions_handle/res/components/round_button.dart';
import 'package:exceptions_handle/utils/routes/routes_name.dart';
import 'package:exceptions_handle/utils/utils.dart';
import 'package:exceptions_handle/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool visibility = false; //password visibility

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Login",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Email Field...
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
              labelText: "Email",
              prefixIcon: Icon(Icons.email),
            ),
          ),
          //Space..
          const SizedBox(
            height: 10,
          ),
          //Password Field...
          TextFormField(
            controller: passwordController,
            obscureText: !visibility,
            decoration: InputDecoration(
              labelText: "Password",
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    visibility = !visibility;
                  });
                },
                icon: visibility
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.085,
          ),
          RoundButton(
            onPress: () {
              if (emailController.text.isEmpty) {
                Utils.flushBarErrorMessages("Please Enter Email", context);
              } else if (passwordController.text.isEmpty) {
                Utils.flushBarErrorMessages("Please Enter Password", context);
              } else {
                Map data = {
                  "email": emailController.text,
                  "password": passwordController.text,
                };
                authViewModel.loginApi(data, context);
              }
            },
            title: "Login",
            loading: authViewModel.loading,
          ),
          SizedBox(
            height: height * 0.02,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, RoutesName.signUp);
            },
            child: const Text(
              "Don't have an account? Sign Up",
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
