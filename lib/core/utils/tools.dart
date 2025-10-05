import 'package:flutter/material.dart';

import '../cofig/routes/app_router.dart';
import 'device_utils.dart';

final ctx = AppRouter.router.configuration.navigatorKey.currentState!.context;

final tstyle = Theme.of(ctx).textTheme;

final appColor = Theme.of(ctx).colorScheme;

//--- Device Size ---//
final appH = DeviceUtils.getScreenHeight(ctx);
final appW = DeviceUtils.getScreenWidth(ctx);
final appS = DeviceUtils.getScreenSize(ctx);
