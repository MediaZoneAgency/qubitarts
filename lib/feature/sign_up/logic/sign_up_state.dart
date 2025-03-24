part of 'sign_up_cubit.dart';

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}
class SignUPLoading extends SignUpState {}
class SignUPSuccess extends SignUpState {}

class SignUPError extends SignUpState {
  final String error;
  SignUPError(this.error);
}
class SignUPWithGoogleLoading extends SignUpState {}
class SignUPWithGoogleSuccess extends SignUpState {}

class SignUPWithGoogleError extends SignUpState {

}