// import 'dart:html';

class UserModel {
  String? uid;
  String? username;
  String? email;
  String? accntno;

  UserModel({this.uid, this.email, this.username, this.accntno});

  ///data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      username: map['username'],
      accntno: map['accntno'],
    );
  }

  ///sending data to server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'username': username,
      'email': email,
      'accntno': accntno,
    };
  }
}
