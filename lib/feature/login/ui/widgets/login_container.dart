import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qubitarts/core/error/error_handler.dart';
import 'package:qubitarts/core/helpers/extensions.dart';
import 'package:qubitarts/core/widgts/app_text_button.dart';
import 'package:qubitarts/core/widgts/app_text_form_field.dart';

import '../../../../core/assets/images.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../generated/l10n.dart';
import '../../../sign_up/ui/widgets/Sign_up_with.dart';
import '../../logic/login_cubit.dart';
import 'login_States.dart';

class loginContainer extends StatefulWidget {
  const loginContainer({
    super.key,
  });

  @override
  State<loginContainer> createState() => _loginContainerState();
}

class _loginContainerState extends State<loginContainer> {
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController usernameEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  bool showPassword = true;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
  builder: (context, state) {
    return Container(
     // height: 495.h,
      width: 367.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(34.r),
          color: ColorsManager.white),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(top: 26.h, bottom: 28.h),
              child: Text(
                textAlign: TextAlign.center
                ,S.of(context).SIGNIN,
                style: TextStyles.lato20ExtraBoldBlack,
              ),
            ),

            buildTextField(context, S.of(context).EnterYourUsernameEmail,
                SizedBox(), false, (value) {
              if (value == null || value.isEmpty) {
                return S.of(context).Mustnotbeempty;
              }
              return null;
            },emailEditingController),
            verticalSpace(30.h),
            buildTextField(
                context,
                S.of(context).EnterYourPassword,
                IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: Icon(
                      showPassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: Colors.black.withOpacity(0.5),
                      size: 24.sp,
                    )),
                showPassword, (value) {
              final passwordRegex = RegExp(
                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*]).{8,}$');
              if (!passwordRegex.hasMatch(value!)) {
                return S.of(context).Enteravalidpassword;
              }
              return null;
            },passwordEditingController),
            verticalSpace(12.h),
            AppTextButton(
                buttonText: S.of(context).ForgotPassword,
                textStyle: TextStyles.poppins14MediumPurple
                    .copyWith(color: Color(0xff271D44)),
                onPressed: () {
                  context.pushNamed(Routes.forgetPassword);
                }),
            verticalSpace(23.h),
            AppTextButton(
                buttonHeight: 40.h,
                buttonWidth: 218.w,
                backgroundColor: Color(0xffC1CAD0).withOpacity(0.9),
                buttonText: S.of(context).Login,
                textStyle: TextStyles.poppins14SemiBoldDarkPurple,
                borderRadius: 17.r,
                onPressed: () {
                 LoginCubit.get(context).loginUser(
                   emailEditingController.text,
                   passwordEditingController.text,
                 );
                 // context.pushNamed(Routes.navigationBar);
                }),

            // Text(S.of(context).Or,style: TextStyles.lato16MediumGray,),
            verticalSpace(55.h),
            SignUpWith(
              onTap: (){},
              background: const Color(0xff1877F2),
              image: ImagesManager.facebookLogo,
              text: S.of(context).LoginwithFacebook,
              textStyle: TextStyles.poppins10SemiBoldWhite,
            ),
            verticalSpace(8.h),
            SignUpWith(
              onTap: (){},
              background: Colors.white,
              image: ImagesManager.googleLogo,
              text: S.of(context).LoginwithGoogle,
              textStyle: TextStyles.poppins10SemiBoldWhite
                  .copyWith(color: Colors.black.withOpacity(0.6)),
            ),
            verticalSpace(9.h),

          ],
        ),
      ),
    );
  },
);
  }

  Padding buildTextField(BuildContext context, String hint, Widget? suffixIcon,
      bool? showText, String? Function(String?)? validator,TextEditingController controller) {
    return Padding(
      padding: EdgeInsets.only(left: 27.w, right: 27.w),
      child: AppTextFormField(
        controller: controller,
        validator: validator,
        isObscureText: showText,
        suffixIcon: suffixIcon,
        contentPadding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 12.w),
        hintStyle: TextStyles.poppins12RegularBlack,
        height: 48.h,
        enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.black.withOpacity(0.0), width: 1.w),
            borderRadius: BorderRadius.circular(10.r)),
        hintText: hint,
        backgroundColor: Colors.white.withOpacity(0.2),
      ),
    );
  }
}
