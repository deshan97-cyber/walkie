import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:social/Model/user_model.dart';
import 'package:social/services/storage_services.dart';
// ignore: depend_on_referenced_packages
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthMethods {
  //firebase instance
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //register new user
  Future<String> registerWithEmailAndPassword({
    required String email,
    required String password,
    required String userName,
    required String bio,
    required Uint8List profilePic,
  }) async {
    String res = "An error occured";

    try {
      if (userName.isNotEmpty &&
          password.isNotEmpty &&
          email.isNotEmpty &&
          bio.isNotEmpty &&
          profilePic.isNotEmpty) {
        //create new user

        final UserCredential userCredential = await _auth
            .createUserWithEmailAndPassword(email: email, password: password);

        //upload profilepick to the storage
        String photoURL = await storageMethods().uploadImage(
            folderName: "ProfileImages", isPost: false, file: profilePic);

        UserModel user = UserModel(
          uid: _auth.currentUser!.uid,
          email: email,
          userName: userName,
          bio: bio,
          profilePic: photoURL,
          followers: [],
          following: [],
        );

        if (userCredential.user != null) {
          await _firestore.collection('users').doc(_auth.currentUser!.uid).set(
                user.toJSON(),
              );

          res = 'success';
        }
      }
    }
    //error handling

    on FirebaseAuthException catch (error) {
      if (error.code == 'invalid email') {
        res = 'invalid email';
      } 
      else if (error.code == 'week password') {
        res = 'week password';
      }
      else if (error.code == 'email already using') {
        res = 'email already using';
      }



    } catch (error) {
      res = error.toString();
    }
    return res;
  }
}
