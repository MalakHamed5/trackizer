import 'package:flutter/material.dart';

import '../../../../core/utils/device_utils.dart';

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
        horizontal: DeviceUtils.getScreenWidth(context) * 0.04,
        vertical: DeviceUtils.getScreenWidth(context) * 0.01,
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: EdgeInsets.symmetric(
          horizontal: DeviceUtils.getScreenWidth(context) * 0.04,
          vertical: DeviceUtils.getScreenWidth(context) * 0.02,
        ),
        //img
        leading: Image.asset(img),
        //title
        title: Text(title),
        //price
        trailing: Text(
          price,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: DeviceUtils.getScreenWidth(context) * 0.04,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: Theme.of(context).colorScheme.secondaryContainer,
          ),
        ),
      ),
    );
  }
}
