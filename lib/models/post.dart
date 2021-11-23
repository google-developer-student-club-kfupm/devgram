import 'dart:convert';

import 'package:uuid/uuid.dart';

class Post {
  String id;
  final String userId;
  final String comment;
  String imageUrl;

  Post({
    this.id,
    this.userId,
    this.imageUrl,
    this.comment,
  }) {
    id = id ?? Uuid().v1().toString();
  }

  Post copyWith({
    String id,
    String userId,
    String imageUrl,
    String comment,
  }) {
    return Post(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      imageUrl: imageUrl ?? this.imageUrl,
      comment: comment ?? this.comment,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'imageUrl': imageUrl,
      'comment': comment,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['id'],
      userId: map['userId'],
      imageUrl: map['imageUrl'],
      comment: map['comment'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) => Post.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Post(id: $id, userId: $userId, imageUrl: $imageUrl, comment: $comment)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Post &&
        other.id == id &&
        other.userId == userId &&
        other.imageUrl == imageUrl &&
        other.comment == comment;
  }

  @override
  int get hashCode {
    return id.hashCode ^ userId.hashCode ^ imageUrl.hashCode ^ comment.hashCode;
  }
}
