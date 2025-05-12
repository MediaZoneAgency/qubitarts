part of 'brand_identity_cubit.dart';

@immutable
abstract class BrandIdentityState {}

class BrandIdentityInitial extends BrandIdentityState {}
class ChangeIndexState extends BrandIdentityState {}
class ToggleCustomerState extends BrandIdentityState {}
class ChangeDate extends BrandIdentityState {}
class ToggleColorPalette extends BrandIdentityState {}
class GetfileSucces extends BrandIdentityState{}
class AddRequestLoadingState extends BrandIdentityState{}
class AddRequestErrorState extends BrandIdentityState{}
class AddRequestSuccessState extends BrandIdentityState{}