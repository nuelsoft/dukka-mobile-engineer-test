import 'package:flutter/material.dart';

class BTN extends StatelessWidget {
  final Function()? onPressed;
  final String text;

  final bool processing;

  const BTN(
      {required this.text, this.onPressed, this.processing = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.black,
          padding: EdgeInsets.symmetric(
            vertical: 15,
          ),
        ),
        onPressed: processing ? null : onPressed,
        child: processing
            ? CircularProgressIndicator()
            : Text(text.toUpperCase()));
  }
}
