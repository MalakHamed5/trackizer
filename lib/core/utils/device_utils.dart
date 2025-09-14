import 'package:flutter/widgets.dart';

class DeviceUtils {
  static Size getScreenSize(BuildContext context) {
    return MediaQuery.sizeOf(context);
  }

  static getScreenWidth(BuildContext context) {
    return getScreenSize(context).width;
  }

  static double getScreenHeight(BuildContext context) {
    return getScreenSize(context).height;
  }
}
