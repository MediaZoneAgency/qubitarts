class TeamDetailsModel {
  final String teamName;
  final String teamDeadline;
  final double teamPercentage;

//<editor-fold desc="Data Methods">
  const TeamDetailsModel({
    required this.teamName,
    required this.teamDeadline,
    required this.teamPercentage,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TeamDetailsModel &&
          runtimeType == other.runtimeType &&
          teamName == other.teamName &&
          teamDeadline == other.teamDeadline &&
          teamPercentage == other.teamPercentage);

  @override
  int get hashCode =>
      teamName.hashCode ^ teamDeadline.hashCode ^ teamPercentage.hashCode;

  @override
  String toString() {
    return 'TeamDetailsModel{' +
        ' teamName: $teamName,' +
        ' teamDeadline: $teamDeadline,' +
        ' teamPercentage: $teamPercentage,' +
        '}';
  }

  TeamDetailsModel copyWith({
    String? teamName,
    String? teamDeadline,
    double? teamPercentage,
  }) {
    return TeamDetailsModel(
      teamName: teamName ?? this.teamName,
      teamDeadline: teamDeadline ?? this.teamDeadline,
      teamPercentage: teamPercentage ?? this.teamPercentage,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'teamName': this.teamName,
      'teamDeadline': this.teamDeadline,
      'teamPercentage': this.teamPercentage,
    };
  }

  factory TeamDetailsModel.fromMap(Map<String, dynamic> map) {
    return TeamDetailsModel(
      teamName: map['teamName'] as String,
      teamDeadline: map['teamDeadline'] as String,
      teamPercentage: map['teamPercentage'] as double,
    );
  }

//</editor-fold>
}