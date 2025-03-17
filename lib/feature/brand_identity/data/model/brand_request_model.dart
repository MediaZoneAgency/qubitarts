import 'package:cloud_firestore/cloud_firestore.dart';

class BrandRequestModel {
  final List<String> ?brandUsedPlaces;
  final DateTime? createdTime;
  final DocumentReference? userREF;
  final String? status;
  final String? type;
  
  final List<String>? idealCustomer;
  final List<String>? fontStyles;
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
    List<String>?brandUsedPlaces,
    DateTime? createdTime,
    DocumentReference? userREF,
    String? status,
    String? type,
    String? primaryGoal,
    List<String>? idealCustomer,
    List<String>? fontStyles,
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
      brandUsedPlaces: map['brandUsedPlaces']as List<String>,
      createdTime: map['createdTime'] as DateTime,
      userREF: map['userREF'] as DocumentReference,
      status: map['status'] as String,
      type: map['type'] as String,
      
      idealCustomer: map['idealCustomer'] as List<String>,
      fontStyles: map['fontStyles'] as List<String>,
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
