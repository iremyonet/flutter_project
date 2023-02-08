import 'package:flutter/material.dart';
import 'package:elektraweb_operator/screens/palatte.dart';
class TextInput extends StatelessWidget {
  const TextInput({
    super.key,
    required this.inputType,
    required this.inputAction,
    required this.icon,
    required this.label,
  });
  final IconData icon;
  final String label;
  final TextInputType inputType;
  final TextInputAction inputAction;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xA6d4c6bb), borderRadius: BorderRadius.circular(16)),
        child: TextField(
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
              borderSide: BorderSide(
                  color:Color(0xFFe30d18),
              )
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 10),
            border: InputBorder.none,
            labelText: label,
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Icon(
                icon,
                color: Colors.red,
                size: 22,
              ),
            ),
            labelStyle: kBodyText,
          ),
          style: kBodyText,
          keyboardType: inputType,
          textInputAction: inputAction,
        ),
      ),
    );
  }
}
