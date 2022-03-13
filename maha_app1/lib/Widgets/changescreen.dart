// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class ChangeScreen extends StatelessWidget {
  //const ChangeScreen({ Key? key }) : super(key: key);
  final String whichAccount;
  final Function onPressed;
  final String name;
  const ChangeScreen(
      {required this.name,
      required this.onPressed,
      required this.whichAccount});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          whichAccount,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.normal,
            color: Colors.green[700],
          ),
        ),
        // ignore: prefer_const_constructors
        SizedBox(
          width: 10,
        ),
        TextButton(
          onPressed: () {
            onPressed();
          },
          child: Text(
            name,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.green[700],
            ),
          ),
        ),
      ],
    );
  }
}
