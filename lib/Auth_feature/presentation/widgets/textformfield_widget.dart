import 'package:flutter/material.dart';

class AuthTextFormField extends StatelessWidget {
  final String hintmessage;
  final bool? isObsecure;
  final IconData icon;
  final TextEditingController controller;
  final TextInputType textInputType;

  const AuthTextFormField(
      {super.key,
      required this.hintmessage,
      required this.controller,
      this.isObsecure,
      required this.textInputType,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 5,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        //textform field
        child: TextFormField(
          controller: controller,
          obscureText: isObsecure == true ? true : false,
          keyboardType: textInputType,
          //its decoration
          decoration: InputDecoration(
            icon: Icon(
              icon,
              color: Colors.grey[300],
            ),
            hintText: hintmessage,
            border: InputBorder.none,
            enabledBorder: null,
            hintStyle: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }

  _getKeyboardType() {}
}
