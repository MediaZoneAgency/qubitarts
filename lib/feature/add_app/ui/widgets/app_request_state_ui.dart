import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qubitarts/core/helpers/extensions.dart';
import 'package:qubitarts/feature/add_app/logic/apps_cubit.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/widgts/show_dailog_error.dart';
import '../../../../generated/l10n.dart';

class AddAppRequestStateUi extends StatelessWidget {
  const AddAppRequestStateUi({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppsCubit,AppsState>(
      listener: (context, state) async {
        if (state is AddRequestLoadingState) {
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
        else if (state is AddRequestSuccessState) {
          //NavBarCubit.get(context).changeIndex(0);
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          }
          context.pushReplacementNamed(Routes.addAppFinalScreen);        }

        // Handle LoginError and show the dialog here
        if (state is AddRequestErrorState) {
          Navigator.pop(context);
          ShowDialogError.showErrorDialog(
              context,
              S.of(context).somethingWentWrong, // Pass the "attention" title here
              S.of(context).Tryagain
          );
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
