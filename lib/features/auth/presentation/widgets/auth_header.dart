import 'package:flutter/material.dart';

import '../../../../core/const/assets.dart';
import '../../../../core/utils/tools.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(Assets.assetsImgAppLogo, width: appW * 0.5);
  }
}
