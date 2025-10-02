import 'package:flutter/material.dart';

class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({super.key, this.onPressed});
  final void Function()? onPressed; 

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      shape: CircleBorder(),
      onPressed: onPressed,
      child: const Icon(Icons.add),
    );
  }
}
