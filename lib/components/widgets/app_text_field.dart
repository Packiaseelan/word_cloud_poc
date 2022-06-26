import 'package:flutter/material.dart';

class AppFormTextField extends StatelessWidget {
  final String hint;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  final TextInputType? keyboardType;
  final TextEditingController? controller;

  const AppFormTextField({
    Key? key,
    required this.hint,
    this.validator,
    this.onSaved,
    this.keyboardType,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: ValueKey(hint),
      controller: controller,
      decoration: InputDecoration(
        labelText: hint,
        labelStyle: Theme.of(context).textTheme.bodyMedium,
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
        ),
      ),
      keyboardType: keyboardType ?? TextInputType.text,
      autocorrect: false,
      textCapitalization: TextCapitalization.none,
      enableSuggestions: false,
      validator: validator,
      onSaved: onSaved,
    );
  }
}
