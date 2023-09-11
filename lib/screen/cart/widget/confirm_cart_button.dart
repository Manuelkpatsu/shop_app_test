import 'package:flutter/material.dart';

class ConfirmCartButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const ConfirmCartButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: 20,
      onPressed: onPressed,
      icon: const Icon(Icons.done),
    );
  }
}
