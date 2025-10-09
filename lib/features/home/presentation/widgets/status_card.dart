import 'package:flutter/material.dart';

import '../../../../core/utils/tools.dart';

class StatusCard extends StatelessWidget {
  const StatusCard({
    super.key,
    required this.title,
    required this.count,
    required this.onTap,
    required this.color,
  });

  final String title;
  final String count;
  final VoidCallback? onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final screenWidth = appW;
    return InkWell(
      onTap: onTap,
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 4,
        shadowColor: appColor.secondary.withOpacity(0.15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: BorderSide(color: appColor.primaryContainer),
        ),
        color: appColor.secondaryContainer,
        child: Column(
          children: [
            // --- colored line
            Container(width: screenWidth * 0.12, height: 2.5, color: color),
            // --- title and count
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: screenWidth * 0.035,
                horizontal: screenWidth * 0.04,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: appColor.onTertiary,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.6,
                      fontSize: screenWidth * 0.032,
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.01),
                  Text(
                    count,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: screenWidth * 0.05,
                      color: appColor.onPrimary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
