part of 'forget_password_cubit.dart';

@immutable
sealed class ForgetPasswordState {}

final class ForgetPasswordInitial extends ForgetPasswordState {}
class SendEmailLoadingState extends ForgetPasswordState{}
class SendEmailSuccessState extends ForgetPasswordState{}
class SendEmailFailureState extends ForgetPasswordState{}
