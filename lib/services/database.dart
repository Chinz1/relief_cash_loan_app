import '../utils/const.dart';

class Database {
  static createUser(
      {firstName, lastName, email, phoneNumber, address, context}) {
    final userDetails = <String, dynamic>{
      "first_name": firstName,
      "last_name": lastName,
      "email_address": email,
      "phone_number": phoneNumber,
      "home_address": address,
    };

    db
        .collection('users')
        .where('email', isEqualTo: email)
        .get()
        .then((querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) {
        return;
      } else {
        db.collection('users').doc(email).set(userDetails);
        // ScaffoldMessenger.of(context).showSnackBar(
        //   const SnackBar(
        //     // backgroundColor: kColourRedSixty,
        //     showCloseIcon: true,
        //     content: Text(
        //       'added to your favourites',
        //       textAlign: TextAlign.center,
        //     ),
        //   ),
        // );
      }
    });
  }
}
