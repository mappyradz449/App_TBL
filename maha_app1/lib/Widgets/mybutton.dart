import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  //const MyButton({ Key? key }) : super(key: key);
  final Function onPressed;
  final String name;
// ignore: use_key_in_widget_constructors
  const MyButton({required this.name, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Colors.green[300],
      ),
      child: TextButton(
        onPressed: () {
          onPressed();
        },
        child: Text(
          name,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.green[700],
          ),
        ),
      ),
    );
  }
}
