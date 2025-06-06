import 'package:cloud_firestore/cloud_firestore.dart';

class DigitalRequestModel{
  final String? businessGoals;
  final String? uniqueSelling;
  final String? budget;
  final String? dateLaunchTime;
final String? brandGuideLines;
final List<dynamic>? platforms;
  final List<dynamic>? paidCampaigns;
final String visionForMarketing;
  final DateTime? createdTime;
  final DocumentReference? userREF;
  final String? status;
  final String? type;
  final String? quotationPDF;
  final String? contractPDF;
  final String? PaymentPDF;

//<editor-fold desc="Data Methods">
  const DigitalRequestModel({
    this.businessGoals,
    this.uniqueSelling,
    this.budget,
    this.dateLaunchTime,
    this.brandGuideLines,
    this.platforms,
    this.paidCampaigns,
    required this.visionForMarketing,
    this.createdTime,
    this.userREF,
    this.status,
    this.type,
    this.contractPDF,
    this.PaymentPDF,
    this.quotationPDF
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DigitalRequestModel &&
          runtimeType == other.runtimeType &&
          businessGoals == other.businessGoals &&
          uniqueSelling == other.uniqueSelling &&
          budget == other.budget &&
          dateLaunchTime == other.dateLaunchTime &&
          brandGuideLines == other.brandGuideLines &&
          platforms == other.platforms &&
          paidCampaigns == other.paidCampaigns &&
          visionForMarketing == other.visionForMarketing &&
          createdTime == other.createdTime &&
          userREF == other.userREF &&
          status == other.status &&
          type == other.type);

  @override
  int get hashCode =>
      businessGoals.hashCode ^
      uniqueSelling.hashCode ^
      budget.hashCode ^
      dateLaunchTime.hashCode ^
      brandGuideLines.hashCode ^
      platforms.hashCode ^
      paidCampaigns.hashCode ^
      visionForMarketing.hashCode ^
      createdTime.hashCode ^
      userREF.hashCode ^
      status.hashCode ^
      type.hashCode;

  @override
  String toString() {
    return 'DigitalRequestModel{' +
        ' businessGoals: $businessGoals,' +
        ' uniqueSelling: $uniqueSelling,' +
        ' budget: $budget,' +
        ' dateLaunchTime: $dateLaunchTime,' +
        ' brandGuideLines: $brandGuideLines,' +
        ' platforms: $platforms,' +
        ' paidCampaigns: $paidCampaigns,' +
        ' visionForMarketing: $visionForMarketing,' +
        ' createdTime: $createdTime,' +
        ' userREF: $userREF,' +
        ' status: $status,' +
        ' type: $type,' +
        '}';
  }

  DigitalRequestModel copyWith({
    String? businessGoals,
    String? uniqueSelling,
    String? budget,
    String? dateLaunchTime,
    String? brandGuideLines,
    List<String>? platforms,
    List<String>? paidCampaigns,
    String? visionForMarketing,
    DateTime? createdTime,
    DocumentReference? userREF,
    String? status,
    String? type,
  }) {
    return DigitalRequestModel(
      businessGoals: businessGoals ?? this.businessGoals,
      uniqueSelling: uniqueSelling ?? this.uniqueSelling,
      budget: budget ?? this.budget,
      dateLaunchTime: dateLaunchTime ?? this.dateLaunchTime,
      brandGuideLines: brandGuideLines ?? this.brandGuideLines,
      platforms: platforms ?? this.platforms,
      paidCampaigns: paidCampaigns ?? this.paidCampaigns,
      visionForMarketing: visionForMarketing ?? this.visionForMarketing,
      createdTime: createdTime ?? this.createdTime,
      userREF: userREF ?? this.userREF,
      status: status ?? this.status,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'businessGoals': this.businessGoals,
      'uniqueSelling': this.uniqueSelling,
      'budget': this.budget,
      'dateLaunchTime': this.dateLaunchTime,
      'brandGuideLines': this.brandGuideLines,
      'platforms': this.platforms,
      'paidCampaigns': this.paidCampaigns,
      'visionForMarketing': this.visionForMarketing,
      'createdTime': this.createdTime,
      'userREF': this.userREF,
      'status': this.status,
      'type': this.type,
      // 'PaymentPDF':this.PaymentPDF??'',
      // 'quotationPDF':this.quotationPDF??'',
      // 'contractPDF':this.contractPDF??'',
    };
  }

  factory DigitalRequestModel.fromMap(Map<String, dynamic> map) {
    return DigitalRequestModel(
      businessGoals: map['businessGoals'] ,
      uniqueSelling: map['uniqueSelling']??'' ,
      budget: map['budget'] ,
      dateLaunchTime: map['dateLaunchTime'] ,
      brandGuideLines: map['brandGuideLines'] ,
      platforms: map['platforms'] ,
      paidCampaigns: map['paidCampaigns'] ,
      visionForMarketing: map['visionForMarketing'] ,
      quotationPDF: map['quotationPDF'],
      PaymentPDF: map['PaymentPDF'],
      contractPDF: map['contractPDF'],
      //createdTime: map['createdTime'] as DateTime,
      userREF: map['userREF'] as DocumentReference,
      status: map['status'] as String,
      type: map['type'] as String,

    );
  }

//</editor-fold>
}