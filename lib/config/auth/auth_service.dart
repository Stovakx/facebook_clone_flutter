import 'dart:io';
import 'package:facebook_clone_flutter/config/constants/firebase_collectionNames.dart';
import 'package:facebook_clone_flutter/config/constants/firebase_storage_folder_name.dart';
import 'package:facebook_clone_flutter/models/user.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;
  final _storage = FirebaseStorage.instance;
  final _fireStore = FirebaseFirestore.instance;

  //login
  Future<UserCredential?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential;
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      return null;
    }
  }

  //sign out
  Future<String?> singOut() async {
    try {
      _auth.signOut();
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  //registration
  Future<UserCredential?> regtisterIn({
    required String fullName,
    required DateTime birthday,
    required String gender,
    required String email,
    required String password,
    required File? image,
  }) async {
    try {
      //create acc in firebase
      final credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      //storage for profile pics
      final path = _storage
          .ref(StorageFolderNames.profilePic)
          .child(FirebaseAuth.instance.currentUser!.uid);

      if (image == null) {
        return null;
      }

      final taskSnapshot = await path.putFile(image);
      final downloadURL = await taskSnapshot.ref.getDownloadURL();

      UserModel user = UserModel(
          fullName: fullName,
          birthDay: birthday,
          gender: gender,
          email: email,
          password: password,
          profilePicUrl: downloadURL,
          uid: FirebaseAuth.instance.currentUser!.uid,
          friends: const [],
          sentRequests: const [],
          receivedRequests: const []);

      //uložení do firestore
      await _fireStore
          .collection(FirebaseCollectionNames.users)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(user.toMap());

      return credential;
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      return null;
    }
  }

  //potvrzení emailu
  Future<String?> verifyEmail(String email) async {
    final user = FirebaseAuth.instance.currentUser;

    try {
      if (user != null) {
        user.sendEmailVerification();
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      return null;
    }
  }

  //získat user info
  Future<UserModel> getUserInfo() async {
    final userData = await _fireStore
        .collection(FirebaseCollectionNames.users)
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    final user = UserModel.fromMap(userData.data()!);
    return user;
  }
}
