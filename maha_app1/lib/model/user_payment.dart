class UserPayment {
  String? uid;
  String? accntno;
  String? amount;
  String? selectedCat;
  UserPayment({this.uid, this.accntno, this.amount, this.selectedCat});

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'accntno': accntno,
      'amount': amount,
      'Category': selectedCat,
    };
  }
}
