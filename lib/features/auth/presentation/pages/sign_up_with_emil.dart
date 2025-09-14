import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trackizer/core/cofig/routes/routers_name.dart';
import 'package:trackizer/core/utils/device_utils.dart';
import 'package:trackizer/features/auth/presentation/widgets/auth_header.dart';
import 'package:trackizer/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:trackizer/features/auth/presentation/widgets/primary_button.dart';
import 'package:trackizer/features/auth/presentation/widgets/secondary_button.dart';

class SignUpWithEmil extends StatefulWidget {
  const SignUpWithEmil({super.key});

  @override
  State<SignUpWithEmil> createState() => _SignUpWithEmilState();
}

class _SignUpWithEmilState extends State<SignUpWithEmil> {
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
              AuthTextField(name: 'Email address', controller: emailController),
              SizedBox(height: 10),
              AuthTextField(name: "Password", controller: passController),
              SizedBox(height: 10),

              SizedBox(height: 20),
              PrimaryButton(onPressed: () {}, txt: "Get Started, it's free!"),
              Spacer(),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Do you already have an account?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),
              SizedBox(height: 10),
              SecondaryButton(
                onPressed: () {
                  context.push(RoutersName.signin);
                },
                txt: "Sign in",
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
