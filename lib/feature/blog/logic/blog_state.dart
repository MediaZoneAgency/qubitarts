part of 'blog_cubit.dart';

@immutable
abstract class BlogState {}

class BlogInitial extends BlogState {}
class ChangeIndexState extends BlogState {}
class BlogLoadingState extends BlogState {}
class BlogLoadedState extends BlogState {}
class BlogErrorState extends BlogState {}
class PostLikeState extends BlogState {}
