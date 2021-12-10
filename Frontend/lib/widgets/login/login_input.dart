import 'package:flutter/material.dart';
import 'package:vot_senat_client/utils/validator.dart';

class LoginInputFied extends StatelessWidget {
  final String title;
  final bool isPassword;
  final String hintText;
  final TextEditingController controller;

  const LoginInputFied({
    Key? key,
    this.title = '',
    this.isPassword = false,
    this.hintText = '',
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      margin: const EdgeInsets.symmetric(vertical: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text(
              title,
              style: const TextStyle(fontSize: 15),
            ),
          ),
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              prefixIcon: isPassword
                  ? const Icon(
                      Icons.security,
                      color: Colors.blue,
                    )
                  : const Icon(Icons.account_circle_rounded, color: Colors.blue),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.blue),
              ),
            ),
            validator: Validator.checkEmptyField,
            obscureText: isPassword,
          ),
        ],
      ),
    );
  }
}
