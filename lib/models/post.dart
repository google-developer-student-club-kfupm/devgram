import 'dart:convert';
import 'dart:io';

class Post {
  final String uid;
  final String imageUrl;
  final String comment;
  Post({
    this.uid,
    this.imageUrl,
    this.comment,
  });

  Post copyWith({
    String uid,
    String imageUrl,
    String comment,
  }) {
    return Post(
      uid: uid ?? this.uid,
      imageUrl: imageUrl ?? this.imageUrl,
      comment: comment ?? this.comment,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'ImageUrl': imageUrl,
      'comment': comment,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      uid: map['uid'],
      imageUrl: map['ImageUrl'],
      comment: map['comment'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) => Post.fromMap(json.decode(source));

  @override
  String toString() => 'Post(uid: $uid, ImageUrl: $imageUrl, comment: $comment)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Post &&
      other.uid == uid &&
      other.imageUrl == imageUrl &&
      other.comment == comment;
  }

  @override
  int get hashCode => uid.hashCode ^ imageUrl.hashCode ^ comment.hashCode;
}
