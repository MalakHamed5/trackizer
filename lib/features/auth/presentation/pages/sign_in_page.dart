import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trackizer/core/utils/device_utils.dart';
import 'package:trackizer/features/auth/presentation/widgets/auth_header.dart';
import 'package:trackizer/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:trackizer/features/auth/presentation/widgets/primary_button.dart';
import 'package:trackizer/features/auth/presentation/widgets/secondary_button.dart';

import '../../../../core/cofig/routes/routers_name.dart';

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
              AuthHeader(),
              SizedBox(height: DeviceUtils.getScreenHeight(context) * 0.25),
              AuthTextField(name: 'Login', controller: emailController),
              SizedBox(height: 10),
              AuthTextField(name: "Password", controller: passController),
              SizedBox(height: 10),
              Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (val) {},
                    checkColor: Colors.blue,
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.primaryContainer,
                    ),
                  ),
                  Text(
                    "Remember me",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              PrimaryButton(
                onPressed: () {
                  context.go(RoutersName.home);
                },
                txt: "Sign in",
              ),
              Spacer(),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "if you have an account? Sign up",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),
              SizedBox(height: 10),
              SecondaryButton(
                onPressed: () {
                  context.push(RoutersName.signup);
                },
                txt: "Sign up",
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
