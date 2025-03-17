import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meta/meta.dart';
import 'package:qubitarts/feature/one_service/data/model/team_details.dart';

part 'one_service_state.dart';

class OneServiceCubit extends Cubit<OneServiceState> {
  OneServiceCubit() : super(OneServiceInitial());
  static OneServiceCubit get(context) => BlocProvider.of(context);
  List<TeamDetailsModel> Teams=[
    TeamDetailsModel(teamName: 'UI UX', teamDeadline: '20-12-2024', teamPercentage: 179.h,),
    TeamDetailsModel(teamName: 'Edits', teamDeadline: '20-12-2024', teamPercentage: 179.5.h,),
    TeamDetailsModel(teamName: 'Development', teamDeadline: '20-12-2024', teamPercentage: 142.h,),
    TeamDetailsModel(teamName: 'Testing', teamDeadline: '20-12-2024', teamPercentage: 170.4.h,),
    TeamDetailsModel(teamName: 'Publishing', teamDeadline: '20-12-2024', teamPercentage: 154.48.h,),

  ];
}
