part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class LoginLoading extends LoginState {}
class LoginSuccess extends LoginState {}
class LoginError extends LoginState {
  final String error;
  LoginError(this.error);
}
class SignInWithGoogleLoading extends LoginState{}
class SignInWithGoogleError extends LoginState{}
class SignInWithGoogleSuccess extends LoginState{}