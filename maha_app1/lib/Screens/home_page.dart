import 'package:flutter/material.dart';
import 'package:maha_app1/Screens/login_page.dart';

import '../Widgets/mybutton.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    Color(0xFF1B5E20),
                    Color(0xFF388E3C),
                    Color(0xFFC8E6C9),
                  ]),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: CircleAvatar(
                    child: Image.asset('assets/tbl_logo.png'),
                    radius: 60,
                    backgroundColor: Colors.green[200],
                  ),
                ),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 20,
                ),
                MyButton(
                  onPressed: () {
                    validation();
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        // ignore: prefer_const_constructors
                        builder: (ctx) => LoginPage(),
                      ),
                    );
                  },
                  name: "Logout",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void validation() {}
