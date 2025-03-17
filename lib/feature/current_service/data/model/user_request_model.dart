import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class UserRequestsModel {
  final String? status;
  final String? type;
  final String? createdTime;

  //<editor-fold desc="Data Methods">
  const UserRequestsModel({
    this.status,
    this.type,
    this.createdTime,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is UserRequestsModel &&
              runtimeType == other.runtimeType &&
              status == other.status &&
              type == other.type &&
              createdTime == other.createdTime);

  @override
  int get hashCode => status.hashCode ^ type.hashCode ^ createdTime.hashCode;

  @override
  String toString() {
    return 'UserRequestsModel{' +
        ' status: $status,' +
        ' type: $type,' +
        ' createdTime: $createdTime,' +
        '}';
  }

  UserRequestsModel copyWith({
    String? status,
    String? type,
    String? createdTime,
  }) {
    return UserRequestsModel(
      status: status ?? this.status,
      type: type ?? this.type,
      createdTime: createdTime ?? this.createdTime,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': this.status,
      'type': this.type,
      'createdTime': this.createdTime,
    };
  }

  factory UserRequestsModel.fromMap(Map<String, dynamic> map) {
    return UserRequestsModel(
      status: map['status'] as String?,
      type: map['type'] as String?,
      createdTime: DateFormat('dd MMM yyyy').format((map['createdTime']).toDate() ),
    );
  }

  /// Helper method to get only the date part as a formatted string.

//</editor-fold>
}
