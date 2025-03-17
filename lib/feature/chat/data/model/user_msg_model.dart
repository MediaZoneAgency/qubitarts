import 'package:cloud_firestore/cloud_firestore.dart';

class UserMsgModel {
  final String text;
  final Timestamp timestamp;
  final DocumentReference user;
  final DocumentReference chat;

//<editor-fold desc="Data Methods">
  const UserMsgModel({
    required this.text,
    required this.timestamp,
    required this.user,
    required this.chat,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserMsgModel &&
          runtimeType == other.runtimeType &&
          text == other.text &&
          timestamp == other.timestamp &&
          user == other.user &&
          chat == other.chat);

  @override
  int get hashCode =>
      text.hashCode ^ timestamp.hashCode ^ user.hashCode ^ chat.hashCode;

  @override
  String toString() {
    return 'UserMsgModel{' +
        ' text: $text,' +
        ' timestamp: $timestamp,' +
        ' user: $user,' +
        ' chat: $chat,' +
        '}';
  }

  UserMsgModel copyWith({
    String? text,
    Timestamp? timestamp,
    DocumentReference? user,
    DocumentReference? chat,
  }) {
    return UserMsgModel(
      text: text ?? this.text,
      timestamp: timestamp ?? this.timestamp,
      user: user ?? this.user,
      chat: chat ?? this.chat,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'text': this.text,
      'timestamp': this.timestamp,
      'user': this.user,
      'chat': this.chat,
    };
  }

  factory UserMsgModel.fromMap(Map<String, dynamic> map) {
    return UserMsgModel(
      text: map['text'] as String,
      timestamp: map['timestamp'] as Timestamp,
      user: map['user'] as DocumentReference,
      chat: map['chat'] as DocumentReference,
    );
  }

//</editor-fold>
}