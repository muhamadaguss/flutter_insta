import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  final String caption;
  final String uid;
  final String username;
  final String postId;
  final datePublished;
  final String postUrl;
  final String postImage;
  final likes;

  const PostModel({
    required this.caption,
    required this.uid,
    required this.username,
    required this.postId,
    required this.datePublished,
    required this.postUrl,
    required this.postImage,
    required this.likes,
  });

  Map<String, dynamic> toJson() => {
        'caption': caption,
        'uid': uid,
        'username': username,
        'postId': postId,
        'datePublished': datePublished,
        'postUrl': postUrl,
        'postImage': postImage,
        'likes': likes,
      };

  static PostModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return PostModel(
        caption: snapshot['caption'],
        uid: snapshot['uid'],
        username: snapshot['username'],
        postId: snapshot['postId'],
        datePublished: snapshot['datePublished'],
        postUrl: snapshot['postUrl'],
        postImage: snapshot['postImage'],
        likes: snapshot['likes']);
  }
}
