import 'package:flutter/material.dart';

import '../../core/widgets/custom_text_form_field.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(child: Image.asset("assets/images/logo.png", height: 45)),
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
              ),
              SizedBox(height: 12),
              CustomTextFormField(
                hintText: '*************',
                controller: passwordController,
                title: 'Password',
                obscureText: true,
              ),
              SizedBox(height: 12),
              CustomTextFormField(
                hintText: '*************',
                controller: confirmPasswordController,
                title: 'Confirm Password',
                obscureText: true,
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(onPressed: () {}, child: Text("Sign Up")),
              ),
              SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Have an account ?",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Sign In",
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
    );
  }
}
