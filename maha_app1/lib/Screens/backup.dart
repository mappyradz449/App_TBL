// // ignore_for_file: unnecessary_new, avoid_unnecessary_containers, duplicate_ignore

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:maha_app1/Screens/login_page.dart';
// import 'package:maha_app1/Widgets/mybutton.dart';
// import 'package:maha_app1/model/user_model.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   User? user = FirebaseAuth.instance.currentUser;
//   UserModel loggedInUser = UserModel();

//   @override
//   void initState() {
//     // ignore: todo
//     // TODO: implement initState
//     super.initState();
//     FirebaseFirestore.instance
//         .collection("users")
//         .doc(user!.uid)
//         .get()
//         .then((value) {
//       // ignore: unnecessary_this
//       this.loggedInUser = UserModel.fromMap(value.data());
//       setState(() {});
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         resizeToAvoidBottomInset: false,
//         body: SingleChildScrollView(
//           child: Container(
//             height: MediaQuery.of(context).size.height,
//             width: MediaQuery.of(context).size.width,
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                   begin: Alignment.bottomLeft,
//                   end: Alignment.topRight,
//                   colors: [
//                     Color(0xFF1B5E20),
//                     Color(0xFF388E3C),
//                     Color(0xFFC8E6C9),
//                   ]),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 // ignore: prefer_const_constructors
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Center(
//                   child: CircleAvatar(
//                     child: Image.asset('assets/tbl_logo.png'),
//                     radius: 60,
//                     backgroundColor: Colors.green[200],
//                   ),
//                 ),
//                 // ignore: prefer_const_constructors
//                 SizedBox(
//                   height: 15,
//                 ),
//                 // ignore: prefer_const_constructors
//                 Text(
//                   "Welcome,${loggedInUser.username}",
//                   // ignore: prefer_const_constructors
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 // GridView.count(
//                 //     crossAxisCount: 2,
//                 //     children: List.generate(5, (index) {
//                 //       // ignore: unnecessary_new
//                 //       return new Card(
//                 //         elevation: 10.0,
//                 //         child: new Container(
//                 //           child: new Text(
//                 //             "$index",
//                 //             // ignore: prefer_const_constructors
//                 //             style: TextStyle(
//                 //               fontSize: 24.0,
//                 //             ),
//                 //           ),
//                 //         ),
//                 //       );
//                 //     })),
//                 GridView(
//                     children: [
//                       Container(
//                         color: Colors.green[100],
//                       ),
//                       Container(
//                         color: Colors.green[100],
//                       ),
//                       Container(
//                         color: Colors.green[100],
//                       ),
//                       Container(
//                         color: Colors.green[100],
//                       ),
//                     ],
//                     // ignore: prefer_const_constructors
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       crossAxisSpacing: 10,
//                       mainAxisSpacing: 10,
//                     )),
//                 MyButton(
//                   onPressed: () {
//                     //validation();
//                     Navigator.of(context).pushReplacement(
//                       MaterialPageRoute(
//                         // ignore: prefer_const_constructors
//                         builder: (ctx) => LoginPage(),
//                       ),
//                     );
//                   },
//                   name: "Logout",
//                 ),
//                 // ignore: prefer_const_constructors
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> logout(BuildContext context) async {
//     await FirebaseAuth.instance.signOut();
//     Navigator.of(context)
//         // ignore: prefer_const_constructors
//         .pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
//   }
// }






///// ignore_for_file: unnecessary_new, avoid_unnecessary_containers, duplicate_ignore, prefer_const_constructors

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:maha_app1/Screens/login_page.dart';
// //import 'package:maha_app1/Widgets/mybutton.dart';
// // import 'package:maha_app1/model/user_model.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   // User? user = FirebaseAuth.instance.currentUser;
//   // UserModel loggedInUser = UserModel();

//   // @override
//   // void initState() {
//   //   // ignore: todo
//   // ignore: todo
//   //   // TODO: implement initState
//   //   super.initState();
//   //   FirebaseFirestore.instance
//   //       .collection("users")
//   //       .doc(user!.uid)
//   //       .get()
//   //       .then((value) {
//   //     // ignore: unnecessary_this
//   //     this.loggedInUser = UserModel.fromMap(value.data());
//   //     setState(() {});
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         resizeToAvoidBottomInset: false,
//         // appBar: AppBar(
//         //   // ignore: prefer_const_constructors
//         //   title: Text("Flutter GridView Demo"),
//         //   backgroundColor: Colors.green,
//         // ),
//         body: SingleChildScrollView(
//           child: Container(
//             height: MediaQuery.of(context).size.height,
//             width: MediaQuery.of(context).size.width,
//             decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                     begin: Alignment.bottomLeft,
//                     end: Alignment.topRight,
//                     colors: [
//                   Color(0xFF1B5E20),
//                   Color(0xFF388E3C),
//                   Color(0xFFC8E6C9),
//                 ])),
//             child: Center(
//                 child: GridView.extent(
//               primary: false,
//               padding: const EdgeInsets.all(16),
//               crossAxisSpacing: 20,
//               mainAxisSpacing: 20,
//               maxCrossAxisExtent: 200.0,
//               children: <Widget>[
//                 Container(
//                   //padding: const EdgeInsets.all(8),
//                   //child: const Text('First', style: TextStyle(fontSize: 20)),
//                   // child: IconButton(
//                   //   icon: Icon(Icons.attach_money_outlined),
//                   //   iconSize: 24,
//                   //   onPressed: () {},
//                   // ),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(50),

//                     // ignore: prefer_const_constructors
//                     image: DecorationImage(

//                         // ignore: prefer_const_constructors
//                         image: AssetImage("assets/dollar2.png"),
//                         fit: BoxFit.cover),
//                     color: Colors.green[300],
//                   ),

//                   // ignore: prefer_const_constructors
//                   child: Align(
//                     alignment: Alignment.bottomCenter,
//                     child: TextButton(
//                       onPressed: () {},
//                       child: Text(
//                         'My Account',
//                         // ignore: prefer_const_constructors
//                         style: TextStyle(fontSize: 20),
//                       ),
//                     ),
//                   ),
//                 ),
//                 // SizedBox(height: 5.0),
//                 // Text("Title Here")

//                 Container(
//                   padding: const EdgeInsets.all(8),
//                   child: const Text('Second', style: TextStyle(fontSize: 20)),
//                   color: Colors.blue,
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(8),
//                   child: const Text('Third', style: TextStyle(fontSize: 20)),
//                   color: Colors.blue,
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(8),
//                   child: const Text('Four',
//                       style:
//                           TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//                   color: Colors.yellow,
//                 ),
//               ],
//             )),
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> logout(BuildContext context) async {
//     await FirebaseAuth.instance.signOut();
//     Navigator.of(context)
//         // ignore: prefer_const_constructors
//         .pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
//   }
// }

