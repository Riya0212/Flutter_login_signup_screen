import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pathshala1_0/components/text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        decoration: InputDecoration(
            hintText: "Enter Your Password",
            icon: Icon(
              Icons.lock,
              color: Colors.amber.shade800,
            ),
            suffixIcon: Icon(
              Icons.visibility,
              color: Colors.amber.shade800,
            ),
            border: InputBorder.none),
      ),
    );
  }
}
