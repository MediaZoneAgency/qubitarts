import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:qubitarts/feature/post_details/data/model/commentModel.dart';
import 'package:qubitarts/feature/post_details/data/repo/comments_repo.dart';

part 'post_details_state.dart';

class PostDetailsCubit extends Cubit<PostDetailsState> {
  PostDetailsCubit() : super(PostDetailsInitial());
  static PostDetailsCubit get(context) =>BlocProvider.of(context);
  bool isEmpty=true;
  List<CommentModel> comments=[];
  Future<void> getComments(String postId)async{
    emit(CommentLoadingState());
    final response = await CommentsRepo().getComments(postId);
    response.fold((l){
      emit(CommentErrorState());
    }, (r){
      comments=r;
      emit(CommentLoadedState());
    });
  }
  Future<void> addComments(String postId,CommentModel comment)async{
    emit(AddCommentLoadingState());
    final response = await CommentsRepo().addComment(comment, postId);
    response.fold((l){
      emit(AddCommentErrorState());
    }, (r){
      comments.add(comment);
      emit(AddCommentLoadedState());
    });
  }
}
