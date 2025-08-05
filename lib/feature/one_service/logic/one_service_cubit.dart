import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:qubitarts/feature/add_dMarkiting/data/model/digital_request_model.dart';
import 'package:qubitarts/feature/brand_identity/data/model/brand_request_model.dart';
import 'package:qubitarts/feature/motion_graphic/data/model/motion_graphic_model.dart';
import 'package:qubitarts/feature/one_service/data/model/team_details.dart';
import 'package:qubitarts/feature/one_service/data/repo/request_details_repo.dart';
import 'package:qubitarts/feature/print-out/data/model/printout_request_model.dart';
import '../../add_app/data/model/app_request_model.dart';
import '../../add_website/data/model/web_request_model.dart';
import '../../ads/data/model/ads_request_model.dart';
import '../ui/widgets/web_request_widget.dart';

part 'one_service_state.dart';

class OneServiceCubit extends Cubit<OneServiceState> {
  OneServiceCubit() : super(OneServiceInitial());
  static OneServiceCubit get(BuildContext context) => BlocProvider.of<OneServiceCubit>(context);

  List<TeamDetailsModel> teams = [
    TeamDetailsModel(teamName: 'UI UX', teamDeadline: '20-12-2024', teamPercentage: 179.h,),
    TeamDetailsModel(teamName: 'Edits', teamDeadline: '20-12-2024', teamPercentage: 179.5.h,),
    TeamDetailsModel(teamName: 'Development', teamDeadline: '20-12-2024', teamPercentage: 142.h,),
    TeamDetailsModel(teamName: 'Testing', teamDeadline: '20-12-2024', teamPercentage: 170.4.h,),
    TeamDetailsModel(teamName: 'Publishing', teamDeadline: '20-12-2024', teamPercentage: 154.48.h,),
  ];

  Map<String, dynamic> request = {};

  Future<void> getRequest(String id) async {
    if (id.trim().isEmpty) {
      emit(OneServiceFailure(error: "Invalid service ID"));
      return;
    }

    emit(OneServiceLoading());
    try {
      final response = await RequestDetailsRepo().getRequestDetails(id);
      response.fold(
            (error)   => emit(OneServiceFailure(error: error.toString())),
            (data)    {
          request = data;
          emit(GetRequestSuccess(request: data));
        },
      );
    } catch (e) {
      emit(OneServiceFailure(error: e.toString()));
    }
  }


  Widget checkRequestType(String requestType) {
    final normalizedType = requestType.trim().toLowerCase();
    switch (normalizedType) {
      case 'website system':
        final webData = WebRequestModel.fromMap(request);
        return WebRequestDetailsWidget(data: webData);

      case 'mobile app':
        final appData = AppRequestModel.fromMap(request);
        return AppRequestDetailsWidget(data: appData);

      case 'ads and campaigns':
        final adsData = AdsRequestModel.fromMap(request);
        return AdsRequestDetailsWidget(data: adsData);

      case 'brand identity':
        final brandData = BrandRequestModel.fromMap(request);
        return BrandRequestDetailsWidget(data: brandData);

      case 'print outs':
        final printData = PrintoutRequestModel.fromMap(request);
        return PrintRequestDetailsWidget(data: printData);

      case 'digital marketing':
        final digitalData = DigitalRequestModel.fromMap(request);
        return DigitalRequestDetailsWidget(data: digitalData);

      case 'motion graphic':
        final motionData = MotionGraphicModel.fromMap(request);
        return MotionRequestDetailsWidget(data: motionData);

      default:
        return const Center();
    }
  }
}
