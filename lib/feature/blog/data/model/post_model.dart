

import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  final String id; // Document ID
  final String category;
  final String araCategory;
  final String araDescription;
  final String araTitle;
  final String postDescription;
  final String postPhoto;
  final String postTitle;
  final String status;
  final DateTime timePosted;
  final List<String> likes;

  const PostModel({
    required this.id,
    required this.category,
    required this.araCategory,
    required this.araDescription,
    required this.araTitle,
    required this.postDescription,
    required this.postPhoto,
    required this.postTitle,
    required this.status,
    required this.timePosted,
    required this.likes,
  });

  PostModel copyWith({
    String? id,
    String? category,
    String? araCategory,
    String? araDescription,
    String? araTitle,
    String? postDescription,
    String? postPhoto,
    String? postTitle,
    String? status,
    DateTime? timePosted,
    List<String>? likes,
  }) {
    return PostModel(
      id: id ?? this.id,
      category: category ?? this.category,
      araCategory: araCategory ?? this.araCategory,
      araDescription: araDescription ?? this.araDescription,
      araTitle: araTitle ?? this.araTitle,
      postDescription: postDescription ?? this.postDescription,
      postPhoto: postPhoto ?? this.postPhoto,
      postTitle: postTitle ?? this.postTitle,
      status: status ?? this.status,
      timePosted: timePosted ?? this.timePosted,
      likes: likes ?? this.likes,
    );
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      id: '', // Default empty string; will be set by `copyWith`
      category: map['Category'] as String? ?? '',
      araCategory: map['araCategory'] as String? ?? '',
      araDescription: map['araDescription'] as String? ?? '',
      araTitle: map['araTitle'] as String? ?? '',
      postDescription: map['postDescription'] as String? ?? '',
      postPhoto: map['post_photo'] as String? ?? '',
      postTitle: map['post_title'] as String? ?? '',
      status: map['status'] as String? ?? '',
      timePosted: (map['time_posted'] as Timestamp).toDate(),
      likes: List<String>.from(map['likes'] ?? []), // Empty list if null
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'category': this.category,
      'araCategory': this.araCategory,
      'araDescription': this.araDescription,
      'araTitle': this.araTitle,
      'postDescription': this.postDescription,
      'postPhoto': this.postPhoto,
      'postTitle': this.postTitle,
      'status': this.status,
      'timePosted': this.timePosted,
      'likes': this.likes,
    };
  }
}



