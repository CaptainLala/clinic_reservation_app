import 'package:clinic_reservation_app/screens/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth with ChangeNotifier {
  Dio dio = Dio();

  Future signIn(BuildContext context, String email) async {
    try {
      var user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: '12345678');

      if (user.user != null) {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(HomeScreen.routeName, (route) => false);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future signUp(
      BuildContext context, String name, String phoneNo, int age) async {
    try {
      var user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: '6@7.com',
        password: '12345678',
      );
      if (user.user != null) {
        FirebaseFirestore.instance.collection('users').doc(user.user!.uid).set({
          'name': name,
          'phoneNo': phoneNo,
          'image': "assets/images/doctor_3.jpg",
          'age': age,
          'role': 'doctor',
          'uid': user.user!.uid
        });
        FirebaseFirestore.instance.collection('usernames').doc(name).set({
          'uid': user.user!.uid,
        });
        Navigator.of(context)
            .pushNamedAndRemoveUntil(HomeScreen.routeName, (route) => false);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
