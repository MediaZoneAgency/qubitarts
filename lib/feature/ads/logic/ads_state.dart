part of 'ads_cubit.dart';

@immutable
abstract class AdsState {}

class AdsInitial extends AdsState {}
class ChangeIndexState extends AdsState {}
class TogglePlatformState extends AdsState {}
class ChangeRangeValuesState extends AdsState {}
class ChangeDate extends AdsState {}
class ToggleCustomerState extends AdsState {}
class GetfileSucces extends AdsState{}
class AddRequestLoadingState extends AdsState{}
class AddRequestErrorState extends AdsState{}
class AddRequestSuccessState extends AdsState{}