import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:trackizer/core/utils/device_utils.dart';

import '../../../../core/const/app_routers.dart';
import '../../../../core/const/assets.dart';
import '../widgets/primary_button.dart';

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
            width: DeviceUtils.getScreenWidth(context),
            height: DeviceUtils.getScreenHeight(context),
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    Assets.assetsImgAppLogo,
                    width: DeviceUtils.getScreenWidth(context) * 0.5,
                  ),
                  Spacer(),
                  Text(
                    "Welcome! This app is here to inspire, guide, and\n support you every step of the way. Let’s begin the journey together",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  PrimaryButton(
                    onPressed: () {},
                    txt: 'Get Started',
                    sizeText: 16,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(
                            context,
                            // ignore: deprecated_member_use
                          ).colorScheme.secondary.withOpacity(0.5),
                          blurRadius: 15,
                          offset: Offset(0, 7),
                        ),
                      ],
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  SizedBox(height: 20),
                  PrimaryButton(
                    onPressed: () {
                      context.push(AppRouter.signup);
                    },
                    txt: 'I have an account',
                    sizeText: 14,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(20),
                    ),
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
