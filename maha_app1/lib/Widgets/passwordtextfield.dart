import 'package:flutter/material.dart';

class PasswordTextFormField extends StatelessWidget {
  //const PasswordTextFormField({ Key? key }) : super(key: key);
  final bool obserText;
  final Function onTap;
  final Function validator;
  final String name;
  final Function onChanged;

  // ignore: use_key_in_widget_constructors
  const PasswordTextFormField({
    required this.name,
    required this.obserText,
    required this.onTap,
    required this.validator,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obserText,
      onChanged: (value) {},
      validator: (value) {
        if (name == "Password") {
          if (value == "") {
            return "Please Fill the Password";
          } else if (value!.length < 8) {
            return "Password is too short";
          }
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: name,
        suffixIcon: GestureDetector(
          onTap: () {
            onTap();
          },
          child: Icon(
            obserText == true ? Icons.visibility : Icons.visibility_off,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
