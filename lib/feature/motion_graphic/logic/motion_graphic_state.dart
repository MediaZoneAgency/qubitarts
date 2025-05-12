part of 'motion_graphic_cubit.dart';

@immutable
abstract class MotionGraphicState {}

class MotionGraphicInitial extends MotionGraphicState {}
class ChangeIndexState extends MotionGraphicState {}
class ToggleCustomerState extends MotionGraphicState {}
class ToggleFontStyleState extends MotionGraphicState {}
class ChangeDate extends MotionGraphicState {}
class ToggleStateYes extends MotionGraphicState {}
class GetfileSucces extends MotionGraphicState{}
class AddRequestLoadingState extends MotionGraphicState{}
class AddRequestErrorState extends MotionGraphicState{}
class AddRequestSuccessState extends MotionGraphicState{}