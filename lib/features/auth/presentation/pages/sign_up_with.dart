import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trackizer/features/auth/presentation/widgets/auth_header.dart';

import '../../../../core/cofig/routes/app_router.dart';
import '../../../../core/const/assets.dart';
import '../../../../core/utils/device_utils.dart';
import '../../../../core/shared/buttons/secondary_btn.dart';
import '../widgets/social_buttons.dart';

class SignUpWith extends StatelessWidget {
  const SignUpWith({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              //---- Logo
              const AuthHeader(),
              SizedBox(height: DeviceUtils.getScreenHeight(context) * 0.40),
              //---- Sign with apple
              SocialButtons(
                img: Assets.assetsImgApple,
                onPressed: () {},
                txt: "Sign up with Apple",
                color: Colors.black,
                textColor: Colors.white,
              ),
              const SizedBox(height: 10),
              //----- Sign with Google
              SocialButtons(
                img: Assets.assetsImgGoogle,
                onPressed: () {},
                txt: "Sign up with Google",
                color: Colors.white,
                textColor: Colors.black,
              ),
              const SizedBox(height: 10),
              //------ Sign with Facebook
              SocialButtons(
                img: Assets.assetsImgFb,
                onPressed: () {},
                txt: "Sign up with Facebook",
                color: Colors.blue,
                textColor: Theme.of(context).colorScheme.onPrimary,
              ),
              //---- Or text
              const SizedBox(height: 30),
              const Text("or", textAlign: TextAlign.center),
              const Spacer(),
              //----Sign with Email
              Padding(
                padding: const EdgeInsetsGeometry.only(bottom: 10),
                child: SecondaryButton(
                  onPressed: () {
                    context.push(AppRouter.singupWithEmil);
                  },
                  txt: "Sing up with E-mail",
                ),
              ),
              const SizedBox(height: 3),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  'By registering, you agree to out Terms of Use. Learn how we collect, use and share your data.',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
