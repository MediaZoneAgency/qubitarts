import 'package:cloud_firestore/cloud_firestore.dart';

class MotionGraphicModel {
  final String ? primaryGoal;
  final List<dynamic> ? idealCustomer;
  final List<dynamic> ? fontStyles;
  final String ? colorPalette;
  final String ? brandGuidelines;
  final String? launchDate;
  final String? messagesToConvey;
  final String? specificTextOrPhrases;
  final String? assistanceCreatingScript;
  final String? visionForMarketing;
  final DateTime? createdTime;
  final DocumentReference? userREF;
  final String? status;
  final String? type;
final String? PaymentPDF;
final String? contractPDF;
final String? quotationPDF;

//<editor-fold desc="Data Methods">
  const MotionGraphicModel({
    this.primaryGoal,
    this.idealCustomer,
    this.fontStyles,
    this.colorPalette,
    this.brandGuidelines,
    this.launchDate,
    this.messagesToConvey,
    this.specificTextOrPhrases,
    this.assistanceCreatingScript,
    this.visionForMarketing,
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
      (other is MotionGraphicModel &&
          runtimeType == other.runtimeType &&
          primaryGoal == other.primaryGoal &&
          idealCustomer == other.idealCustomer &&
          fontStyles == other.fontStyles &&
          colorPalette == other.colorPalette &&
          brandGuidelines == other.brandGuidelines &&
          launchDate == other.launchDate &&
          messagesToConvey == other.messagesToConvey &&
          specificTextOrPhrases == other.specificTextOrPhrases &&
          assistanceCreatingScript == other.assistanceCreatingScript &&
          visionForMarketing == other.visionForMarketing &&
          createdTime == other.createdTime &&
          userREF == other.userREF &&
          status == other.status &&
          type == other.type);

  @override
  int get hashCode =>
      primaryGoal.hashCode ^
      idealCustomer.hashCode ^
      fontStyles.hashCode ^
      colorPalette.hashCode ^
      brandGuidelines.hashCode ^
      launchDate.hashCode ^
      messagesToConvey.hashCode ^
      specificTextOrPhrases.hashCode ^
      assistanceCreatingScript.hashCode ^
      visionForMarketing.hashCode ^
      createdTime.hashCode ^
      userREF.hashCode ^
      status.hashCode ^
      type.hashCode;

  @override
  String toString() {
    return 'MotionGraphicModel{' +
        ' primaryGoal: $primaryGoal,' +
        ' idealCustomer: $idealCustomer,' +
        ' fontStyles: $fontStyles,' +
        ' colorPalette: $colorPalette,' +
        ' brandGuidelines: $brandGuidelines,' +
        ' launchDate: $launchDate,' +
        ' messagesToConvey: $messagesToConvey,' +
        ' specificTextOrPhrases: $specificTextOrPhrases,' +
        ' assistanceCreatingScript: $assistanceCreatingScript,' +
        ' visionForMarkiting: $visionForMarketing,' +
        ' createdTime: $createdTime,' +
        ' userREF: $userREF,' +
        ' status: $status,' +
        ' type: $type,' +
        '}';
  }

  MotionGraphicModel copyWith({
    String? primaryGoal,
    List<String>? idealCustomer,
    List<String>? fontStyles,
    String? colorPalette,
    String? brandGuidelines,
    String? launchDate,
    String? messagesToConvey,
    String? specificTextOrPhrases,
    String? assistanceCreatingScript,
    String? visionForMarkiting,
    DateTime? createdTime,
    DocumentReference? userREF,
    String? status,
    String? type,
  }) {
    return MotionGraphicModel(
      primaryGoal: primaryGoal ?? this.primaryGoal,
      idealCustomer: idealCustomer ?? this.idealCustomer,
      fontStyles: fontStyles ?? this.fontStyles,
      colorPalette: colorPalette ?? this.colorPalette,
      brandGuidelines: brandGuidelines ?? this.brandGuidelines,
      launchDate: launchDate ?? this.launchDate,
      messagesToConvey: messagesToConvey ?? this.messagesToConvey,
      specificTextOrPhrases:
          specificTextOrPhrases ?? this.specificTextOrPhrases,
      assistanceCreatingScript:
          assistanceCreatingScript ?? this.assistanceCreatingScript,
      visionForMarketing: visionForMarkiting ?? this.visionForMarketing,
      createdTime: createdTime ?? this.createdTime,
      userREF: userREF ?? this.userREF,
      status: status ?? this.status,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'primaryGoal': this.primaryGoal,
      'idealCustomer': this.idealCustomer,
      'fontStyles': this.fontStyles,
      'colorPalette': this.colorPalette,
      'brandGuidelines': this.brandGuidelines,
      'launchDate': this.launchDate,
      'messagesToConvey': this.messagesToConvey,
      'specificTextOrPhrases': this.specificTextOrPhrases,
      'assistanceCreatingScript': this.assistanceCreatingScript,
      'visionForMarkiting': this.visionForMarketing,
      'createdTime': this.createdTime,
      'userREF': this.userREF,
      'status': this.status,
      'type': this.type,
      // 'PaymentPDF':this.PaymentPDF??'',
      // 'quotationPDF':this.quotationPDF??'',
      // 'contractPDF':this.contractPDF??'',

    };
  }

  factory MotionGraphicModel.fromMap(Map<String, dynamic> map) {
    return MotionGraphicModel(
      primaryGoal: map['primaryGoal'] ??'',
      idealCustomer: map['idealCustomer'] ??[],
      fontStyles: map['fontStyles']??[] ,
      colorPalette: map['colorPalette'] ??'',
      brandGuidelines: map['brandGuidelines']??'',
      launchDate: map['launchDate'] as String,
      messagesToConvey: map['messagesToConvey'] ??'',
      specificTextOrPhrases: map['specificTextOrPhrases'] ??'',
      assistanceCreatingScript: map['assistanceCreatingScript'] ??'',
      visionForMarketing: map['visionForMarketing']??'' ,
      //createdTime: map['createdTime'] as DateTime,
      userREF: map['userREF'] as DocumentReference,
      status: map['status'] as String,
      type: map['type'] as String,
      PaymentPDF: map['PaymentPDF']??'',
        quotationPDF: map['quotationPDF']??'',
      contractPDF: map['contractPDF']??''
    );
  }

//</editor-fold>
}