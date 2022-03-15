//ignore_for_file: unnecessary_new, avoid_unnecessary_containers, duplicate_ignore, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maha_app1/Screens/login_page.dart';
import 'package:maha_app1/Screens/payment.dart';
//import 'package:maha_app1/Widgets/mybutton.dart';
import 'package:maha_app1/model/user_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      // ignore: unnecessary_this
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
            // ignore: prefer_const_constructors
            icon: Icon(
              Icons.logout_outlined,
              //color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  // ignore: prefer_const_constructors
                  builder: (ctx) => LoginPage(),
                ),
              );
            },
          ),
          // ignore: prefer_const_constructors
          title: Text(
            "Welcome Home,${loggedInUser.username},${loggedInUser.email}",
            style: TextStyle(
              color: Colors.black,
              fontSize: 10,
              fontWeight: FontWeight.normal,
            ),
          ),
          backgroundColor: Colors.green[200],
        ),
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
                ])),
            child: Center(
                child: GridView.extent(
              primary: false,
              padding: const EdgeInsets.all(16),
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              maxCrossAxisExtent: 200.0,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),

                    // ignore: prefer_const_constructors
                    image: DecorationImage(

                        // ignore: prefer_const_constructors
                        image: AssetImage("assets/dollar2.png"),
                        fit: BoxFit.cover),
                    color: Colors.green[300],
                  ),

                  // ignore: prefer_const_constructors
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'My Account',
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.green[900],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                // SizedBox(height: 5.0),
                // Text("Title Here")

                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),

                    // ignore: prefer_const_constructors
                    image: DecorationImage(

                        // ignore: prefer_const_constructors
                        image: AssetImage("assets/card2.png"),
                        fit: BoxFit.cover),
                    color: Colors.green[300],
                  ),

                  // ignore: prefer_const_constructors
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'My Cards',
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.green[900],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),

                    // ignore: prefer_const_constructors
                    image: DecorationImage(

                        // ignore: prefer_const_constructors
                        image: AssetImage("assets/bill.png"),
                        fit: BoxFit.cover),
                    color: Colors.green[300],
                  ),

                  // ignore: prefer_const_constructors
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (ctx) => BillPayment(),
                          ),
                        );
                      },
                      child: Text(
                        'Payments',
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.green[900],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),

                    // ignore: prefer_const_constructors
                    image: DecorationImage(

                        // ignore: prefer_const_constructors
                        image: AssetImage("assets/expenses.png"),
                        fit: BoxFit.cover),
                    color: Colors.green[300],
                  ),

                  // ignore: prefer_const_constructors
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Expenses',
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.green[900],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),

                    // ignore: prefer_const_constructors
                    image: DecorationImage(

                        // ignore: prefer_const_constructors
                        image: AssetImage("assets/location.png"),
                        fit: BoxFit.cover),
                    color: Colors.green[300],
                  ),

                  // ignore: prefer_const_constructors
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Location',
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.green[900],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context)
        // ignore: prefer_const_constructors
        .pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
  }
}
