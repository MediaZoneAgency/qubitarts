part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}
class ProfileLoadingState extends ProfileState {}
class ProfileSuccessState extends ProfileState {}
class ProfileErrorState extends ProfileState {}

