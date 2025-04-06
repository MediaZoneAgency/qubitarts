part of 'post_details_cubit.dart';

@immutable
abstract class PostDetailsState {}

class PostDetailsInitial extends PostDetailsState {}
class CommentLoadingState extends PostDetailsState{}
class CommentLoadedState extends PostDetailsState{}
class CommentErrorState extends PostDetailsState{}
class AddCommentLoadingState extends PostDetailsState{}
class AddCommentLoadedState extends PostDetailsState{}
class AddCommentErrorState extends PostDetailsState{}