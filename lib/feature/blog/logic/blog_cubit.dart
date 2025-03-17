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
  int selectedIndex = 0;
  bool isLiked = false;
  List<String> BlogCategories = [
    'All',
    'Digital Marketing',
    'Graphic Design',
    "Website",
  ];
  void changeIndex(int index) {
    selectedIndex = index;
    emit(ChangeIndexState());
  }
  late List <bool> likes=[

  ];
  List<PostModel> posts = [];
  void checkIfLiked(List<PostModel> post) async {
    String currentUserId = await CashHelper.getStringScoured(key: Keys.token) ?? '';

    if(currentUserId.isNotEmpty){
      for (var element in post) {
        if(element.likes.contains(currentUserId)){
          likes.add(true);
        }else{
          likes.add(false);
        }
      }
    }
  }
Future <void> likePost(int index,String postId)async{


  try{
    await PostsRepo().likePost(postId);
    likes[index]=true;
    getPosts();
    emit(PostLikeState());
  }catch(e){
    print(e);
  }
}
  Future <void> disLikePost(int index,String postId)async{


    try{
      await PostsRepo().disLikePost(postId);
      likes[index]=false;
      emit(PostLikeState());
    }catch(e){
      print(e);
    }
  }
  //List<PostModel> filteredPosts = [];
  //List<String> blogCategories = ["All", "Graphic Design", "Digital Marketing", "WebSite"];
  Future<void> getPosts() async {
    emit(BlogLoadingState());
    try {
      final response = await PostsRepo().getPosts();
      response.fold(
        (error) {
          print('error getPosts is ${error}');
          emit(BlogErrorState());
        },
        (fetchedPosts) {
          likes.clear();
          posts = fetchedPosts;

          checkIfLiked(posts);
          //print(fetchedPosts);
          emit(BlogLoadedState());
        },
      );
    } catch (e) {
      print(e);
      emit(BlogErrorState());
    }
  }

  Future<void> fetchPostsByCategory() async {
    emit(BlogLoadingState());
    try {
      final response =
          await PostsRepo().fetchPostsByCategory(BlogCategories[selectedIndex]);
      response.fold(
        (error) {
          print(error);
          emit(BlogErrorState());
        },
        (fetchedPosts) {
          likes.clear();
          posts = fetchedPosts;
         // likes.clear();
          checkIfLiked(posts);
          //print(' posts are ${fetchedPosts}');
          emit(BlogLoadedState());
        },
      );
    } catch (e) {
      emit(BlogErrorState());
    }
  }
}
