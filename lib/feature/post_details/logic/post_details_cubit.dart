import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'post_details_state.dart';

class PostDetailsCubit extends Cubit<PostDetailsState> {
  PostDetailsCubit() : super(PostDetailsInitial());
  static PostDetailsCubit get(context) =>BlocProvider.of(context);
  bool isEmpty=true;
}
