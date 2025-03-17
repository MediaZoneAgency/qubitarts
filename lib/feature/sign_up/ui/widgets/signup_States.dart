
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qubitarts/core/error/error_handler.dart';
import 'package:qubitarts/core/helpers/extensions.dart';
import 'package:qubitarts/core/routing/routes.dart';
import 'package:qubitarts/feature/sign_up/logic/sign_up_cubit.dart';
import '../../../../../core/theming/colors.dart';

import '../../../../core/widgts/show_dailog_error.dart';


class SignupStateUi extends StatelessWidget {
  const SignupStateUi({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) async {
        if (state is SignUPLoading) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => PopScope(
              child: Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.yellow,
                ),
              ),
            ),
          );
        }
        // Handle LoginSuccess state
        else if (state is SignUPSuccess) {
          //NavBarCubit.get(context).changeIndex(0);
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          }
          context.pushNamedAndRemoveUntil(Routes.navigationBar, predicate: (Route<dynamic> route) { return false;});
        }

        // Handle LoginError and show the dialog here
        if (state is SignUPError) {
          Navigator.pop(context);
          ShowDialogError.showErrorDialog(
              context,
              "attention", // Pass the "attention" title here
              state.error
          );
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
//test
//test
//test
