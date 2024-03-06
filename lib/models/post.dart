import 'package:facebook_clone_flutter/config/constants/firebase_field_names.dart';
import 'package:flutter/foundation.dart' show immutable;

@immutable
class PostModel {
  final String postID;
  final String posterID;
  final String content;
  final String postType;
  final String filerURL;
  final DateTime createdAt;
  final List<String> likes;

  const PostModel({
    required this.postID,
    required this.posterID,
    required this.content,
    required this.postType,
    required this.filerURL,
    required this.createdAt,
    required this.likes,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      FirebaseFieldNames.authorId: posterID,
      FirebaseFieldNames.datePublished: createdAt.millisecondsSinceEpoch,
      FirebaseFieldNames.content: content,
      FirebaseFieldNames.postId: postID,
      FirebaseFieldNames.postType: postType,
      FirebaseFieldNames.fileUrl: filerURL,
      FirebaseFieldNames.likes: likes,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
        postID: map[FirebaseFieldNames.postId] ?? "",
        posterID: map[FirebaseFieldNames.posterId] ?? '',
        content: map[FirebaseFieldNames.content] ?? '',
        postType: map[FirebaseFieldNames.postType],
        filerURL: map[FirebaseFieldNames.fileUrl],
        createdAt: DateTime.fromMicrosecondsSinceEpoch(
            map[FirebaseFieldNames.datePublished] ?? ''),
        likes: List<String>.from(map[FirebaseFieldNames.likes] ?? []));
  }
}
