import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qubitarts/feature/add_dMarkiting/ui/widgets/upload_file.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgts/custom_describtion_text_field.dart';
import '../../../../generated/l10n.dart';
import '../../../add_website/ui/widgets/head_page.dart';
import '../../logic/brand_identity_cubit.dart';

class BrandIdentity5 extends StatefulWidget {
  const BrandIdentity5({super.key});

  @override
  State<BrandIdentity5> createState() => _BrandIdentity5State();
}

class _BrandIdentity5State extends State<BrandIdentity5> {
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();

  @override
  void initState() {
    super.initState();

    final cubit = BrandIdentityCubit.get(context);

    controller1.text = cubit.messagesToConvey;
    controller2.text = cubit.specificTextOrPhrases;

    controller1.addListener(() {
      cubit.messagesToConvey = controller1.text;
    });

    controller2.addListener(() {
      cubit.specificTextOrPhrases = controller2.text;
    });
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }

  Widget _buildTextFieldSection(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 16.sp),
        ),
        verticalSpace(7),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 18.h),
          child: CustomDescribtionTextField(
            controller: controller,
            hintText: S.of(context).TypeHere,
            backgroundColor: const Color(0xffF9F9F9),
            borderColor: const Color(0xffE4E4E4),
            containerHeight: 73.h,
            textStyle: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.sp),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(18.w, 39.h, 19.w, 19.h),
      child: ListView(
        children: [
          HeadPage(title: S.of(context).BrandIdentity),
          _buildTextFieldSection(S.of(context).Whatmessagestoconvey, controller1),
          Divider(color: Colors.black.withOpacity(0.1), thickness: 1),
          _buildTextFieldSection(S.of(context).Aretherespecifictextorphrases, controller2),
        ],
      ),
    );
  }
}

