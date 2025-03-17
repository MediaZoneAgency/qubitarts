class SignUPResponseModel {
  String? message;
  int? userId;
  String? token;

//<editor-fold desc="Data Methods">
  SignUPResponseModel({
    this.message,
    this.userId,
    this.token,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SignUPResponseModel &&
          runtimeType == other.runtimeType &&
          message == other.message &&
          userId == other.userId &&
          token == other.token);

  @override
  int get hashCode => message.hashCode ^ userId.hashCode ^ token.hashCode;

  @override
  String toString() {
    return 'SignUPResponseModel{' +
        ' message: $message,' +
        ' user_id: $userId,' +
        ' token: $token,' +
        '}';
  }

  SignUPResponseModel copyWith({
    String? message,
    int? userId,
    String? token,
  }) {
    return SignUPResponseModel(
      message: message ?? this.message,
      userId: userId ?? this.userId,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'message': this.message,
      'user_id': this.userId,
      'token': this.token,
    };
  }

  factory SignUPResponseModel.fromMap(Map<String, dynamic> map) {
    return SignUPResponseModel(
      message: map['message'] as String,
      userId: map['user_id'] as int,
      token: map['token'] as String,
    );
  }

//</editor-fold>
}