import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:qubitarts/feature/profile/data/model/user_model.dart';

import '../../../core/db/cached_app.dart';
import '../data/repo/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  static ProfileCubit get(context) => BlocProvider.of(context);

   UserModel ?user=UserModel(uid: '', displayName: '', email: '', phoneNumber: '', status: '', admin: false, agreed: false) ;

  Future<void> fetchUser() async {
    try {
user=CachedApp.getCachedData(CachedDataType.profile.name);
print('user cached is $user');
emit(ProfileSuccessState());
    }
    catch (e) {
      emit(ProfileLoadingState());

        final  response = await ProfileRepo().fetchUser();
        response.fold((String error){
          emit(ProfileErrorState());
          print(error);
        }, (UserModel? value) async{
          CachedApp.saveData(value,CachedDataType.profile.name);
          user = value;
          print('user uncached is $user');
          emit(ProfileSuccessState());
        });


    }

  }
  Future<void> signOut() async {
    await ProfileRepo().signOut();
  }
}

