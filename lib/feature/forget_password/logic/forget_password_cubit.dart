import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:qubitarts/feature/forget_password/data/repo/forget_password_repo.dart';
import 'package:qubitarts/qubitarts.dart';

import '../../../core/function/snack_bar.dart';
import '../../../generated/l10n.dart';

part 'forget_password_state.dart';
class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());

  static ForgetPasswordCubit get(context) => BlocProvider.of(context);

  Future<void> sendEmailToReset(String email) async {
    emit(SendEmailLoadingState());

    // Await the result to get the actual String value
    final result = await ForgetPassword().sendRecoveryEmail(email);

    // Now, compare the result with the actual values ("success" or "failure")
    if (result == "failure") {
      showSnackBar(
        context: NavigationService.navigatorKey.currentContext!,
        text: S.of(NavigationService.navigatorKey.currentContext!).RetryAgain,
      );
      emit(SendEmailFailureState());
    } else if (result == "success") {

      emit(SendEmailSuccessState());
    }
  }
}
