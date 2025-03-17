import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:qubitarts/core/helpers/extensions.dart';


import '../../../core/db/cash_helper.dart';
import '../../../core/error/api_error_model.dart';

import '../../../core/routing/routes.dart';
import '../../../qubitarts.dart';
import '../data/model/login_model.dart';
import '../data/repo/login_repo.dart';


part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {


  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);
  //bool isObscureText = true;

// changeObscure() {
//   isObscureText = !isObscureText;
//   emit(PasswordObscure());
// }

  Future<void> loginUser(String email, String password) async {
    emit(LoginLoading()); // Emit loading state

    final result = await LoginRepoImpl().loginUser(email, password);

    result.fold(
          (failure) {
        emit(LoginError(failure)); // Emit error state with error message
      },
          (user) async{
            await CashHelper.setStringScoured(
                key: Keys.token, value: user.uid ?? '');
        emit(LoginSuccess());

        // Emit success state with user object
      },
    );
  }

}
