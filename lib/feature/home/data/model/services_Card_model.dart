class ServicesCardModel {


  const ServicesCardModel({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.route,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ServicesCardModel &&
          runtimeType == other.runtimeType &&
          image == other.image &&
          title == other.title &&
          subtitle == other.subtitle);

  @override
  int get hashCode => image.hashCode ^ title.hashCode ^ subtitle.hashCode;

  @override
  String toString() {
    return 'ServicesCardModel{' +
        ' image: $image,' +
        ' title: $title,' +
        ' subtitle: $subtitle,' +
        '}';
  }

  ServicesCardModel copyWith({
    String? image,
    String? title,
    String? subtitle,
    String? route
  }) {
    return ServicesCardModel(
      image: image ?? this.image,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle, route: route ?? this.route  ,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'image': this.image,
      'title': this.title,
      'subtitle': this.subtitle,
    };
  }

  factory ServicesCardModel.fromMap(Map<String, dynamic> map) {
    return ServicesCardModel(
      image: map['image'] as String,
      title: map['title'] as String,
      subtitle: map['subtitle'] as String, route:map['route'] as String,
    );
  }

  //</editor-fold>
  final String image;
  final String title;
  final String subtitle;
  final String route;
}