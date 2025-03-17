class TaskModel {
  final String replyment1;

  final String replyment2;

  final String name1;

  final String name2;

  final String job1;
  final String job2;
  final String profileImage1;
  final String profileImage2;
  final String date1;
  final String date2;
  final String description;
  final String compImage;
  final String replyment;

//<editor-fold desc="Data Methods">
  const TaskModel({
    required this.replyment1,
    required this.replyment2,
    required this.name1,
    required this.name2,
    required this.job1,
    required this.job2,
    required this.profileImage1,
    required this.profileImage2,
    required this.date1,
    required this.date2,
    required this.description,
    required this.compImage,
    required this.replyment,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaskModel &&
          runtimeType == other.runtimeType &&
          replyment1 == other.replyment1 &&
          replyment2 == other.replyment2 &&
          name1 == other.name1 &&
          name2 == other.name2 &&
          job1 == other.job1 &&
          job2 == other.job2 &&
          profileImage1 == other.profileImage1 &&
          profileImage2 == other.profileImage2 &&
          date1 == other.date1 &&
          date2 == other.date2 &&
          description == other.description &&
          compImage == other.compImage &&
          replyment == other.replyment);

  @override
  int get hashCode =>
      replyment1.hashCode ^
      replyment2.hashCode ^
      name1.hashCode ^
      name2.hashCode ^
      job1.hashCode ^
      job2.hashCode ^
      profileImage1.hashCode ^
      profileImage2.hashCode ^
      date1.hashCode ^
      date2.hashCode ^
      description.hashCode ^
      compImage.hashCode ^
      replyment.hashCode;

  @override
  String toString() {
    return 'TaskModel{' +
        ' replyment1: $replyment1,' +
        ' replyment2: $replyment2,' +
        ' name1: $name1,' +
        ' name2: $name2,' +
        ' job1: $job1,' +
        ' job2: $job2,' +
        ' profileImage1: $profileImage1,' +
        ' profileImage2: $profileImage2,' +
        ' date1: $date1,' +
        ' date2: $date2,' +
        ' description: $description,' +
        ' compImage: $compImage,' +
        ' replyment: $replyment,' +
        '}';
  }

  TaskModel copyWith({
    String? replyment1,
    String? replyment2,
    String? name1,
    String? name2,
    String? job1,
    String? job2,
    String? profileImage1,
    String? profileImage2,
    String? date1,
    String? date2,
    String? description,
    String? compImage,
    String? replyment,
  }) {
    return TaskModel(
      replyment1: replyment1 ?? this.replyment1,
      replyment2: replyment2 ?? this.replyment2,
      name1: name1 ?? this.name1,
      name2: name2 ?? this.name2,
      job1: job1 ?? this.job1,
      job2: job2 ?? this.job2,
      profileImage1: profileImage1 ?? this.profileImage1,
      profileImage2: profileImage2 ?? this.profileImage2,
      date1: date1 ?? this.date1,
      date2: date2 ?? this.date2,
      description: description ?? this.description,
      compImage: compImage ?? this.compImage,
      replyment: replyment ?? this.replyment,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'replyment1': this.replyment1,
      'replyment2': this.replyment2,
      'name1': this.name1,
      'name2': this.name2,
      'job1': this.job1,
      'job2': this.job2,
      'profileImage1': this.profileImage1,
      'profileImage2': this.profileImage2,
      'date1': this.date1,
      'date2': this.date2,
      'description': this.description,
      'compImage': this.compImage,
      'replyment': this.replyment,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      replyment1: map['replyment1'] as String,
      replyment2: map['replyment2'] as String,
      name1: map['name1'] as String,
      name2: map['name2'] as String,
      job1: map['job1'] as String,
      job2: map['job2'] as String,
      profileImage1: map['profileImage1'] as String,
      profileImage2: map['profileImage2'] as String,
      date1: map['date1'] as String,
      date2: map['date2'] as String,
      description: map['description'] as String,
      compImage: map['compImage'] as String,
      replyment: map['replyment'] as String,
    );
  }

//</editor-fold>
}