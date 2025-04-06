import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/l10n.dart';
import '../../../current_service/logic/current_services_cubit.dart';

class CustomSwitchState extends StatefulWidget {
  const CustomSwitchState({Key? key}) : super(key: key);

  @override
  _CustomSwitchStateState createState() => _CustomSwitchStateState();
}

class _CustomSwitchStateState extends State<CustomSwitchState> {
  //bool isInProgress = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentServicesCubit,CurrentServicesState>(
      builder: (context,state) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 6.w,vertical: 4.h),
          height: 40.h,
          width: 247.w,
          decoration: BoxDecoration(
            color: const Color(0xffFEDC32).withOpacity(0.74),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Row(
            children: [
              // "In Progress" Button
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    CurrentServicesCubit.get(context).changeIndex(2);
                    print(CurrentServicesCubit.get(context).selectedIndex);
                    CurrentServicesCubit.get(context).fetchRequestsByState();
                  },
                  child: Container(
                    height: 32.h,
                    width: 161.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color:  CurrentServicesCubit.get(context).selectedIndex==2? Colors.white : Colors.transparent,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(
                      S.of(context).InProgress,
                      style: TextStyle(
                        color: CurrentServicesCubit.get(context).selectedIndex==2 ? Colors.black : Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              // "Done" Button
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    CurrentServicesCubit.get(context).changeIndex(3);
                    CurrentServicesCubit.get(context).fetchRequestsByState();
                  },
                  child: Container(
                    height: 32.h,
                    width: 161.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(

                      color: CurrentServicesCubit.get(context).selectedIndex==3? Colors.white : Colors.transparent,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(
                      S.of(context).Done,
                      style: TextStyle(
                        color: CurrentServicesCubit.get(context).selectedIndex==3 ? Colors.black : Color(0xff8D8D8D),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
