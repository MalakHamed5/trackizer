// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:go_router/go_router.dart';
import 'package:trackizer/core/utils/tools.dart';

import '../../../../core/config/routes/app_router.dart';
import '../../../../core/const/app_colors.dart';
import '../../../../core/const/assets.dart';

class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      key: UniqueKey(),
      icon: Icons.add_rounded,
      activeIcon: Icons.close_rounded,
      backgroundColor: appColor.secondary,
      curve: Curves.easeInOut,
      overlayColor: Colors.black,
      overlayOpacity: 0.7,
      spaceBetweenChildren: 10,
      childrenButtonSize: const Size(56, 56),
      children: [
        //new sub
        _labelName(
          onTap: () {
            context.push(AppRouter.sub);
          },
          icon: Icon(Icons.subscriptions, color: appColor.onPrimary),
          title: "Add Sub",
        ),
        //new exp
        _labelName(
          onTap: () {},
          icon: Icon(Icons.monetization_on_rounded, color: appColor.onPrimary),
          title: "Add Exp",
        ),
        //audo
        _labelName(
          onTap: () {},
          icon: Image.asset(
            Assets.assetsIconsMic,
            fit: BoxFit.cover,
            height: 20,
            width: 10,
            color: appColor.onPrimary,
          ),
          title: "Audio",
        ),
      ],
    );
  }

  SpeedDialChild _labelName({
    required VoidCallback onTap,
    required Widget icon,
    required String title,
  }) {
    return SpeedDialChild(
      onTap: onTap,
      child: icon,
      labelWidget: _chip(title),
      backgroundColor: Theme.of(ctx).colorScheme.secondary,
      shape: const CircleBorder(),
    );
  }
}

//---for decoration
Widget _chip(String text) => Container(
  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
  margin: const EdgeInsets.only(right: 8),
  decoration: BoxDecoration(
    color: AppColors.gray.withOpacity(0.7),
    borderRadius: BorderRadius.circular(12),
    border: Border.all(color: appColor.onPrimary.withOpacity(0.25)),
    boxShadow: const [
      BoxShadow(blurRadius: 10, offset: Offset(0, 2), color: Color(0x33000000)),
    ],
  ),
  child: Text(
    text,
    style: TextStyle(color: appColor.onPrimary, fontWeight: FontWeight.w600),
  ),
);
