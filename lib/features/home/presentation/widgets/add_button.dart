import 'package:flutter/material.dart';
import 'package:trackizer/core/utils/tools.dart';

import '../../../../core/const/app_sizes.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 80),
        decoration: BoxDecoration(
          borderRadius: AppSizes.brL,
          border: Border.all(color: appColor.tertiaryContainer),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: tstyle.bodyMedium, textAlign: TextAlign.center),
            sizeH(10),
            const Icon(Icons.add_circle_outline_sharp, size: 20),
          ],
        ),
      ),
    );
  }
}
