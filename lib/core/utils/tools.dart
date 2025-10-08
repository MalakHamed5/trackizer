import 'package:flutter/material.dart';

import '../cofig/routes/app_router.dart';
import 'device_utils.dart';

//--- Context ---//
final ctx = AppRouter.router.configuration.navigatorKey.currentState!.context;

//--- Colors ---//
final tstyle = Theme.of(ctx).textTheme;
final appColor = Theme.of(ctx).colorScheme;

//--- Device Size ---//
final appH = DeviceUtils.getScreenHeight(ctx);
final appW = DeviceUtils.getScreenWidth(ctx);
final appS = DeviceUtils.getScreenSize(ctx);

//--- SizedBox ---//
SizedBox sizeH(double height) {
  return SizedBox(height: height);
}
SizedBox sizeW(double width) {
  return SizedBox(width: width);
}
