part of 'dmarketing_cubit.dart';

@immutable
abstract class DmarketingState {}

class DmarketingInitial extends DmarketingState {}
class ChangeIndexState extends DmarketingState {}
class ChangeRangeValuesState extends DmarketingState {}
class ChangeDate extends DmarketingState {}
class TogglePlatformState extends DmarketingState {}
class ToggleCampaignPlatformState extends DmarketingState {}

