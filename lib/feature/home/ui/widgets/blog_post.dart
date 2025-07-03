import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/assets/images.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../generated/l10n.dart';
import 'app_cached_network_image.dart';

class BlogPostItem extends StatelessWidget {
  const BlogPostItem({
    super.key,
    required this.background,
    required this.title,
    required this.description,
    required this.image,
    required this.onTap,
    required this.isLiked, required this.like, required this.save, required this.isSaved, this.height, this.width,
  });
  final Color background;
  final String title;
  final String description;
  final String image;
  final Function() onTap;
  final Function() like;
  final bool isLiked;
  final Function() save;
  final bool isSaved;
  final double? height;
  final double ?width;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: background, borderRadius: BorderRadius.circular(21.4.r)),
        width: 304.44.w,
        //height: 367.h,
        child: Column(children: [
          Padding(
            padding:
                EdgeInsetsDirectional.only(top: 8.3.h, start: 17.w, end: 17.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 23.r,
                      child: Image.asset('assets/images/logo.png'),
                    ),
                    horizontalSpace(14.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Qubitarts',
                          style: TextStyles.lato20BoldBlack
                              .copyWith(fontSize: 15.5.sp),
                        ),
                        Text(
                          '@admin',
                          style: TextStyles.inter6RegularBlack,
                        ),
                      ],
                    )
                  ],
                ),
               // Icon(Icons.more_horiz_sharp)
                SizedBox.shrink()
              ],
            ),
          ),
          verticalSpace(7),
          Padding(
            padding: EdgeInsetsDirectional.only(
              start: 23.w,
              end: 17.w,
            ),
            child: Text(
              overflow: TextOverflow.ellipsis,
              title,
              style: TextStyles.inter6RegularBlack
                  .copyWith(fontSize: 9.07.sp, color: Colors.black),
            ),
          ),
          verticalSpace(7),
          AppCachedNetworkImage(
            image: image,
            fit: BoxFit.fill,
            radius: 14.5.r,
            height:height?? 251.h,
            width: width??270.w,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.0.w, vertical: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: like,
                    child: isLiked
                        ? Icon(
                            Icons.favorite,
                            size: 25.sp,
                            color: Colors.red,
                          )
                        : Icon(
                            Icons.favorite_border,
                            size: 25.sp,
                            color: Colors.black12,
                          )),
                Row(
                  children: [
                    // Image.asset(
                    //   ImagesManager.share,
                    //   width: 15.w,
                    //   height: 15.h,
                    // ),
                    horizontalSpace(6.5),
                    GestureDetector(
                      onTap: save,
                        child: 
                        isSaved?Icon(Icons.bookmark_outlined):Icon(Icons.bookmark_outline)
                    //     Image.asset(
                    //   ImagesManager.save,
                    //   width: 15.w,
                    //   height: 15.h,
                    // )
                    ),
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
