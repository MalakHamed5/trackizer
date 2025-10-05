import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:trackizer/core/shared/buttons/secondary_btn.dart';

import '../../../../core/cofig/routes/app_router.dart';
import '../../../../core/const/assets.dart';
import '../../../../core/utils/tools.dart';
import '../widgets/auth_header.dart';
import '../../../../core/shared/buttons/primary_btn.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            Assets.assetsImgWelcomeScreen,
            width: appW,
            height: appH,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const AuthHeader(),
                  const Spacer(),
                  Text(
                    "Welcome! This app is here to inspire, guide, and\n support you every step of the way. Let’s begin the journey together",
                    style: TextStyle(color: appColor.onPrimary, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  PrimaryButton(
                    onPressed: () {
                      context.push(AppRouter.signup);
                    },

                    txt: 'Get Started',
                  ),
                  const SizedBox(height: 20),
                  SecondaryButton(
                    onPressed: () {
                      context.push(AppRouter.signin);
                    },
                    txt: 'I have an account',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
