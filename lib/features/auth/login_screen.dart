import 'package:flutter/material.dart';
import 'package:news_app/features/auth/register_screen.dart';
import 'package:news_app/features/home/home_screen.dart';

import '../../core/widgets/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$');
    return emailRegex.hasMatch(email);
  }

  // bool isValidPassword(String password) {
  //   final passwordRegex = RegExp(
  //     r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
  //   );
  //   return passwordRegex.hasMatch(password);
  // }

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFFE7E7E7),
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Image.asset("assets/images/logo.png", height: 45),
                ),
                SizedBox(height: 24),
                Text(
                  "Welcome to Newts",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                ),
                SizedBox(height: 16),
                CustomTextFormField(
                  hintText: 'usama@gmail.com',
                  controller: emailController,
                  title: 'Email',
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter Email";
                    } else {
                      if (!isValidEmail(value)) {
                        return "Please Enter Valid Email";
                      }
                    }
                  },
                ),
                SizedBox(height: 12),
                CustomTextFormField(
                  hintText: '*************',
                  controller: passwordController,
                  title: 'Password',
                  obscureText: true,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter Password";
                    }
                    // else {
                    //   if (!isValidPassword(value)) {
                    //     return "Please Enter Valid Password";
                    //   }
                    // }
                  },
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      }
                    },
                    child: Text("Sign In"),
                  ),
                ),
                SizedBox(height: 35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Don’t have an account ?",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: 8),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
