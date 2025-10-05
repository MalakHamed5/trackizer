import 'package:flutter/material.dart';
import 'package:trackizer/core/utils/tools.dart';

// to fix context you can use approute to get valid context
extension CustomSliverAppBar on SliverAppBar {
  
  ourSliver({required String text, Color? backgroundColor}) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      flexibleSpace: FlexibleSpaceBar(
        title: Center(child: Text(text, style: tstyle.titleLarge)),
      ),
      backgroundColor: backgroundColor,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.settings, color: appColor.tertiaryContainer),
        ),
      ],
    );
  }
}
