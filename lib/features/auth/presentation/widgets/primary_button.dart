import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.txt,
    required this.sizeText,
    required this.decoration,
    this.img,
  });
  final void Function()? onPressed;
  final String txt;
  final double sizeText;
  final Decoration decoration;
  final String? img;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: decoration,
        child: Row(
          children: [
            if (img != null) ...[
              Image.asset(img!, width: 20, height: 20, fit: BoxFit.cover),
              SizedBox(width: 8),
            ],

            Text(
              txt,
              style: TextStyle(
                color: Colors.white,
                fontSize: sizeText,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

/**BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Theme.of(
                context,
                // ignore: deprecated_member_use
              ).colorScheme.secondary.withOpacity(0.5),
              blurRadius: 15,
              offset: Offset(0, 7),
            ),
          ],
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(20),
        ), */
