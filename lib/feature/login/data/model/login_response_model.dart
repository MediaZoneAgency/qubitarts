class LoginResponseModel {
  final String? token;
  final String? userEmail;
  final String? userName;
  final String? userDisplayName;

  const LoginResponseModel({
    this.token,
    this.userEmail,
    this.userName,
    this.userDisplayName,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is LoginResponseModel &&
              runtimeType == other.runtimeType &&
              token == other.token &&
              userEmail == other.userEmail &&
              userName == other.userName &&
              userDisplayName == other.userDisplayName);

  @override
  int get hashCode =>
      token.hashCode ^
      userEmail.hashCode ^
      userName.hashCode ^
      userDisplayName.hashCode;

  @override
  String toString() {
    return 'LoginResponseModel{' +
        ' token: $token,' +
        ' userEmail: $userEmail,' +
        ' userName: $userName,' +
        ' userDisplayName: $userDisplayName,' +
        '}';
  }

  LoginResponseModel copyWith({
    String? token,
    String? userEmail,
    String? userName,
    String? userDisplayName,
  }) {
    return LoginResponseModel(
      token: token ?? this.token,
      userEmail: userEmail ?? this.userEmail,
      userName: userName ?? this.userName,
      userDisplayName: userDisplayName ?? this.userDisplayName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'token': token,
      'userEmail': userEmail,
      'userName': userName,
      'userDisplayName': userDisplayName,
    };
  }

  factory LoginResponseModel.fromMap(Map<String, dynamic> map) {
    return LoginResponseModel(
      token: map['token'] as String?,
      userEmail: map['user_email'] as String?,
      userName: map['user_nicename'] as String?,
      userDisplayName: map['user_display_name'] as String?,
    );
  }
}
