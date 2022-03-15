// ignore_for_file: prefer_const_constructors, duplicate_ignore, unnecessary_new

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:maha_app1/Screens/home_page.dart';
import 'package:maha_app1/model/user_model.dart';
import 'package:maha_app1/model/user_payment.dart';

class BillPayment extends StatefulWidget {
  const BillPayment({Key? key}) : super(key: key);

  @override
  State<BillPayment> createState() => _BillPaymentState();
}

class _BillPaymentState extends State<BillPayment> {
  final auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final accountnoEditingController = TextEditingController();
  final amountEditingController = TextEditingController();
  final selectedTypeEditingController = TextEditingController();
  // ignore: prefer_typing_uninitialized_variables
  var selectedType, selectedCat;
  // ignore: prefer_final_fields
  List<String> _accntType = <String>[
    'Bkask',
    'Nagad',
    'TBL',
  ];
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

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[900],
          leading: IconButton(
            // ignore: prefer_const_constructors
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => HomePage(),
                ),
              );
            },
          ),
          title: Container(
            alignment: Alignment.center,
            child: Text(
              "Payment Method",
              style: TextStyle(color: Colors.white),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.money_rounded,
                size: 20,
                color: Colors.white,
              ),
            ),
          ],
        ),
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
                    ]),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  // ignore: prefer_const_constructors
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.money,
                        size: 30,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      DropdownButton(
                        items: _accntType
                            .map((value) => DropdownMenuItem(
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                      color: Colors.green[900],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  value: value,
                                ))
                            .toList(),
                        onChanged: (selectedAccntType) {
                          setState(() {
                            selectedType = selectedAccntType;
                          });
                        },
                        value: selectedType,
                        isExpanded: false,
                        hint: Text(
                          "Select Type",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("categories")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Text("Loading");
                      } else {
                        List<DropdownMenuItem> categoriesItems = [];
                        for (int i = 0; i < snapshot.data!.docs.length; i++) {
                          DocumentSnapshot snap = snapshot.data!.docs[i];
                          categoriesItems.add(
                            DropdownMenuItem(
                              child: Text(
                                snap.id,
                                style: TextStyle(
                                  color: Colors.green[900],
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // ignore: unnecessary_string_interpolations
                              value: "${snap.id}",
                            ),
                          );
                        }
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: <Widget>[
                            Icon(
                              Icons.payments_outlined,
                              size: 30,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            DropdownButton(
                                // ignore: prefer_const_literals_to_create_immutables
                                items: snapshot.data!.docs.map((value) {
                                  return DropdownMenuItem(
                                    value: value.id,
                                    // ignore: unnecessary_string_interpolations
                                    child: Text('${value.id}'),
                                    onTap: () {
                                      selectedTypeEditingController.text =
                                          value.id;
                                    },
                                  );
                                }).toList(),
                                onChanged: (catValue) {
                                  setState(() {
                                    selectedCat = catValue;
                                  });
                                },
                                value: selectedCat,
                                isExpanded: false,
                                // ignore: unnecessary_new
                                hint: new Text(
                                  "Select Category",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                          ],
                        );
                      }
                    },
                  ),

                  SizedBox(
                    height: 30,
                    width: 30,
                  ),

                  TextFormField(
                    autofocus: false,
                    controller: accountnoEditingController,
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      RegExp regexP = new RegExp(r'^.{11,}$');
                      if (value!.isEmpty) {
                        return ("Account no. cannot be Empty");
                      }
                      if (!regexP.hasMatch(value)) {
                        return ("Enter Valid accnt no(Min. 11 Character)");
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
                  ),

                  SizedBox(
                    height: 30,
                  ),

                  TextFormField(
                    autofocus: false,
                    controller: amountEditingController,
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      RegExp regexP = new RegExp(r'^.{11,}$');
                      if (value!.isEmpty) {
                        return ("Amount cannot be Empty");
                      }
                      if (!regexP.hasMatch(value)) {
                        return ("Enter amount no.");
                      }
                      return null;
                    },
                    onSaved: (value) {
                      amountEditingController.text = value!;
                    },
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: 'Enter Amount',
                      suffixIcon: Icon(
                        Icons.attach_money,
                        size: 24,
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 30,
                  ),

                  Material(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.green[300],
                    child: MaterialButton(
                      //padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      minWidth: MediaQuery.of(context).size.width,
                      onPressed: () {
                        validation();
                        //signUp(emailEditingController.text, passwordEditingController.text);
                        sendData(
                            accountnoEditingController.text,
                            amountEditingController.text,
                            selectedTypeEditingController.text);
                        // Navigator.of(context).pushReplacement(
                        //   MaterialPageRoute(
                        //     builder: (ctx) => HomePage(),
                        //   ),
                        // );
                      },
                      child: Text(
                        "Send Money",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[700],
                        ),
                      ),
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

  Future<void> sendData(
      String accntno, String amount, String selectedType) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;
    UserPayment userPayment = UserPayment();
    // ignore: unused_local_variable
    UserModel userModel = UserModel();

    userPayment.uid = user!.uid;
    userPayment.accntno = accountnoEditingController.text;
    userPayment.amount = amountEditingController.text;
    userPayment.selectedCat = selectedTypeEditingController.text;

    await firebaseFirestore
        .collection("Users_Payment")
        .doc(user.uid)
        .set(userPayment.toMap());
    Fluttertoast.showToast(msg: "Sent");
  }
}
