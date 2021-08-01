import 'package:flutter/material.dart';

class Samasys extends StatelessWidget {
  const Samasys({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topRight,
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "SAMASYS",
          style: const TextStyle(letterSpacing: 20),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Text(
            "combat salary fraud",
            style: const TextStyle(fontSize: 13),
          ),
        )
      ],
    ));
  }
}
