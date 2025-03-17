import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qubitarts/core/assets/images.dart';
import 'package:qubitarts/core/helpers/spacing.dart';
import 'package:qubitarts/core/widgts/app_text_button.dart';
import 'package:qubitarts/core/widgts/app_text_form_field.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../generated/l10n.dart';
import '../../logic/sign_up_cubit.dart';
import 'signup_States.dart';
import 'Sign_up_with.dart';

class SignUPContainer extends StatefulWidget {
  const SignUPContainer({
    super.key,
  });

  @override
  State<SignUPContainer> createState() => _SignUPContainerState();
}

class _SignUPContainerState extends State<SignUPContainer> {
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController usernameEditingController = TextEditingController();
  TextEditingController phoneNumberEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  bool showPassword = true;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return Container(
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
                  padding: EdgeInsetsDirectional.only(top: 23.h, bottom: 18.h),
                  child: Text(
                    S.of(context).SIGNUP,
                    style: TextStyles.lato20ExtraBoldBlack,
                  ),
                ),
                buildTextField(
                    context, S.of(context).EnterYourUsername, SizedBox(), false,
                    (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).Mustnotbeempty;
                  }
                  return null;
                }, usernameEditingController),
                verticalSpace(18.h),
                buildTextField(
                    context, S.of(context).EnterYourEmail, SizedBox(), false,
                    (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).Mustnotbeempty;
                  }
                  return null;
                }, emailEditingController),
                verticalSpace(18.h),
                buildTextField(context, S.of(context).EnterYourPhoneNumber,
                    SizedBox(), false, (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).Mustnotbeempty;
                  }
                  return null;
                }, phoneNumberEditingController),
                verticalSpace(18.h),
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
                }, passwordEditingController),
                verticalSpace(9.h),
                AppTextButton(
                    buttonHeight: 40.h,
                    buttonWidth: 218.w,
                    backgroundColor: Color(0xffC1CAD0).withOpacity(0.9),
                    buttonText: S.of(context).SIGNUP,
                    textStyle: TextStyles.poppins14SemiBoldDarkPurple,
                    borderRadius: 17.r,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        SignUpCubit.get(context).signupUser(
                          usernameEditingController.text,
                          passwordEditingController.text,
                          phoneNumberEditingController.text,
                          emailEditingController.text,
                        );
                      }
                    }),
                verticalSpace(6.h),
                Text(
                  S.of(context).Or,
                  style: TextStyles.lato16MediumGray,
                ),
                verticalSpace(8.h),
                SignUpWith(
                  background: Color(0xff1877F2),
                  image: ImagesManager.facebookLogo,
                  text: S.of(context).SignUpwithFacebook,
                  textStyle: TextStyles.poppins10SemiBoldWhite,
                ),
                verticalSpace(8.h),
                SignUpWith(
                  background: Colors.white,
                  image: ImagesManager.googleLogo,
                  text: S.of(context).SignUpwithGoogle,
                  textStyle: TextStyles.poppins10SemiBoldWhite
                      .copyWith(color: Colors.black.withOpacity(0.6)),
                ),
                verticalSpace(8.h),
                SignupStateUi()
              ],
            ),
          ),
        );
      },
    );
  }

  Padding buildTextField(
      BuildContext context,
      String hint,
      Widget? suffixIcon,
      bool? showText,
      String? Function(String?)? validator,
      TextEditingController controller) {
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
