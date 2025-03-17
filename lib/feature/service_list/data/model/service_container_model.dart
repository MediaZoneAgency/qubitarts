class ServiceContainerModel {
  final String title;
  final String description;
  final String image;
  final String route;

//<editor-fold desc="Data Methods">
  const ServiceContainerModel({
    required this.title,
    required this.description,
    required this.image,
    required this.route,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ServiceContainerModel &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          description == other.description &&
          image == other.image &&
          route == other.route);

  @override
  int get hashCode =>
      title.hashCode ^ description.hashCode ^ image.hashCode ^ route.hashCode;

  @override
  String toString() {
    return 'ServiceContainerModel{' +
        ' title: $title,' +
        ' description: $description,' +
        ' image: $image,' +
        ' route: $route,' +
        '}';
  }

  ServiceContainerModel copyWith({
    String? title,
    String? description,
    String? image,
    String? route,
  }) {
    return ServiceContainerModel(
      title: title ?? this.title,
      description: description ?? this.description,
      image: image ?? this.image,
      route: route ?? this.route,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': this.title,
      'description': this.description,
      'image': this.image,
      'route': this.route,
    };
  }

  factory ServiceContainerModel.fromMap(Map<String, dynamic> map) {
    return ServiceContainerModel(
      title: map['title'] as String,
      description: map['description'] as String,
      image: map['image'] as String,
      route: map['route'] as String,
    );
  }

//</editor-fold>
}