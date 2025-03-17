import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../home/data/model/services_Card_model.dart';
import '../../../home/ui/widgets/custum_switch.dart';
class ServiceCard extends StatelessWidget {
  const ServiceCard({
    super.key,
    required this.item, required this.onTap,
  });

  final ServicesCardModel item;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22.5.r),
        ),
        elevation: 5,
        child: Container(
          height: 197.7.h,
          decoration: BoxDecoration(
            //  boxShadow: [
            //    BoxShadow(
            //      offset: Offset(93, 93),
            //      color: Colors.white,
      
            //    )
            //  ],
            borderRadius: BorderRadius.circular(22.55.h),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:  EdgeInsetsDirectional.only(top: 18.0.h,start: 22.5.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: TextStyles.lato20BoldBlack,
                        ),
                        verticalSpace( 8.0.h),
                        Text(
                          overflow: TextOverflow.clip,
                          item.subtitle,
                          style: TextStyles.inter6RegularBlack,
                        ),
                        verticalSpace(10.h)
                      ],
                    ),
                  ),
                  CustomSwitch(onChanged: (bool value) {  },),
                  horizontalSpace(22.5.w)
                ],
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22.5.r)),
                padding: EdgeInsets.only(left: 6.0.w,right: 17.w,bottom: 12.h),
                height: 123.h,
                width: 324.w,
                child: Image.asset(
                  item.image,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}