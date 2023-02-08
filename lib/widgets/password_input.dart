import 'package:elektraweb_operator/screens/palatte.dart';
import 'package:flutter/material.dart';
import '';

class PasswordInput extends StatefulWidget {
  PasswordInput({
    super.key,
    required this.inputAction,
    required this.icon,
    required this.hint,
  });
  final IconData icon;
  final String hint;

  final TextInputAction inputAction;

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xA6d4c6bb), borderRadius: BorderRadius.circular(13)),
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
            labelText: widget.hint,
            prefixIcon: const Icon(Icons.lock, color: Color(0xFFe30d18)),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isVisible = !isVisible;
                });
              },
              icon: Icon(
                !isVisible ? Icons.visibility : Icons.visibility_off,
                  color: Color(0xFFe30d18),
                size: 22,
              ),
            ),
            labelStyle: kBodyText,
          ),
          obscureText: isVisible,
          style: kBodyText,
          textInputAction: widget.inputAction,
        ),
      ),
    );
  }
}
