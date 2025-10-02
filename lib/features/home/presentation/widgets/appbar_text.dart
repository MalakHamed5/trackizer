import 'package:flutter/material.dart';


class AppBarText extends StatelessWidget {
  const AppBarText({super.key, required this.text, required this.backgroundColor});
  final String text;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      flexibleSpace: FlexibleSpaceBar(
        title: Center(
          child: Text(text, style: Theme.of(context).textTheme.titleLarge),
        ),
      ),
      backgroundColor: backgroundColor,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.settings,
            color: Theme.of(context).colorScheme.tertiaryContainer,
          ),
        ),
      ],
    );
  }
}
