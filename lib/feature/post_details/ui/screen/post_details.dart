import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:qubitarts/core/db/cash_helper.dart';
import 'package:qubitarts/core/widgts/app_text_form_field.dart';
import 'package:qubitarts/feature/post_details/data/model/commentModel.dart';
import 'package:qubitarts/feature/post_details/logic/post_details_cubit.dart';

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
      {super.key, required this.postModel, required this.isLiked, required this.postId, required this.isSaved});
  final PostModel postModel;
  final bool isLiked;
  final bool isSaved;
final String postId;
  @override
  State<PostDetails> createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  void didChangeDependencies() async {

    await PostDetailsCubit.get(context).getComments(widget.postId);
  }
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
                  //Icon(Icons.more_horiz_sharp)
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
                widget.postModel.postDescription,
                style: TextStyles.inter6RegularBlack
                    .copyWith(fontSize: 9.07.sp, color: Colors.black),
              ),
            ),
            verticalSpace(7),
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
                      horizontalSpace(8.5),
                      GestureDetector(
                          //onTap: widget.save,
                          child:
                          widget.isSaved?Icon(Icons.bookmark_outlined):Icon(Icons.bookmark_outline)
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
            ),
            //verticalSpace(80),
            BlocBuilder<PostDetailsCubit,PostDetailsState>(

              builder: (context,state) {
                if(state is CommentLoadingState){
                  return Center(child: CircularProgressIndicator(color: ColorsManager.darkPurple,),);
                }
                
                return PostDetailsCubit.get(context).comments.isEmpty?Center(child: Text(S.of(context).Nocommentyet),):ListView.builder(
                  itemCount: PostDetailsCubit.get(context).comments.length,
                  shrinkWrap: true,
                 physics: ScrollPhysics(),
                    itemBuilder: (context,index){
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 7.h),
                    margin: EdgeInsets.symmetric(horizontal: 10.w,vertical: 7.h),
                    decoration: BoxDecoration(color: Color(0xffDDDDDD),borderRadius: BorderRadius.circular(10.r)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(PostDetailsCubit.get(context).comments[index].commentBy,style: TextStyles.inter17BoldBlack,),
                        Text(PostDetailsCubit.get(context).comments[index].commentText,style: TextStyles.lato16MediumGray,),
                      ],
                    ),Text(DateFormat('dd MMM yyyy').format(PostDetailsCubit.get(context).comments[index].commentTime.toDate()),style: TextStyles.inter17RegularGray.copyWith(fontSize: 13.sp),)],),
                  );
                });
              }
            ),
            verticalSpace(80)
          ]),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Color(0xffEFEFEF),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //SizedBox(width: 10.w,),
                  // IconButton(
                  //     onPressed: () {
                  //
                  //     },
                  //     icon: isTyping
                  //         ? Icon(
                  //             Icons.add_box_outlined,
                  //             color: Color(0xff646464),
                  //             size: 21.sp,
                  //             weight: 1.34,
                  //           )
                  //         : Icon(Icons.camera_alt_outlined)),
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
                     // suffixIcon: isTyping ? SizedBox() : SuffixIcon(),
                      hintText: S.of(context).writecomment,
                      hintStyle: TextStyles.lato17MediumBlack
                          .copyWith(fontSize: 13.4.sp),
                      backgroundColor: backgroundColor,
                      // height: 34.h,
                      width: 310.w,
                    ),
                  ),
                  isTyping
                      ? IconButton(
                          onPressed: () {
                            String? name = CashHelper.getString(key: Keys.userName);
                            //print('name${name}');
                            PostDetailsCubit.get(context).addComments(widget.postId, CommentModel(commentText: controller.text, commentTime: Timestamp.fromDate(DateTime.now()), commentBy:name! ));
                          },
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
