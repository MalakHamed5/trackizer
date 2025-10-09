import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trackizer/core/config/routes/app_router.dart';
import 'package:trackizer/core/utils/device_utils.dart';
import 'package:trackizer/features/auth/presentation/widgets/auth_header.dart';
import 'package:trackizer/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:trackizer/core/shared/buttons/primary_btn.dart';
import 'package:trackizer/core/shared/buttons/secondary_btn.dart';

import '../../../../core/utils/tools.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const AuthHeader(),
              SizedBox(height: appH * 0.25),
              AuthTextField(name: 'Login', controller: emailController),
              const SizedBox(height: 10),
              AuthTextField(name: "Password", controller: passController),
              const SizedBox(height: 10),
              Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (val) {},
                    checkColor: Colors.blue,
                    side: BorderSide(color: appColor.primaryContainer),
                  ),
                  Text(
                    "Remember me",
                    style: TextStyle(color: appColor.onSecondary),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(color: appColor.onSecondary),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              PrimaryButton(
                onPressed: () {
                  context.go(AppRouter.home);
                },
                txt: "Sign in",
              ),
              const Spacer(),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "if you have an account? Sign up",
                  style: TextStyle(color: appColor.onPrimary),
                ),
              ),
              const SizedBox(height: 10),
              SecondaryButton(
                onPressed: () {
                  context.push(AppRouter.signup);
                },
                txt: "Sign up",
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
