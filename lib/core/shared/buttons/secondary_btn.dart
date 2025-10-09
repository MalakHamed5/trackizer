// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../../utils/tools.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    required this.onPressed,
    required this.txt,
    this.img,
  });
  final void Function()? onPressed;
  final String txt;
  final String? img;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: appColor.surface.withOpacity(0.3),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: appColor.onPrimary.withOpacity(0.1)),
        ),
        child: Center(
          child: Text(
            txt,
            style: TextStyle(
              color: appColor.onPrimary,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
