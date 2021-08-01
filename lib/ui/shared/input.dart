import 'package:dukka/ui/utils.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController? controller;
  final String label;
  final String? Function(String?)? validator;
  final bool required;
  final TextInputType? inputType;
  final TextInputAction action;
  final TextCapitalization? capitalization;

  const InputField(this.label,
      {Key? key,
      this.controller,
      this.inputType,
      this.action = TextInputAction.next,
      this.capitalization,
      this.validator,
      this.required = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$label${required ? "*" : ""}"),
        Space.Y(10),
        TextFormField(
          controller: controller,
          validator: (value) {
            if (required) if (value!.trim().isEmpty)
              return "Please enter ${label.toLowerCase()}";
            if (validator != null) return validator!(value);
          },
          textInputAction: action,
          keyboardType: inputType,
          textCapitalization: capitalization ?? TextCapitalization.none,
          decoration: InputDecoration(
              border: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
          )),
        ),
      ],
    );
  }
}

enum InputType { cappedWords, number, email }
