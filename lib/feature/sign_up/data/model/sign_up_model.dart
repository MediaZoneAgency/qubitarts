class SingUPModel {
 final String username;
 final String password;
 final String phoneNumber;
 final String email;

//<editor-fold desc="Data Methods">
  const SingUPModel({
  required  this.username,
  required  this.password,
  required  this.phoneNumber,
  required  this.email,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SingUPModel &&
          runtimeType == other.runtimeType &&
          username == other.username &&
          password == other.password &&
          phoneNumber == other.phoneNumber &&
          email == other.email);

  @override
  int get hashCode =>
      username.hashCode ^
      password.hashCode ^
      phoneNumber.hashCode ^
      email.hashCode;

  @override
  String toString() {
    return 'SingUPModel{' +
        ' username: $username,' +
        ' password: $password,' +
        ' phone_number: $phoneNumber,' +
        ' email: $email,' +
        '}';
  }

  SingUPModel copyWith({
    String? username,
    String? password,
    String? phone_number,
    String? email,
  }) {
    return SingUPModel(
      username: username ?? this.username,
      password: password ?? this.password,
      phoneNumber: phone_number ?? this.phoneNumber,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': this.username,
      'password': this.password,
      'phone_number': this.phoneNumber,
      'email': this.email,
    };
  }

  factory SingUPModel.fromMap(Map<String, dynamic> map) {
    return SingUPModel(
      username: map['username'] as String,
      password: map['password'] as String,
      phoneNumber: map['phone_number'] as String,
      email: map['email'] as String,
    );
  }

//</editor-fold>
}