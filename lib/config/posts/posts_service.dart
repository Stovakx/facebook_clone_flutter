import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebook_clone_flutter/config/constants/firebase_collection_names.dart';
import 'package:facebook_clone_flutter/config/constants/firebase_field_names.dart';
import 'package:facebook_clone_flutter/models/post.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:uuid/uuid.dart';

@immutable
class PostService {
  final _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;

  //make post
  Future<String> makePost({
    required String content,
    required File file,
    required String postType,
  }) async {
    try {
      final postID = const Uuid().v1();
      final posterID = _auth.currentUser!.uid;
      final now = DateTime.now();

      //uložení příspěvku do storage
      final fileUID = const Uuid().v1();
      final path = _storage.ref(postType).child(fileUID);
      final taskSnapshot = await path.putFile(file);
      final downloadURL = await taskSnapshot.ref.getDownloadURL();

      //create post
      PostModel post = PostModel(
        postID: postID,
        posterID: posterID,
        content: content,
        postType: postType,
        filerURL: downloadURL,
        createdAt: now,
        likes: const [],
      );

      //uložit post do firestore
      await _fireStore
          .collection(FirebaseCollectionNames.posts)
          .doc(postID)
          .set(post.toMap());

      return postID;
    } catch (e) {
      return e.toString();
    }
  }

  //like post
  Future<String?> likeDislikePost({
    required String postID,
    required List<String> likes,
  }) async {
    try {
      final authorID = _auth.currentUser!.uid;

      //pokud likes obsahují authorID, tak je vymazáno z array
      if (likes.contains(authorID)) {
        _fireStore
            .collection(FirebaseCollectionNames.posts)
            .doc(postID)
            .update({
          FirebaseFieldNames.likes: FieldValue.arrayRemove([authorID])
        });
      } else {
        //když neobsahuje id, přidá se id do array a post bude označen jako oblíbený
        if (likes.contains(authorID)) {
          _fireStore
              .collection(FirebaseCollectionNames.posts)
              .doc(postID)
              .update({
            FirebaseFieldNames.likes: FieldValue.arrayUnion([authorID])
          });
        }
      }

      return null;
    } catch (e) {
      return e.toString();
    }
  }

  //delete post
  Future<String?> deletePost({
    required String postID,
  }) async {
    try {
      final authorID = _auth.currentUser!.uid;
      final postDoc =
          _fireStore.collection(FirebaseCollectionNames.posts).doc(postID);
      final postSnapshot = await postDoc.get();
      final post = PostModel.fromMap(postSnapshot.data()!);

      // kontrola zda uživatel vytvořil post nebo ne
      if (post.posterID == authorID) {
        // vymazání postu z firestore a fotky z firestorage
        final path = _storage.ref(post.postType).child(post.postID);
        await path.delete();
        await postDoc.delete();

        return null;
      } else {
        return 'You are not authorized to delete this post.';
      }
    } catch (e) {
      return e.toString();
    }
  }

  //Upravit post
  Future<String?> editPost({
    required String postID,
    String? newContent,
    File? newFile,
  }) async {
    try {
      final authorID = _auth.currentUser!.uid;
      final postDoc =
          _fireStore.collection(FirebaseCollectionNames.posts).doc(postID);
      final postSnapshot = await postDoc.get();
      final post = PostModel.fromMap(postSnapshot.data()!);

      // kontrola zda uživatel vytvořil post nebo ne
      if (post.posterID == authorID) {
        // uložení nové fotky do storage (pokud je poslána nová fotka)
        if (newFile != null) {
          final newFileUID = const Uuid().v1();
          final newPath = _storage.ref(post.postType).child(newFileUID);
          final newTaskSnapshot = await newPath.putFile(newFile);
          final newDownloadURL = await newTaskSnapshot.ref.getDownloadURL();

          // aktualizace postu v firestore
          await postDoc.update({
            FirebaseFieldNames.content: newContent ?? post.content,
            FirebaseFieldNames.fileUrl: newDownloadURL,
            FirebaseFieldNames.updatedAt: Timestamp.now(),
          });

          // vymazání staré fotky z firestorage
          final oldPath = _storage.ref(post.postType).child(post.postID);
          await oldPath.delete();

          return null;
        } else {
          // aktualizace postu v firestore bez nové fotky
          await postDoc.update({
            FirebaseFieldNames.content: newContent ?? post.content,
            FirebaseFieldNames.updatedAt: Timestamp.now(),
          });

          return null;
        }
      } else {
        return 'You are not authorized to edit this post.';
      }
    } catch (e) {
      //použít flutterToast??
      return e.toString();
    }
  }
}
