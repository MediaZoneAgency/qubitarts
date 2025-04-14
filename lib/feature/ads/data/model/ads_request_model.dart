import 'package:cloud_firestore/cloud_firestore.dart';

class AdsRequestModel{
  final List<dynamic> ?releventPlatforms;
  final List<dynamic> ?campaignsPlatforms;
  final List<dynamic> ?idealCustomer;
  final String? businessGoal;
final String ? budgetRange;
final String? brandGuideline;
final String ?uniqueSellingPropostion;
  final String ?launchDate;
  final String? visionDigitalMarketing;
  final DateTime? createdTime;
  final DocumentReference? userREF;
  final String? status;
  final String? type;
final String ? brandGuidelineFile;
//<editor-fold desc="Data Methods">
  const AdsRequestModel({
    this.releventPlatforms,
    this.campaignsPlatforms,
    this.idealCustomer,
    this.businessGoal,
    this.budgetRange,
    this.brandGuideline,
    this.uniqueSellingPropostion,
    this.launchDate,
    this.visionDigitalMarketing,
    this.createdTime,
    this.userREF,
    this.status,
    this.type,
    this.brandGuidelineFile
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AdsRequestModel &&
          runtimeType == other.runtimeType &&
          releventPlatforms == other.releventPlatforms &&
          campaignsPlatforms == other.campaignsPlatforms &&
          idealCustomer == other.idealCustomer &&
          businessGoal == other.businessGoal &&
          budgetRange == other.budgetRange &&
          brandGuideline == other.brandGuideline &&
          uniqueSellingPropostion == other.uniqueSellingPropostion &&
          launchDate == other.launchDate &&
          visionDigitalMarketing == other.visionDigitalMarketing &&
          createdTime == other.createdTime &&
          userREF == other.userREF &&
          status == other.status &&
          type == other.type);

  @override
  int get hashCode =>
      releventPlatforms.hashCode ^
      campaignsPlatforms.hashCode ^
      idealCustomer.hashCode ^
      businessGoal.hashCode ^
      budgetRange.hashCode ^
      brandGuideline.hashCode ^
      uniqueSellingPropostion.hashCode ^
      launchDate.hashCode ^
      visionDigitalMarketing.hashCode ^
      createdTime.hashCode ^
      userREF.hashCode ^
      status.hashCode ^
      type.hashCode;

  @override
  String toString() {
    return 'AdsRequestModel{' +
        ' releventPlatforms: $releventPlatforms,' +
        ' campaignsPlatforms: $campaignsPlatforms,' +
        ' idealCustomer: $idealCustomer,' +
        ' businessGoal: $businessGoal,' +
        ' budgetRange: $budgetRange,' +
        ' brandGuideline: $brandGuideline,' +
        ' uniqueSellingPropostion: $uniqueSellingPropostion,' +
        ' launchDate: $launchDate,' +
        ' visionDigitalMarketing: $visionDigitalMarketing,' +
        ' createdTime: $createdTime,' +
        ' userREF: $userREF,' +
        ' status: $status,' +
        ' type: $type,' +
        '}';
  }

  AdsRequestModel copyWith({
    List<dynamic>? releventPlatforms,
    List<dynamic>? campaignsPlatforms,
    List<dynamic>? idealCustomer,
    String? businessGoal,
    String? budgetRange,
    String? brandGuideline,
    String? uniqueSellingPropostion,
    String? launchDate,
    String? visionDigitalMarketing,
    DateTime? createdTime,
    DocumentReference? userREF,
    String? status,
    String? type,
  }) {
    return AdsRequestModel(
      releventPlatforms: releventPlatforms ?? this.releventPlatforms,
      campaignsPlatforms: campaignsPlatforms ?? this.campaignsPlatforms,
      idealCustomer: idealCustomer ?? this.idealCustomer,
      businessGoal: businessGoal ?? this.businessGoal,
      budgetRange: budgetRange ?? this.budgetRange,
      brandGuideline: brandGuideline ?? this.brandGuideline,
      uniqueSellingPropostion:
          uniqueSellingPropostion ?? this.uniqueSellingPropostion,
      launchDate: launchDate ?? this.launchDate,
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
      'releventPlatforms': this.releventPlatforms,
      'campaignsPlatforms': this.campaignsPlatforms,
      'idealCustomer': this.idealCustomer,
      'businessGoal': this.businessGoal,
      'budgetRange': this.budgetRange,
      'brandGuideline': this.brandGuideline,
      'uniqueSellingPropostion': this.uniqueSellingPropostion,
      'launchDate': this.launchDate,
      'visionDigitalMarketing': this.visionDigitalMarketing,
      'createdTime': this.createdTime,
      'userREF': this.userREF,
      'status': this.status,
      'type': this.type,
      'brandGuidelineFile': this.brandGuidelineFile
    };
  }

  factory AdsRequestModel.fromMap(Map<String, dynamic> map) {
    return AdsRequestModel(
      releventPlatforms: map['releventPlatforms'] ,
      campaignsPlatforms: map['campaignsPlatforms'] ,
      idealCustomer: map['idealCustomer'] ,
      businessGoal: map['businessGoal'] as String,
      budgetRange: map['budgetRange'] as String,
      brandGuideline: map['brandGuideline'] as String,
      uniqueSellingPropostion: map['uniqueSellingPropostion'] as String,
      launchDate: map['launchDate'] as String,
      visionDigitalMarketing: map['visionDigitalMarketing'] as String,
      //createdTime: map['createdTime'] as DateTime,
      userREF: map['userREF'] as DocumentReference,
      status: map['status'] as String,
      type: map['type'] as String,
      brandGuidelineFile: map['brandGuidelineFile']
    );
  }

//</editor-fold>
}