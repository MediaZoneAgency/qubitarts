import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qubitarts/core/helpers/extensions.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/routing/routes.dart';
import '../../../core/theming/text_styles.dart';
import '../../../generated/l10n.dart';
import '../../blog/logic/blog_cubit.dart';
import '../../home/ui/widgets/blog_post.dart';
import '../../home/ui/widgets/post_loader.dart';

class SavedBlogs extends StatefulWidget{
  const SavedBlogs({super.key});

  @override
  State<SavedBlogs> createState() => _SavedBlogsState();
}

class _SavedBlogsState extends State<SavedBlogs> {
  void didChangeDependencies() async {
    super.didChangeDependencies();
    await BlogCubit.get(context).getSavedPosts();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8F8F8),
      body: ListView(

        children: [
          BlocBuilder<BlogCubit, BlogState>(
            builder: (context, state) {
              if (state is SavedBlogLoadingState &&
                  BlogCubit.get(context).savedPosts.isEmpty) {
                return const PostLoader();
              } else if (state is BlogErrorState) {
                return const Text('There is an error, please try again');
              } else if (BlogCubit.get(context).savedPosts.isEmpty) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    verticalSpace(170),
                    Text(
                      S.of(context).Noblogsfound,
                      style: TextStyles.lato33BoldBlack,
                      textAlign: TextAlign.center,
                    ),
                    verticalSpace(10),

                  ],
                );
              } else if (BlogCubit.get(context).savedPosts.isNotEmpty) {
                final post = BlogCubit.get(context).savedPosts;
                return BlocBuilder<BlogCubit, BlogState>(
  builder: (context, state) {
    return ListView.builder(
                  itemBuilder: (context, index) {
                    final bool isLiked = BlogCubit.get(context).likes.isEmpty
                        ? false
                        : BlogCubit.get(context).likes[index];
                    final bool isSaved = BlogCubit.get(context).savedPosts.isEmpty
                        ? false
                        : BlogCubit.get(context).saves[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0.w, vertical: 13.h),

                      child: BlogPostItem(
                        background: Colors.white,
                        title: post[index].postTitle,
                        description: post[index].postDescription,
                        image: post[index].postPhoto,
                        onTap: () {
                          context.pushNamed(Routes.postDetails,
                              arguments: {
                                'postModel': post[index],
                                'isLiked': isLiked,
                                'postId': post[index].id,
                                'isSaved':isSaved
                              });
                        },
                        isLiked: isLiked,
                        like: () {
                          BlogCubit.get(context).likes[index]
                              ? BlogCubit.get(context).disLikePost(
                              index,
                              post[index]
                                  .id)
                              : BlogCubit.get(context)
                              .likePost(index, post[index].id);
                        }, save: () {
                        post.removeAt(index);
                        BlogCubit.get(context).disSavePost(
                            index,
                            post[index]
                                .id);

         
                      }, isSaved: true,
                      ),
                    );
                  },
                  itemCount: post.length,
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                );
  },
);
              }
              return Text('empty');
            },
          ),
        ],
      ),
    );
  }
}