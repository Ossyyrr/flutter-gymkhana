import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({Key? key, this.hintText, this.labelText, this.onChanged}) : super(key: key);
  final String? hintText;
  final String? labelText;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        icon: const Icon(Icons.title),
        hintText: hintText,
        labelText: labelText,
      ),
      onChanged: onChanged,
    );
  }
}
