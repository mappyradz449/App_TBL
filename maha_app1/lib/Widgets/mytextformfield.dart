// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

// ignore: unnecessary_new
RegExp regExp = new RegExp(p);

class MyTextFormField extends StatelessWidget {
  //const MyTextFormField({Key? key}) : super(key: key);
  final Function validator;
  final String name;
  final Function onChanged;

  // ignore: use_key_in_widget_constructors,
  const MyTextFormField(
      {required this.name, required this.validator, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return TextFormField(
      onChanged: (value) {},
      validator: (value) {
        if (name == "Email") {
          if (value == "") {
            return "Please Fill the Email";
          } else if (!regExp.hasMatch(value!)) {
            return "Email is Invalid";
          }
          return "";
        }
        if (name == "Username") {
          if (value == "") {
            return "Please Fill Username";
          } else if (value!.length < 6) {
            return "Username is too Short";
          }
          return "";
        }
        if (name == "Account No.") {
          if (value == "") {
            return "Please enter Your Account no.";
          } else if (value!.length < 11) {
            return "Please give a valid account no.";
          }
          return "";
        }
        if (name == "Phone No.") {
          if (value == "") {
            return "Please Fill Phone No.";
          } else if (value!.length < 11) {
            return "Phone no. must be of 11 digits";
          }
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: name,

        // ignore: prefer_const_constructors
      ),
    );
  }
}
