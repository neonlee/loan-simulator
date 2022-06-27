import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final void Function() onPressed;
  const Button({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: ElevatedButton(
        onPressed: onPressed,
        child: const Text('continuar'),
      ),
    );
  }
}
