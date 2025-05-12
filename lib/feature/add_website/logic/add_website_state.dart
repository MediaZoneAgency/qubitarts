part of 'add_website_cubit.dart';

@immutable
abstract class AddWebsiteState {}

class AddWebsiteInitial extends AddWebsiteState {}
class ChangeIndexState extends AddWebsiteState {}
class ToggleState extends AddWebsiteState {}
class ToggleFeaturesState extends AddWebsiteState {}
class ChangeDate extends AddWebsiteState {}
class ToggleStateAssistant extends AddWebsiteState {}
class ToggleStateYes extends AddWebsiteState {}
class SelectIndustryState extends AddWebsiteState {}
class ScreenValditeState extends AddWebsiteState {}
class AddRequestLoadingState extends AddWebsiteState{}
class AddRequestErrorState extends AddWebsiteState{}
class AddRequestSuccessState extends AddWebsiteState{}