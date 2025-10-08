// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trackizer/features/home/data/models/user_model.dart';

import '../../cofig/routes/app_router.dart';
import '../../const/assets.dart';
import '../../utils/tools.dart';

class CustomTextAppBar extends StatelessWidget {
   CustomTextAppBar({
    super.key,
    required this.title,
    this.backgroundColor = Colors.transparent,
    this.showLeadingIcon = true,
  });
  final String title;
  final Color backgroundColor;
  final bool showLeadingIcon;
  final user = UserModel(
    id: '323',
    name: 'malak',
    email: "malakhamed@gmail.com",
    img: Assets.assetsImgU1,
  );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: Text(
        title,
        style: TextStyle(color: appColor.onTertiary, fontSize: 20),
      ),
      backgroundColor: backgroundColor,
      actions: [
        IconButton(
          onPressed: () {
            context.push(AppRouter.setting, extra: user);
          },
          icon: Icon(
            Icons.settings,
            color: appColor.tertiaryContainer.withOpacity(0.8),
            size: 25,
          ),
        ),
      ],
      leading: showLeadingIcon
          ? IconButton(
              onPressed: () {
                context.pop();
              },
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: appColor.tertiaryContainer,
              ),
            )
          : null,
    );
  }
}
