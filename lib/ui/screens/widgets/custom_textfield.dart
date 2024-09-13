import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final IconData icon;
  final bool obscureText;
  final String hintText;
  final TextEditingController? controller; // Add controller
  final FormFieldValidator<String>? validator; // Add validator

  const CustomTextfield({
    super.key,
    required this.icon,
    required this.obscureText,
    required this.hintText,
    this.controller, // Accept controller
    this.validator, // Accept validator
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller, // Use controller
      validator: validator, // Use validator
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hintText,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
