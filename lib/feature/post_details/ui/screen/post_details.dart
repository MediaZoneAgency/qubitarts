import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qubitarts/core/widgts/app_text_form_field.dart';

import '../../../../core/assets/images.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../generated/l10n.dart';
import '../../../blog/data/model/post_model.dart';
import '../../../home/ui/widgets/app_cached_network_image.dart';
import '../widget/suffixIcons.dart';

class PostDetails extends StatefulWidget {
  const PostDetails(
      {super.key, required this.postModel, required this.isLiked});
  final PostModel postModel;
  final bool isLiked;

  @override
  State<PostDetails> createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  TextEditingController controller = TextEditingController();
  late Color backgroundColor;
  bool isTyping = false;
  @override
  void initState() {
    super.initState();
    // Initialize background color based on initial controller value
    backgroundColor =
        controller.text.isEmpty ? const Color(0xffD9D9D9) : Colors.white;

    // Add listener to controller to detect text changes
    controller.addListener(_updateController);
  }

  void _updateController() {
    setState(() {
      backgroundColor =
          controller.text.isEmpty ? const Color(0xffD9D9D9) : Colors.white;
      isTyping = controller.text.isEmpty ? false : true;
    });
  }

  @override
  void dispose() {
    controller.removeListener(_updateController);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ListView(children: [
            Padding(
              padding: EdgeInsetsDirectional.only(
                  top: 8.3.h, start: 17.w, end: 17.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Color(0xff33363F),
                            size: 20.sp,
                          )),
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
                  Icon(Icons.more_horiz_sharp)
                ],
              ),
            ),
            verticalSpace(7.h),
            Padding(
              padding: EdgeInsetsDirectional.only(
                start: 23.w,
                end: 17.w,
              ),
              child: Text(
                widget.postModel.postDescription,
                style: TextStyles.inter6RegularBlack
                    .copyWith(fontSize: 9.07.sp, color: Colors.black),
              ),
            ),
            verticalSpace(7.h),
            AppCachedNetworkImage(
                image: widget.postModel.postPhoto,
                fit: BoxFit.cover,
                radius: 0.r,
                height: 343.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.0.w, vertical: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      child: widget.isLiked
                          ? Icon(
                              Icons.favorite,
                              size: 30.sp,
                              color: Colors.red,
                            )
                          : Icon(
                              Icons.favorite_border,
                              size: 30.sp,
                              color: Colors.black12,
                            )),
                  Row(
                    children: [
                      // Image.asset(
                      //   ImagesManager.share,
                      //   width: 19.w,
                      //   height: 20.h,
                      // ),
                      horizontalSpace(8.5.w),
                      Image.asset(
                        ImagesManager.save,
                        width: 19.w,
                        height: 20.h,
                      ),
                    ],
                  )
                ],
              ),
            ),
            verticalSpace(80)
          ]),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Color(0xffEFEFEF),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: isTyping
                          ? Icon(
                              Icons.add_box_outlined,
                              color: Color(0xff646464),
                              size: 21.sp,
                              weight: 1.34,
                            )
                          : Icon(Icons.camera_alt_outlined)),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0.h, bottom: 14.h),
                    child: AppTextFormField(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 12.w, vertical: 11.h),
                      controller: controller,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xffDDDDDD),
                          width: 1.3.w,
                        ),
                        borderRadius: BorderRadius.circular(30.0.r),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorsManager.lightGray,
                          width: 1.3.w,
                        ),
                        borderRadius: BorderRadius.circular(30.0.r),
                      ),
                      suffixIcon: isTyping ? SizedBox() : SuffixIcon(),
                      hintText: S.of(context).writecomment,
                      hintStyle: TextStyles.lato17MediumBlack
                          .copyWith(fontSize: 13.4.sp),
                      backgroundColor: backgroundColor,
                      // height: 34.h,
                      width: 275.w,
                    ),
                  ),
                  isTyping
                      ? IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.send_outlined,
                            color: Color(0xff646464),
                            size: 18.sp,
                          ))
                      : SizedBox()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
