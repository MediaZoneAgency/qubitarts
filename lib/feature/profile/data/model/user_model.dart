class UserModel {
  final String uid;
  final String displayName;
  final String email;
  final String phoneNumber;
  final String status;
  final bool admin;
  final bool agreed;
  //final DateTime createdTime;
  //final DateTime lastLogin;

//<editor-fold desc="Data Methods">
  const UserModel({
    required this.uid,
    required this.displayName,
    required this.email,
    required this.phoneNumber,
    required this.status,
    required this.admin,
    required this.agreed,
    //required this.createdTime,
    //required this.lastLogin,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserModel &&
          runtimeType == other.runtimeType &&
          uid == other.uid &&
          displayName == other.displayName &&
          email == other.email &&
          phoneNumber == other.phoneNumber &&
          status == other.status &&
          admin == other.admin &&
          agreed == other.agreed );
          //createdTime == other.createdTime &&
       //   lastLogin == other.lastLogin);

  @override
  int get hashCode =>
      uid.hashCode ^
      displayName.hashCode ^
      email.hashCode ^
      phoneNumber.hashCode ^
      status.hashCode ^
      admin.hashCode ^
      agreed.hashCode
      //createdTime.hashCode ^
      ;

  @override
  String toString() {
    return 'UserModel{' +
        ' uid: $uid,' +
        ' displayName: $displayName,' +
        ' email: $email,' +
        ' phoneNumber: $phoneNumber,' +
        ' status: $status,' +
        ' admin: $admin,' +
        ' agreed: $agreed,' +
        //' createdTime: $createdTime,' +

        '}';
  }

  UserModel copyWith({
    String? uid,
    String? displayName,
    String? email,
    String? phoneNumber,
    String? status,
    bool? admin,
    bool? agreed,
    //DateTime? createdTime,
    //DateTime? lastLogin,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      displayName: displayName ?? this.displayName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      status: status ?? this.status,
      admin: admin ?? this.admin,
      agreed: agreed ?? this.agreed,
      //createdTime: createdTime ?? this.createdTime,
      //lastLogin: lastLogin ?? this.lastLogin,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': this.uid,
      'display_name': this.displayName,
      'email': this.email,
      'phone_number': this.phoneNumber,
      'status': this.status,
      'admin': this.admin,
      'agreed': this.agreed,
      //'created_time': this.createdTime,
      //'last_login': this.lastLogin,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> ?map, String id) {
    return UserModel(
      uid: map!['uid'] as String,
      displayName: map['display_name'] as String,
      email: map['email'] as String,
      phoneNumber: map['phone_number'] as String,
      status: map['status'] as String,
      admin: map['admin'] as bool,
      agreed: map['agreed'] as bool,
      //createdTime: map['created_time'] as DateTime,
     // lastLogin: map['last_login'] as DateTime,
    );
  }

//</editor-fold>
}