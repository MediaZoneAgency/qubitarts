import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/db/cash_helper.dart';
import '../data/model/post_model.dart';
import '../data/repo/blogs_repo.dart';

part 'blog_state.dart';

class BlogCubit extends Cubit<BlogState> {
  BlogCubit() : super(BlogInitial());

  static BlogCubit get(context) => BlocProvider.of(context);

  final PostsRepo _repo = PostsRepo();
  final List<String> blogCategories = [
    'All',
    'Digital Marketing',
    'Graphic Design',
    "Website",
  ];

  int selectedIndex = 0;
  List<PostModel> posts = [];
  List<PostModel> savedPosts = [];
  List<bool> likes = [];
  List<bool> saves = [];

  void changeIndex(int index) {
    selectedIndex = index;
    emit(ChangeIndexState());
  }

  Future<void> _setLikeAndSaveStatus(List<PostModel> list) async {
    final userId = await CashHelper.getStringScoured(key: Keys.token) ?? '';
    likes = list.map((e) => e.likes.contains(userId)).toList();
    saves = list.map((e) => e.saves.contains(userId)).toList();
  }

  Future<void> getPosts() async {
    emit(BlogLoadingState());
    final response = await _repo.getPosts();
    response.fold(
          (error) => emit(BlogErrorState()),
          (data) async {
        posts = data;
        await _setLikeAndSaveStatus(posts);
        emit(BlogLoadedState());
      },
    );
  }

  Future<void> getSavedPosts() async {
    emit(SavedBlogLoadingState());
    final response = await _repo.getSavedPosts();
    response.fold(
          (error) => emit(SavedBlogErrorState()),
          (data) async {
        savedPosts = data;
        await _setLikeAndSaveStatus(savedPosts);
        emit(SavedBlogLoadedState());
      },
    );
  }

  Future<void> fetchPostsByCategory() async {
    emit(BlogLoadingState());
    final response =
    await _repo.fetchPostsByCategory(blogCategories[selectedIndex]);
    response.fold(
          (error) => emit(BlogErrorState()),
          (data) async {
        posts = data;
        await _setLikeAndSaveStatus(posts);
        emit(BlogLoadedState());
      },
    );
  }

  Future<void> likePost(int index, String postId) async {
    await _repo.likePost(postId);
    likes[index] = true;
    emit(PostLikeState());
  }

  Future<void> disLikePost(int index, String postId) async {
    await _repo.disLikePost(postId);
    likes[index] = false;
    emit(PostLikeState());
  }

  Future<void> savePost(int index, String postId) async {
    await _repo.savePost(postId);
    saves[index] = true;
    emit(PostLikeState());
  }

  Future<void> disSavePost(int index, String postId) async {
    await _repo.disSavePost(postId);
    saves[index] = false;
    print(saves);
    emit(PostLikeState());
  }
}

