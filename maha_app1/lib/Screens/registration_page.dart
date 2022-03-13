// ignore_for_file: prefer_const_constructors, duplicate_ignore, sized_box_for_whitespace, prefer_typing_uninitialized_variables, unnecessary_new

//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:maha_app1/Screens/home_page.dart';

import 'package:maha_app1/Screens/login_page.dart';

import 'package:maha_app1/Widgets/changescreen.dart';
import 'package:maha_app1/model/user_model.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

// ignore: unnecessary_new
RegExp regExp = new RegExp(p);
bool obserText = true;
// String email = "";
// String password = "";

class _RegistrationPageState extends State<RegistrationPage> {
  final usernameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final confirmPasswordEditingController = TextEditingController();
  final accountnoEditingController = TextEditingController();
  final phonenoEditingController = TextEditingController();

  // ignore: prefer_typing_uninitialized_variables
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    void validation() {
      final FormState? _form = _formKey.currentState;
      if (_form!.validate()) {
        // ignore: avoid_print
        //print("YEs");
      } else {
        // ignore: avoid_print
        //print("No");
      }
    }

    // ignore: unused_local_variable
    final usernameField = TextFormField(
      autofocus: false,
      controller: usernameEditingController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("First Name cannot be Empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid name(Min. 3 Character)");
        }
        return null;
      },
      onSaved: (value) {
        usernameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: 'Username',
        suffixIcon: Icon(
          Icons.person,
          size: 24,
        ),
      ),
    );
    // ignore: unused_local_variable
    final emailField = TextFormField(
      autofocus: false,
      controller: emailEditingController,
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
        emailEditingController.text = value!;
      },
      // onChanged: (value) {
      //   setState(() {
      //     email = value;
      //   });
      // },
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
      controller: passwordEditingController,
      obscureText: obserText,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        RegExp regexp =
            new RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
        if (value!.isEmpty) {
          return ("Password is required for login");
        }
        if (!regexp.hasMatch(value)) {
          return ("Enter Valid Password(Min. 8 Character,1up,1lw,1dig.)");
        }
        return "";
      },
      onSaved: (value) {
        passwordEditingController.text = value!;
      },
      // onChanged: (value) {
      //   setState(() {
      //     password = value;
      //   });
      // },
      textInputAction: TextInputAction.next,
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
    // final confirmPasswordField = TextFormField(
    //   autofocus: false,
    //   controller: confirmPasswordEditingController,
    //   obscureText: true,
    //   keyboardType: TextInputType.emailAddress,
    //   //validator: (){},
    //   onSaved: (value) {
    //     confirmPasswordEditingController.text = value!;
    //   },
    //   textInputAction: TextInputAction.next,
    //   decoration: InputDecoration(
    //     labelText: 'Confirm Password',
    //     suffixIcon: Icon(
    //       Icons.mail_outlined,
    //       size: 20,
    //     ),
    //   ),
    // );
    // ignore: unused_local_variable
    final accountnoField = TextFormField(
      autofocus: false,
      controller: accountnoEditingController,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regexP = new RegExp(r'^.{11,}$');
        if (value!.isEmpty) {
          return ("First Name cannot be Empty");
        }
        if (!regexP.hasMatch(value)) {
          return ("Enter Valid name(Min. 11 Character)");
        }
        return null;
      },
      onSaved: (value) {
        accountnoEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: 'Account No.',
        suffixIcon: Icon(
          Icons.attach_money,
          size: 24,
        ),
      ),
    );
    // ignore: unused_local_variable
    final phonenoField = TextFormField(
      autofocus: false,
      controller: phonenoEditingController,
      keyboardType: TextInputType.emailAddress,
      //validator: (){},
      onSaved: (value) {
        phonenoEditingController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        labelText: 'Phone no.',
        suffixIcon: Icon(
          Icons.mail_outlined,
          size: 20,
        ),
      ),
    );

    // ignore: unused_local_variable
    final registerButton = Material(
      borderRadius: BorderRadius.circular(40),
      color: Colors.green[300],
      child: MaterialButton(
        //padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          validation();
          signUp(emailEditingController.text, passwordEditingController.text);
          // Navigator.of(context).pushReplacement(
          //   MaterialPageRoute(
          //     builder: (ctx) => HomePage(),
          //   ),
          // );
        },
        child: Text(
          "Register",
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
        body: SafeArea(
          child: Form(
            key: _formKey,
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
                    height: 7,
                  ),
                  CircleAvatar(
                    child: Image.asset('assets/tbl_logo.png'),
                    radius: 60,
                    backgroundColor: Colors.green[200],
                  ),
                  // ignore: prefer_const_constructors
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Registration',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w900,
                      fontStyle: FontStyle.italic,
                      color: Colors.green[900],
                    ),
                  ),
                  Container(
                    height: 450,
                    width: 400,
                    decoration: BoxDecoration(
                        // ignore: prefer_const_constructors
                        color: Color(0xFFE8F5E9),
                        borderRadius: BorderRadius.circular(50)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // ignore: prefer_const_constructors
                        SizedBox(
                          height: 5,
                        ),
                        // ignore: sized_box_for_whitespace
                        Container(
                          width: 300,
                          child: usernameField,
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
                        // ignore: sized_box_for_whitespace
                        // Container(
                        //   width: 300,
                        //   child: confirmPasswordField,
                        //   // TextFormField(
                        //   //   obscureText: true,
                        //   //   decoration: InputDecoration(
                        //   //     labelText: 'Confirm Password',
                        //   //   ),
                        //   // ),
                        // ),
                        // ignore: sized_box_for_whitespace
                        Container(
                          width: 300,
                          child: accountnoField,
                        ),
                        // Container(
                        //   width: 300,
                        //   child: phonenoField,
                        //   // MyTextFormField(
                        //   //   name: "Phone No.",
                        //   //   validator: () {},
                        //   //   onChanged: () {},
                        //   // ),
                        //   // TextFormField(
                        //   //   validator: (value) {
                        //   //     if (value == "") {
                        //   //       return "Please fill Phone No.";
                        //   //     } else if (value!.length < 11) {
                        //   //       return "Phone no. must be of 11 digits";
                        //   //     }
                        //   //     return "";
                        //   //   },
                        //   //   //obscureText: true,
                        //   //   decoration: InputDecoration(
                        //   //     labelText: 'Mobile No.',
                        //   //   ),
                        //   // ),
                        // ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 30,
                          width: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.green[300],
                          ),
                          child: registerButton,
                        ),
                        // MyButton(
                        //   name: "Register",
                        //   onPressed: () {
                        //     //validation();
                        //   },
                        // ),
                        SizedBox(
                          height: 5,
                        ),
                        ChangeScreen(
                            name: "Login",
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (ctx) => LoginPage(),
                                ),
                              );
                            },
                            whichAccount: "I already have an account"),
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

  void signUp(String email, String password) async {
    if (validateStructure(password)) {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  postDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;
    UserModel userModel = UserModel();

    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.username = usernameEditingController.text;
    userModel.accntno = accountnoEditingController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created Successfully");
    Navigator.pushAndRemoveUntil((context),
        MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
  }

  bool validateStructure(String value) {
    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }
}
