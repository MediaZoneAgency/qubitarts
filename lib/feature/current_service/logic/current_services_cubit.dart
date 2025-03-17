import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:meta/meta.dart';
import 'package:qubitarts/feature/current_service/data/model/user_request_model.dart';

import '../data/repo/request_repo.dart';

part 'current_services_state.dart';

class CurrentServicesCubit extends Cubit<CurrentServicesState> {
  CurrentServicesCubit() : super(CurrentServicesInitial());
  static CurrentServicesCubit get(context)=> BlocProvider.of(context);
  List<String> currentServicesState = ['All','In Review','In Progress','Done'];
  int selectedIndex=0;
  void changeIndex(int index){
    selectedIndex=index;
    emit(ChangeIndexState());
  }
  List<UserRequestsModel>requests=[];
  Future<void> getRequests() async {
    emit(CurrentServicesLoading());
    try {
      final response = await RequestRepo().fetchRequestsByUserRef();
      response.fold(
            (error) {
          print(error);
          emit(CurrentServicesError());
        },
            (fetchedRequests) {
          requests = fetchedRequests;
          print(fetchedRequests);
          emit(CurrentServicesSuccess());
        },
      );
    } catch (e) {
      emit(CurrentServicesError());
    }
  }
  Future<void> fetchRequestsByState() async {
    emit(CurrentServicesLoading());
    try {
      final response = await RequestRepo().fetchRequestsByState(currentServicesState[selectedIndex]);
      response.fold(
            (error) {
          print(error);
          emit(CurrentServicesError());
        },
            (fetchedRequests) {
              requests = fetchedRequests;
          print(fetchedRequests);
          emit(CurrentServicesSuccess());
        },
      );
    } catch (e) {
      emit(CurrentServicesError());
    }
  }
}
