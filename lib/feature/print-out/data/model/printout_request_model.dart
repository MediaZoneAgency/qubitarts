import 'package:cloud_firestore/cloud_firestore.dart';

class PrintoutRequestModel{
    final List<dynamic>?printoutTypes ;
    final String? quantityNeeded;
    final List<dynamic>?paperType;
    final String?brandGuidelines;
    final String? size;
    final String? dateLaunch;
    final String? visionForMarketing;
    final String? status;
    final String? type;
    final DateTime? createdTime;
    final DocumentReference? userREF;

//<editor-fold desc="Data Methods">
    const PrintoutRequestModel({
    this.printoutTypes,
    this.quantityNeeded,
    this.paperType,
    this.brandGuidelines,
    this.size,
    this.dateLaunch,
    this.visionForMarketing,
    this.status,
    this.type,
    this.createdTime,
    this.userREF,
  });

    @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PrintoutRequestModel &&
          runtimeType == other.runtimeType &&
          printoutTypes == other.printoutTypes &&
          quantityNeeded == other.quantityNeeded &&
          paperType == other.paperType &&
          brandGuidelines == other.brandGuidelines &&
          size == other.size &&
          dateLaunch == other.dateLaunch &&
          visionForMarketing == other.visionForMarketing &&
          status == other.status &&
          type == other.type &&
          createdTime == other.createdTime &&
          userREF == other.userREF);

    @override
  int get hashCode =>
      printoutTypes.hashCode ^
      quantityNeeded.hashCode ^
      paperType.hashCode ^
      brandGuidelines.hashCode ^
      size.hashCode ^
      dateLaunch.hashCode ^
      visionForMarketing.hashCode ^
      status.hashCode ^
      type.hashCode ^
      createdTime.hashCode ^
      userREF.hashCode;

    @override
  String toString() {
    return 'PrintoutRequestModel{' +
        ' printoutTypes: $printoutTypes,' +
        ' quantityNeeded: $quantityNeeded,' +
        ' paperType: $paperType,' +
        ' brandGuidelines: $brandGuidelines,' +
        ' size: $size,' +
        ' dateLaunch: $dateLaunch,' +
        ' visionForMarketing: $visionForMarketing,' +
        ' status: $status,' +
        ' type: $type,' +
        ' createdTime: $createdTime,' +
        ' userREF: $userREF,' +
        '}';
  }

    PrintoutRequestModel copyWith({
    List<String>? printoutTypes,
    String? quantityNeeded,
    List<String>? paperType,
    String? brandGuidelines,
    String? size,
    String? dateLaunch,
    String? visionForMarketing,
    String? status,
    String? type,
    DateTime? createdTime,
    DocumentReference? userREF,
  }) {
    return PrintoutRequestModel(
      printoutTypes: printoutTypes ?? this.printoutTypes,
      quantityNeeded: quantityNeeded ?? this.quantityNeeded,
      paperType: paperType ?? this.paperType,
      brandGuidelines: brandGuidelines ?? this.brandGuidelines,
      size: size ?? this.size,
      dateLaunch: dateLaunch ?? this.dateLaunch,
      visionForMarketing: visionForMarketing ?? this.visionForMarketing,
      status: status ?? this.status,
      type: type ?? this.type,
      createdTime: createdTime ?? this.createdTime,
      userREF: userREF ?? this.userREF,
    );
  }

    Map<String, dynamic> toMap() {
    return {
      'printoutTypes': this.printoutTypes,
      'quantityNeeded': this.quantityNeeded,
      'paperType': this.paperType,
      'brandGuidelines': this.brandGuidelines,
      'size': this.size,
      'dateLaunch': this.dateLaunch,
      'visionForMarketing': this.visionForMarketing,
      'status': this.status,
      'type': this.type,
      'createdTime': this.createdTime,
      'userREF': this.userREF,
    };
  }

  factory PrintoutRequestModel.fromMap(Map<String, dynamic> map) {
    return PrintoutRequestModel(
      printoutTypes: map['printoutTypes'] ??[],
      quantityNeeded: map['quantityNeeded'] as String,
      paperType: map['paperType'] ??[],
      brandGuidelines: map['brandGuidelines'] as String,
      size: map['size'] as String,
      dateLaunch: map['dateLaunch'] as String,
      visionForMarketing: map['visionForMarketing'] as String,
      status: map['status'] as String,
      type: map['type'] as String,
      //createdTime: map['createdTime'] as DateTime,
      userREF: map['userREF'] as DocumentReference,
    );
  }

//</editor-fold>
}