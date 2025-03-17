import 'package:cloud_firestore/cloud_firestore.dart';

class WebRequestModel{
   final String ?industry;
  final String ?businessState;
  final String ?businessName;
  final String ?businessDescription;
  final String ?preferredDomain;
  final String ?businessVision;
  final List<String> ?websiteFeatures;
  final String ?ProvideHighResoImage;
  final String ?launchDate;
  final String ?assistanceWithDomainName;
  final DateTime? createdTime;
  final DocumentReference? userREF;
  final String? status;
  final String? type;

//<editor-fold desc="Data Methods">
  const WebRequestModel({
    this.industry,
    this.businessState,
    this.businessName,
    this.businessDescription,
    this.preferredDomain,
    this.businessVision,
    this.websiteFeatures,
    this.ProvideHighResoImage,
    this.launchDate,
    this.assistanceWithDomainName,
    this.createdTime,
    this.userREF,
    this.status,
    this.type,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WebRequestModel &&
          runtimeType == other.runtimeType &&
          industry == other.industry &&
          businessState == other.businessState &&
          businessName == other.businessName &&
          businessDescription == other.businessDescription &&
          preferredDomain == other.preferredDomain &&
          businessVision == other.businessVision &&
          websiteFeatures == other.websiteFeatures &&
          ProvideHighResoImage == other.ProvideHighResoImage &&
          launchDate == other.launchDate &&
          assistanceWithDomainName == other.assistanceWithDomainName &&
          createdTime == other.createdTime &&
          userREF == other.userREF &&
          status == other.status &&
          type == other.type);

  @override
  int get hashCode =>
      industry.hashCode ^
      businessState.hashCode ^
      businessName.hashCode ^
      businessDescription.hashCode ^
      preferredDomain.hashCode ^
      businessVision.hashCode ^
      websiteFeatures.hashCode ^
      ProvideHighResoImage.hashCode ^
      launchDate.hashCode ^
      assistanceWithDomainName.hashCode ^
      createdTime.hashCode ^
      userREF.hashCode ^
      status.hashCode ^
      type.hashCode;

  @override
  String toString() {
    return 'WebRequestModel{' +
        ' industry: $industry,' +
        ' businessState: $businessState,' +
        ' businessName: $businessName,' +
        ' businessDescription: $businessDescription,' +
        ' preferredDomain: $preferredDomain,' +
        ' businessVision: $businessVision,' +
        ' websiteFeatures: $websiteFeatures,' +
        ' ProvideHighResoImage: $ProvideHighResoImage,' +
        ' launchDate: $launchDate,' +
        ' assistanceWithDomainName: $assistanceWithDomainName,' +
        ' createdTime: $createdTime,' +
        ' userREF: $userREF,' +
        ' status: $status,' +
        ' type: $type,' +
        '}';
  }

  WebRequestModel copyWith({
    String? industry,
    String? businessState,
    String? businessName,
    String? businessDescription,
    String? preferredDomain,
    String? businessVision,
    List<String>? websiteFeatures,
    String? ProvideHighResoImage,
    String? launchDate,
    String? assistanceWithDomainName,
    DateTime? createdTime,
    DocumentReference? userREF,
    String? status,
    String? type,
  }) {
    return WebRequestModel(
      industry: industry ?? this.industry,
      businessState: businessState ?? this.businessState,
      businessName: businessName ?? this.businessName,
      businessDescription: businessDescription ?? this.businessDescription,
      preferredDomain: preferredDomain ?? this.preferredDomain,
      businessVision: businessVision ?? this.businessVision,
      websiteFeatures: websiteFeatures ?? this.websiteFeatures,
      ProvideHighResoImage: ProvideHighResoImage ?? this.ProvideHighResoImage,
      launchDate: launchDate ?? this.launchDate,
      assistanceWithDomainName:
          assistanceWithDomainName ?? this.assistanceWithDomainName,
      createdTime: createdTime ?? this.createdTime,
      userREF: userREF ?? this.userREF,
      status: status ?? this.status,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'industry': this.industry,
      'businessState': this.businessState,
      'businessName': this.businessName,
      'businessDescription': this.businessDescription,
      'preferredDomain': this.preferredDomain,
      'businessVision': this.businessVision,
      'websiteFeatures': this.websiteFeatures,
      'ProvideHighResoImage': this.ProvideHighResoImage,
      'launchDate': this.launchDate,
      'assistanceWithDomainName': this.assistanceWithDomainName,
      'createdTime': this.createdTime,
      'userREF': this.userREF,
      'status': this.status,
      'type': this.type,
    };
  }

  factory WebRequestModel.fromMap(Map<String, dynamic> map) {
    return WebRequestModel(
      industry: map['industry'] as String,
      businessState: map['businessState'] as String,
      businessName: map['businessName'] as String,
      businessDescription: map['businessDescription'] as String,
      preferredDomain: map['preferredDomain'] as String,
      businessVision: map['businessVision'] as String,
      websiteFeatures: map['websiteFeatures'] as List<String>,
      ProvideHighResoImage: map['ProvideHighResoImage'] as String,
      launchDate: map['launchDate'] as String,
      assistanceWithDomainName: map['assistanceWithDomainName'] as String,
      createdTime: map['createdTime'] as DateTime,
      userREF: map['userREF'] as DocumentReference,
      status: map['status'] as String,
      type: map['type'] as String,
    );
  }

//</editor-fold>
}