// ignore_for_file: prefer_const_constructors, unnecessary_new, duplicate_ignore

import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:cupertino_icons/cupertino_icons.dart';

import 'package:maha_app1/Screens/phone_auth.dart';
import 'package:maha_app1/Screens/registration_page.dart';
import 'package:maha_app1/Widgets/changescreen.dart';
// ignore: unused_import
import '../Widgets/mybutton.dart';
import '../Widgets/changescreen.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

//final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

// String p =
//     r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

// ignore: unnecessary_new
//RegExp regExp = new RegExp(p);
bool obserText = true;
String? errorMessage;

class _LoginPageState extends State<LoginPage> {
  ///sending data to firebase-it works
  // Future sendData() async {
  //   // ignore: unused_local_variable
  //   final db = FirebaseFirestore.instance.collection("Userinfo").add({
  //     'name': "Maha",
  //     'age': 20.toString(),
  //     'height': '5.3',
  //   });
  // }

  // ignore: unnecessary_new
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  //firebase

  //final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    void validation() {
      final FormState? _form = _formKey.currentState;
      if (_form!.validate()) {
        // ignore: avoid_print
        print("YEs");
      } else {
        // ignore: avoid_print
        print("No");
      }
    }

    // ignore: unused_local_variable
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Your Email");
        }
        // reg expression for email validation
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please Enter a valid email");
        }
        return null;
      },
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: 'Email',
        suffixIcon: Icon(
          Icons.mail_outlined,
          size: 24,
        ),
      ),
    );
    // ignore: unused_local_variable
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: obserText,
      validator: (value) {
        RegExp regex =
            new RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
        if (value!.isEmpty) {
          return ("Password is required for login");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid Password(Min. 8 Character,1up,1lw,1dig.)");
        }
        return "";
      },
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        labelText: 'Password',
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              obserText = !obserText;
            });
            FocusScope.of(context).unfocus();
          },
          child: Icon(
            obserText == true ? Icons.visibility : Icons.visibility_off,
            color: Colors.black,
          ),
        ),
      ),
    );
    // ignore: unused_local_variable
    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(40),
      color: Colors.green[300],
      child: MaterialButton(
        //padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          //sendData();  //works
          validation();
          signIn(emailController.text, passwordController.text);
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomePage()));
        },
        child: Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.green[700],
          ),
        ),
      ),
    );

    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: CircleAvatar(
                      child: Image.asset('assets/tbl_logo.png'),
                      radius: 60,
                      backgroundColor: Colors.green[200],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 460,
                    width: 400,
                    decoration: BoxDecoration(
                        color: Color(0xFFE8F5E9),
                        borderRadius: BorderRadius.circular(50)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Hello',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Please Login to Your Account',
                          style:
                              TextStyle(fontSize: 15, color: Colors.green[400]),
                        ),

                        // ignore: sized_box_for_whitespace
                        Container(
                          width: 300,
                          child: emailField,
                        ),
                        // ignore: sized_box_for_whitespace
                        Container(
                          width: 300,
                          child: passwordField,
                        ),

                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 40,
                          width: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.green[300],
                          ),
                          child: loginButton,
                        ),

                        SizedBox(
                          height: 20,
                        ),
                        ChangeScreen(
                          name: "Register",
                          whichAccount: "Dont have any account?",
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (ctx) => RegistrationPage(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

// login function
  void signIn(String email, String password) async {
    // ignore: avoid_print
    print(email);
    // ignore: avoid_print
    print(password);
    if (validateStructure(password)) {
      try {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  Fluttertoast.showToast(msg: "Login Successful"),
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (ctx) => LoginScreen())),
                });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";

            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        // ignore: avoid_print
        print(error.code);
      }
    } else {
      Fluttertoast.showToast(msg: "Login failed");
    }
  }

  bool validateStructure(String value) {
    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }
}
