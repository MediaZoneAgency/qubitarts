import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qubitarts/feature/add_dMarkiting/ui/widgets/upload_file.dart';
import 'package:qubitarts/feature/brand_identity/logic/brand_identity_cubit.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../generated/l10n.dart';
import '../../../add_website/ui/widgets/head_page.dart';

class BrandIdentity4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
          start: 18.w, top: 39.h, end: 19.w, bottom: 19.h),
      child: ListView(
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            HeadPage(
              title: S.of(context).BrandIdentity,
            ),
            Text(
              S.of(context).Aretherespecificdesignassetsproducedor,
              style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 16.sp),
            ),
            verticalSpace(10),
            UploadFile(
              height: 67.h,
              background: Color(0xffF6F6F6),
              Uploed: () {
                BrandIdentityCubit.get(context).getPdfAndUpload();
              },
            ),
            verticalSpace(31),
            Divider(
              color: Colors.black.withOpacity(0.1),
              thickness: 1,
            ),
            //verticalSpace(16.h),
            Text(
              S.of(context).Describeimageryyourbrand,
              style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 16.sp),
            ),
            verticalSpace(10),
            UploadFile(
              height: 67.h,
              background: Color(0xffF6F6F6),
              Uploed: () {
                BrandIdentityCubit.get(context).getPdfAndUpload();
              },
            ),
          ]),
        ],
      ),
    );
  }
}
