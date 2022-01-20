import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pathshala1_0/components/text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;

  const RoundedInputField({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        validator: (input){
          if (input!.isEmpty) return "Required Field";
        },
        //onSaved: (input) => _email= input,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Colors.amber.shade800,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
