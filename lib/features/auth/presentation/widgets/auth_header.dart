import 'package:flutter/material.dart';

import '../../../../core/const/assets.dart';
import '../../../../core/utils/device_utils.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Assets.assetsImgAppLogo,
      width: DeviceUtils.getScreenWidth(context) * 0.5,
    );
  }
}
