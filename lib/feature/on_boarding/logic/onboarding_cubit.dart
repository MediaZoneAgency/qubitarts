import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());
  static OnboardingCubit get(context)=> BlocProvider.of(context);
  int currentPageIndex = 0;
  changePageIndex(int index) {
    currentPageIndex = index;

    emit(PageIndexState());
  }
}
