import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgts/custom_describtion_text_field.dart';
import '../../../../generated/l10n.dart';
import '../../../add_website/ui/widgets/head_page.dart';
import '../../logic/print_out_cubit.dart' show PrintOutCubit;

class PrintOut4  extends StatefulWidget{
  const PrintOut4({super.key});

  @override
  State<PrintOut4> createState() => _PrintOut4State();
}

class _PrintOut4State extends State<PrintOut4> {
  TextEditingController controller = TextEditingController();

  void initState() {
    super.initState();

    // Add a listener to update domainName in AppsCubit
    controller.addListener(() {
      PrintOutCubit.get(context).visionForMarketing = controller.text;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 18.w, top: 39.h, end: 19.w,bottom: 19.h),

      child: ListView(children: [Column(children: [
        HeadPage(title: S.of(context).PrintOuts,),
        Text(S.of(context).Isthereaboutyourvisionfordigitalmarketing,style: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 16.7.sp),),

        Padding(
          padding:
          EdgeInsetsDirectional.only( top: 28.h,),
          child:CustomDescribtionTextField(hintText: S.of(context).TypeHere,backgroundColor: Color(0xffF9F9F9),borderColor:Color(0xffE4E4E4) ,containerHeight: 73.h,textStyle: TextStyles.inter25SemiBoldBlack.copyWith(fontSize: 14.sp),),

        )
      ],)],),
    );
  }
}