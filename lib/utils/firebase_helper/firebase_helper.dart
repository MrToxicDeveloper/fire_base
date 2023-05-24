import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class FireBaseHelper {
  static FireBaseHelper fireBaseHelper = FireBaseHelper._();

  FireBaseHelper._();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  void signUp({required email, required password}) {
    firebaseAuth
        .createUserWithEmailAndPassword(email: "email@gmail.com", password: "password@email")
        .then((value) => print("=========================================Success"))
        .catchError(
          (e) => print("=====================================================================Failed $e"),
        );
  }
}
