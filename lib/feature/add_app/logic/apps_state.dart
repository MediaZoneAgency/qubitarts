part of 'apps_cubit.dart';

@immutable
abstract class AppsState {}

class AppsInitial extends AppsState {}
class ChangeIndexState extends AppsState {}
class ToggleFeaturesState extends AppsState {}
class ChangeDate extends AppsState {}
class ToggleStateAssistant extends AppsState {}
class ToggleStateYes extends AppsState {}
class ToggleStatePlatform extends AppsState {}
class AddRequestLoadingState extends AppsState{}
class AddRequestErrorState extends AppsState{}
class AddRequestSuccessState extends AppsState{}