part of 'print_out_cubit.dart';

@immutable
abstract class PrintOutState {}

class PrintOutInitial extends PrintOutState {}
class ChangeIndexState extends PrintOutState {}
class ToggleFontStyleState extends PrintOutState {
}
class SelectSizeState extends PrintOutState {}
class ChangeDate extends PrintOutState {}
class GetfileSucces extends PrintOutState{}
class AddRequestLoadingState extends PrintOutState{}
class AddRequestErrorState extends PrintOutState{}
class AddRequestSuccessState extends PrintOutState{}