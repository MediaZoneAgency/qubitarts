part of 'current_services_cubit.dart';

@immutable
abstract class CurrentServicesState {}

class CurrentServicesInitial extends CurrentServicesState {}
class ChangeIndexState extends CurrentServicesState {}
class CurrentServicesSuccess extends CurrentServicesState {}

class CurrentServicesError extends CurrentServicesState {}
 class CurrentServicesLoading extends CurrentServicesState {}
