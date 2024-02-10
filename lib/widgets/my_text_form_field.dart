import 'package:flutter/material.dart';

class MyFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final TextInputType textInputType;
  final IconData icon;
  final String? Function(String?)? validator;

  const MyFormField({
    super.key,
    required this.controller,
    required this.label,
    this.textInputType = TextInputType.text,
    required this.icon,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: TextFormField(
        controller: controller,
        keyboardType: textInputType,
        style: const TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          label: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          hintText: 'pleas enter your $label',
          hintStyle: const TextStyle(
            color: Colors.white,
          ),
          suffixIcon: Icon(
            icon,
            color: Colors.white,
          ),
          filled: true,
          fillColor: Colors.teal,
        ),
        validator: validator,
      ),
    );
  }
}
