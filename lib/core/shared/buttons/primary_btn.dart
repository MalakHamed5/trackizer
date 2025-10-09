import 'package:flutter/material.dart';
import 'package:trackizer/core/utils/tools.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
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
          boxShadow: [
            BoxShadow(
              color: appColor.secondary.withOpacity(0.5),
              blurRadius: 15,
              offset: const Offset(0, 7),
            ),
          ],
          color: appColor.secondary,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            txt,
            style: TextStyle(
              color: appColor.onPrimary,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
