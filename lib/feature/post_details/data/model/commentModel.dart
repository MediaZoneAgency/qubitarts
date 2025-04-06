import 'package:cloud_firestore/cloud_firestore.dart';

class CommentModel{
  final String commentText;
  final Timestamp commentTime;
  final String commentBy;

//<editor-fold desc="Data Methods">
  const CommentModel({
    required this.commentText,
    required this.commentTime,
    required this.commentBy,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CommentModel &&
          runtimeType == other.runtimeType &&
          commentText == other.commentText &&
          commentTime == other.commentTime &&
          commentBy == other.commentBy);

  @override
  int get hashCode =>
      commentText.hashCode ^ commentTime.hashCode ^ commentBy.hashCode;

  @override
  String toString() {
    return 'CommentModel{' +
        ' commentText: $commentText,' +
        ' commentTime: $commentTime,' +
        ' commentedBy: $commentBy,' +
        '}';
  }

  CommentModel copyWith({
    String? commentText,
    String? commentTime,
    String? commentBy,
  }) {
    return CommentModel(
      commentText: commentText ?? this.commentText,
      commentTime: this.commentTime,
      commentBy: commentBy ?? this.commentBy,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'commentText': this.commentText,
      'commentTime': this.commentTime,
      'commentedBy': this.commentBy,
    };
  }

  factory CommentModel.fromMap(Map<String, dynamic> map) {
    return CommentModel(
      commentText: map['commentText']??'',
      commentTime: map['commentTime'] ,
      commentBy: map['commentedBy'] ??'',
    );
  }

//</editor-fold>
}