import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).brightness == Brightness.dark
             ?const Color.fromARGB(255, 0, 0, 0).withOpacity(0.2)
             : Colors.black.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
            color: Colors.grey[600],
            fontSize: 16,
          ),
          filled: true,
          fillColor: Theme.of(context).brightness == Brightness.dark
        ? Colors.black
        : const Color.fromARGB(207, 255, 255, 255),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2),
            borderSide: BorderSide(
              color:  Theme.of(context).brightness == Brightness.dark
             ?const Color.fromARGB(210, 42, 42, 42):const Color.fromARGB(255, 255, 255, 255),
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2),
            borderSide:  BorderSide(
              color: Theme.of(context).brightness == Brightness.dark
        ? const Color.fromARGB(255, 41, 41, 41)
        : const Color.fromARGB(255, 255, 255, 255),
              width: 1,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 16,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
        ),
        keyboardType: keyboardType,
        obscureText: obscureText,
        validator: validator,
        style: TextStyle(
          fontSize: 16,
          color: Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.black,
        ),
      ),
    );
  }
}