import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  
  
  final TextEditingController controller;
  const CustomTextField(
      {super.key,
      
      required this.hint,
      
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          filled: true,
          fillColor: Colors.transparent,
          hintText: hint,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15.0, horizontal: 21.0),
        ),
      ),
    );
  }
}
