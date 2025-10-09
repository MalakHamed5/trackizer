import 'package:flutter/material.dart';

import '../../../../core/const/app_sizes.dart';
import '../../../../core/utils/tools.dart';

class ListTileActive extends StatelessWidget {
  const ListTileActive({
    super.key,
    required this.img,
    required this.title,
    required this.price,
    required this.onTap,
  });

  final String img;
  final String title;
  final String price;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: appW * 0.04,
        vertical: appW * 0.01,
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: EdgeInsets.symmetric(
          horizontal: appW * 0.04,
          vertical: appW * 0.02,
        ),
        //img
        leading: Image.asset(img),
        //title
        title: Text(title),
        //price
        trailing: Text(
          price,
          style: TextStyle(color: appColor.onPrimary, fontSize: appW * 0.04),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: AppSizes.brL,
          side: BorderSide(color: appColor.secondaryContainer),
        ),
      ),
    );
  }
}
