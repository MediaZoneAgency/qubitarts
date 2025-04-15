import 'package:cloud_firestore/cloud_firestore.dart';

class BrandRequestModel {
  final List<dynamic> ?brandUsedPlaces;
  final DateTime? createdTime;
  final DocumentReference? userREF;
  final String? status;
  final String? type;
  final String ?palette;
  final List<dynamic>? idealCustomer;
  final List<dynamic>? fontStyles;
  final List<dynamic>? brandVisual;
  final String? brandGuidelines;
  final String? launchDate;
  final String? messagesToConvey;
  final String? specificTextOrPhrases;
  final String? assistanceCreatingScript;
  final String? yourVision;

//<editor-fold desc="Data Methods">
  const BrandRequestModel({
this.brandUsedPlaces,
    this.createdTime,
    this.userREF,
    this.status,
    this.type,
    this.brandVisual,
    this.palette,
    this.idealCustomer,
    this.fontStyles,
    this.brandGuidelines,
    this.launchDate,
    this.messagesToConvey,
    this.specificTextOrPhrases,
    this.assistanceCreatingScript,
    this.yourVision,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BrandRequestModel &&
          runtimeType == other.runtimeType &&
          createdTime == other.createdTime &&
          userREF == other.userREF &&
          status == other.status &&
          type == other.type &&
          brandVisual == other.brandVisual &&
          idealCustomer == other.idealCustomer &&
          fontStyles == other.fontStyles &&
          brandGuidelines == other.brandGuidelines &&
          launchDate == other.launchDate &&
          messagesToConvey == other.messagesToConvey &&
          specificTextOrPhrases == other.specificTextOrPhrases &&
          assistanceCreatingScript == other.assistanceCreatingScript &&
          yourVision == other.yourVision);

  @override
  int get hashCode =>
      createdTime.hashCode ^
      userREF.hashCode ^
      status.hashCode ^
      type.hashCode ^
    brandVisual.hashCode ^
      idealCustomer.hashCode ^
      fontStyles.hashCode ^
      brandGuidelines.hashCode ^
      launchDate.hashCode ^
      messagesToConvey.hashCode ^
      specificTextOrPhrases.hashCode ^
      assistanceCreatingScript.hashCode ^
      yourVision.hashCode;

  @override
  String toString() {
    return 'brandRequestModel{' +
        ' createdTime: $createdTime,' +
        ' userREF: $userREF,' +
        ' status: $status,' +
        ' type: $type,' +
        'palette: $palette'
        'brandVisual:$brandVisual'
        ' idealCustomer: $idealCustomer,' +
        ' fontStyles: $fontStyles,' +
        ' brandGuidelines: $brandGuidelines,' +
        ' launchDate: $launchDate,' +
        ' messagesToConvey: $messagesToConvey,' +
        ' specificTextOrPhrases: $specificTextOrPhrases,' +
        ' assistanceCreatingScript: $assistanceCreatingScript,' +
        ' yourVision: $yourVision,' +
        '}';
  }

  BrandRequestModel copyWith({
    List<dynamic>?brandUsedPlaces,
    DateTime? createdTime,
    DocumentReference? userREF,
    String? status,
    String? type,
    String? palette,
    List<dynamic> ?brandVisual,
    String? primaryGoal,
    List<dynamic>? idealCustomer,
    List<dynamic>? fontStyles,
    String? brandGuidelines,
    String? launchDate,
    String? messagesToConvey,
    String? specificTextOrPhrases,
    String? assistanceCreatingScript,
    String? yourVision,
  }) {
    return BrandRequestModel(
      brandUsedPlaces: brandUsedPlaces??this.brandUsedPlaces,
      createdTime: createdTime ?? this.createdTime,
      userREF: userREF ?? this.userREF,
      status: status ?? this.status,
      type: type ?? this.type,
      brandVisual: brandVisual??this.brandVisual,
      palette: palette??this.palette,
      idealCustomer: idealCustomer ?? this.idealCustomer,
      fontStyles: fontStyles ?? this.fontStyles,
      brandGuidelines: brandGuidelines ?? this.brandGuidelines,
      launchDate: launchDate ?? this.launchDate,
      messagesToConvey: messagesToConvey ?? this.messagesToConvey,
      specificTextOrPhrases:
          specificTextOrPhrases ?? this.specificTextOrPhrases,
      assistanceCreatingScript:
          assistanceCreatingScript ?? this.assistanceCreatingScript,
      yourVision: yourVision ?? this.yourVision,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'brandUsedPlaces':this.brandUsedPlaces,
      'createdTime': this.createdTime,
      'userREF': this.userREF,
      'status': this.status,
      'type': this.type,
      'palette':this.palette,
      'brandVisual': this.brandVisual,
      'idealCustomer': this.idealCustomer,
      'fontStyles': this.fontStyles,
      'brandGuidelines': this.brandGuidelines,
      'launchDate': this.launchDate,
      'messagesToConvey': this.messagesToConvey,
      'specificTextOrPhrases': this.specificTextOrPhrases,
      'assistanceCreatingScript': this.assistanceCreatingScript,
      'yourVision': this.yourVision,
    };
  }

  factory BrandRequestModel.fromMap(Map<String, dynamic> map) {
    return BrandRequestModel(
      brandUsedPlaces: map['brandUsedPlaces'] ,
      //createdTime: map['createdTime'] as DateTime,
      userREF: map['userREF'] as DocumentReference,
      status: map['status'] as String,
      type: map['type'] as String,
      palette: map['palette']??'',
      idealCustomer: map['idealCustomer'] ,
      brandVisual: map['brandVisual']??['k'],
      fontStyles: map['fontStyles'] ,
      brandGuidelines: map['brandGuidelines'] as String,
      launchDate: map['launchDate'] as String,
      messagesToConvey: map['messagesToConvey'] as String,
      specificTextOrPhrases: map['specificTextOrPhrases'] as String,
      assistanceCreatingScript: map['assistanceCreatingScript'] as String,
      yourVision: map['yourVision'] as String,
    );
  }

//</editor-fold>
}
