part of 'one_service_cubit.dart';

@immutable
abstract class OneServiceState {}

/// Initial state before any action is taken.
class OneServiceInitial extends OneServiceState {}

/// State when the request is being fetched.
class OneServiceLoading extends OneServiceState {}

/// State when the request is successfully fetched.
///
/// Contains the parsed request data.
class GetRequestSuccess extends OneServiceState {
  final Map<String, dynamic> request;

  GetRequestSuccess({required this.request});
}

/// State when fetching the request fails.
///
/// Contains an error message.
class OneServiceFailure extends OneServiceState {
  final String error;

  OneServiceFailure({required this.error});
}
