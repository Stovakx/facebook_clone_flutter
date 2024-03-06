import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebook_clone_flutter/config/constants/firebase_collection_names.dart';
import 'package:facebook_clone_flutter/config/constants/firebase_field_names.dart';
import 'package:facebook_clone_flutter/models/post.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getAllVideosProvider = StreamProvider((ref) {
  final controller = StreamController<Iterable<PostModel>>();

  final sub = FirebaseFirestore.instance
      .collection(FirebaseCollectionNames.posts).where(FirebaseFieldNames.postType, isEqualTo: 'video')
      .orderBy(FirebaseFieldNames.createdAt, descending: true)
      .snapshots()
      .listen((snapshot) {
        final posts = snapshot.docs.map((postData) => PostModel.fromMap(
          postData.data()
        ));
        controller.sink.add(posts);
      });
      
  ref.onDispose(() {
    sub.cancel();
    controller.close();
  });

  return controller.stream;
});
