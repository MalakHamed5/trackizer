import 'package:flutter/material.dart';
import 'package:trackizer/features/auth/presentation/widgets/primary_button.dart';

import '../../../../core/const/assets.dart';
import '../../../../core/utils/device_utils.dart';

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
              Image.asset(
                Assets.assetsImgAppLogo,
                width: DeviceUtils.getScreenWidth(context) * 0.5,
              ),
              SizedBox(height: DeviceUtils.getScreenHeight(context) * 0.25),
              //---- Sign with apple
              PrimaryButton(
                img: Assets.assetsImgAppIcon,
                onPressed: () {},
                txt: "Sign up with Apple",
                sizeText: 16,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              SizedBox(height: 10),
              //----- Sign with Google
              PrimaryButton(
                img: Assets.assetsImgGoogle,
                onPressed: () {},
                txt: "Sign up with Google",
                sizeText: 16,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              SizedBox(height: 10),
              //------ Sign with Facebook
              PrimaryButton(
                img: Assets.assetsImgFb,
                onPressed: () {},
                txt: "Sign up with Facebook",
                sizeText: 16,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text("or", textAlign: TextAlign.center),

              //----Sign with Email
              Padding(
                padding: EdgeInsetsGeometry.only(bottom: 30),
                child: PrimaryButton(
                  onPressed: () {},
                  txt: "Sing up with E-mail",
                  sizeText: 14,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: 3),
              Text(
                'By registering, you agree to out Terms of Use. Learn how we collect, use and share your data.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
