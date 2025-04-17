import 'package:cloud_firestore/cloud_firestore.dart';

class AppRequestModel {
  final String? domainName;
  final List<dynamic> features;
  final String? assistance;
  final String? launchDate;
  final String? willProvideHighResolutionImage;
  final String? iosOrAndroid;
  final String? visionDigitalMarketing;
  final DateTime? createdTime;
  final DocumentReference? userREF;
  final String? status;
  final String? type;
  final String? PaymentPDF;
  final String? contractPDF;
  final String? quotationPDF;
//<editor-fold desc="Data Methods">
  const AppRequestModel({
    this.domainName,
    required this.features,
    this.assistance,
    this.launchDate,
    this.willProvideHighResolutionImage,
    this.iosOrAndroid,
    this.visionDigitalMarketing,
    this.createdTime,
    this.userREF,
    this.status,
    this.type,
    this.PaymentPDF,
    this.contractPDF, this.quotationPDF
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppRequestModel &&
          runtimeType == other.runtimeType &&
          domainName == other.domainName &&
          features == other.features &&
          assistance == other.assistance &&
          launchDate == other.launchDate &&
          willProvideHighResolutionImage ==
              other.willProvideHighResolutionImage &&
          iosOrAndroid == other.iosOrAndroid &&
          visionDigitalMarketing == other.visionDigitalMarketing &&
          createdTime == other.createdTime &&
          userREF == other.userREF &&
          status == other.status &&
          type == other.type);

  @override
  int get hashCode =>
      domainName.hashCode ^
      features.hashCode ^
      assistance.hashCode ^
      launchDate.hashCode ^
      willProvideHighResolutionImage.hashCode ^
      iosOrAndroid.hashCode ^
      visionDigitalMarketing.hashCode ^
      createdTime.hashCode ^
      userREF.hashCode ^
      status.hashCode ^
      type.hashCode;

  @override
  String toString() {
    return 'AppRequestModel{' +
        ' domainName: $domainName,' +
        ' features: $features,' +
        ' assistance: $assistance,' +
        ' launchDate: $launchDate,' +
        ' willProvideHighResolutionImage: $willProvideHighResolutionImage,' +
        ' iosOrAndroid: $iosOrAndroid,' +
        ' visionDigitalMarketing: $visionDigitalMarketing,' +
        ' createdTime: $createdTime,' +
        ' userREF: $userREF,' +
        ' status: $status,' +
        ' type: $type,' +
        '}';
  }

  AppRequestModel copyWith({
    String? domainName,
    List<String>? features,
    String? assistance,
    String? launchDate,
    String? willProvideHighResolutionImage,
    String? iosOrAndroid,
    String? visionDigitalMarketing,
    DateTime? createdTime,
    DocumentReference? userREF,
    String? status,
    String? type,
  }) {
    return AppRequestModel(
      domainName: domainName ?? this.domainName,
      features: features ?? this.features,
      assistance: assistance ?? this.assistance,
      launchDate: launchDate ?? this.launchDate,
      willProvideHighResolutionImage:
          willProvideHighResolutionImage ?? this.willProvideHighResolutionImage,
      iosOrAndroid: iosOrAndroid ?? this.iosOrAndroid,
      visionDigitalMarketing:
          visionDigitalMarketing ?? this.visionDigitalMarketing,
      createdTime: createdTime ?? this.createdTime,
      userREF: userREF ?? this.userREF,
      status: status ?? this.status,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'domainName': this.domainName,
      'features': this.features,
      'assistance': this.assistance,
      'launchDate': this.launchDate,
      'willProvideHighResolutionImage': this.willProvideHighResolutionImage,
      'iosOrAndroid': this.iosOrAndroid,
      'visionDigitalMarketing': this.visionDigitalMarketing,
      'createdTime': this.createdTime,
      'userREF': this.userREF as DocumentReference,
      'status': this.status,
      'type': this.type,
      'PaymentPDF':this.PaymentPDF??'',
      'quotationPDF':this.quotationPDF??'',
      'contractPDF':this.contractPDF??'',
    };
  }

  factory AppRequestModel.fromMap(Map<String, dynamic> map) {
    return AppRequestModel(
      domainName: map['domainName'] as String,
      features: map['features'] ,
      assistance: map['assistance'] as String,
      launchDate: map['launchDate'] as String,
      willProvideHighResolutionImage:
          map['willProvideHighResolutionImage'] as String,
      iosOrAndroid: map['iosOrAndroid'] as String,
      visionDigitalMarketing: map['visionDigitalMarketing'] as String,
      //createdTime: map['createdTime'] as DateTime,
      userREF: map['userREF'] as DocumentReference,
      status: map['status'] as String,
      type: map['type'] as String,
        PaymentPDF: map['PaymentPDF'],
        quotationPDF: map['quotationPDF'],
        contractPDF: map['contractPDF']
    );
  }

//</editor-fold>
}
