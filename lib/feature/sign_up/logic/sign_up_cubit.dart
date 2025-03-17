import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:qubitarts/core/helpers/extensions.dart';

import '../../../core/db/cash_helper.dart';
import '../../../core/error/api_error_model.dart';

import '../../../core/routing/routes.dart';
import '../../../qubitarts.dart';
import '../data/model/sign_up_model.dart';
import '../data/repo/signup_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {

  SignUpCubit() : super(SignUpInitial());
  static SignUpCubit get(context) => BlocProvider.of(context);
  Future<void> signupUser(String username, String password, String phoneNumber, String email) async {
    emit(SignUPLoading()); // Emit loading state

    final result = await SignUPRepoImpl().signUpUser(
      SingUPModel(
        username: username,
        password: password,
        email: email,
        phoneNumber: phoneNumber,
      ),
    );

    result.fold(
          (failure) {
        emit(SignUPError(failure)); // Emit error state with message
      },
          (user) async{
            await CashHelper.setStringScoured(
                key: Keys.token, value: user.uid ?? '');
        emit(SignUPSuccess()); // Emit success state with message
      },
    );
  }

}
