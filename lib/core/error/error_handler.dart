import 'package:dio/dio.dart';

//import '../../cubit_app.dart';

import '../../generated/l10n.dart';

import '../../qubitarts.dart';
import '../helpers/extensions.dart';
import '../routing/routes.dart';
import 'api_error_model.dart';


class ApiErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      // Log the DioException details, using null-aware operators to avoid null errors
      print("DioException caught: ${error.type}, Message: ${error.message ?? 'No message'}");

      switch (error.type) {
        case DioExceptionType.connectionError:
          return ApiErrorModel(
              message: S
                  .of(NavigationService.navigatorKey.currentContext!)
                  .connectionToServerFailed);
        case DioExceptionType.cancel:
          return ApiErrorModel(
              message: S
                  .of(NavigationService.navigatorKey.currentContext!)
                  .requestToTheServerWasCancelled);
        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(
              message: S
                  .of(NavigationService.navigatorKey.currentContext!)
                  .connectionTimeoutWithTheServer);
        case DioExceptionType.unknown:
          return ApiErrorModel(
              message: S
                  .of(NavigationService.navigatorKey.currentContext!)
                  .connectionToTheServerFailedDueToInternetConnection);
        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(
              message: S
                  .of(NavigationService.navigatorKey.currentContext!)
                  .receiveTimeOutInConnectionWithTheServer);
        case DioExceptionType.badResponse:
        // Safely handle potential nulls in statusCode and responseData
          final statusCode = error.response?.statusCode ?? 500; // default to 500 if null
          final responseData = error.response?.data ?? {};
          print("Bad Response Error: StatusCode: $statusCode, Data: ${responseData.toString()}");

          return _handleError(statusCode, responseData);
        case DioExceptionType.sendTimeout:
          return ApiErrorModel(
              message: S
                  .of(NavigationService.navigatorKey.currentContext!)
                  .sendTimeoutInConnectionWithTheServer);
        default:
          return ApiErrorModel(
              message: S
                  .of(NavigationService.navigatorKey.currentContext!)
                  .somethingWentWrong);
      }
    } else {
      // Log any non-Dio error with details for easier debugging
      print("Unexpected non-Dio error: $error");
      return ApiErrorModel(
          message: S
              .of(NavigationService.navigatorKey.currentContext!)
              .UnexpectedErrorOccurred);
    }
  }


  static ApiErrorModel _handleError(int? statusCode, dynamic error) {
    if(statusCode == 403){
      return ApiErrorModel(
        message: 'email or password is not correct',
        code: statusCode,
        errors: error['data'],
      );
    }
    else if(statusCode == 401){
      ApiErrorModel(
        message: 'u need to login',
        code: statusCode,
        errors: error['data'],
      );
    }
    return ApiErrorModel(
      message: error['message'] ??
          'errroor',
      code: statusCode,
      errors: error['data'],
    );
  }
}
