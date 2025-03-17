import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qubitarts/core/helpers/extensions.dart';
import 'package:qubitarts/core/helpers/spacing.dart';
import 'package:qubitarts/core/theming/text_styles.dart';
import 'package:qubitarts/feature/service_list/logic/services_list_cubit.dart';

import '../../../../core/routing/routes.dart';
import '../../../services/ui/screens/services_screen.dart';
import '../widgets/service_container.dart';
import '../widgets/website_container.dart';

class ServiceList extends StatelessWidget {
  const ServiceList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: NewServiceList(), // Use the widget here
    );
  }
}

class NewServiceList extends StatefulWidget {
  @override
  State<NewServiceList> createState() => _NewServiceListState();
}

class _NewServiceListState extends State<NewServiceList> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            //you can change opacity with color here(I used black) for background.
            decoration:
            BoxDecoration(color: Colors.transparent.withOpacity(0.0)),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WebsiteContainer(
              onTap: () {
                context.pushNamed(Routes.addWebsite);
              },
            ),
            verticalSpace(16.h),
            BlocBuilder<ServicesListCubit, ServicesListState>(
              builder: (context, state) {
                return
                  GridView.builder(
                  shrinkWrap: true,

                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    //childAspectRatio: 1, // Adjust for proper item size
                    crossAxisSpacing: 8.0.w, // Add spacing between columns
                    mainAxisSpacing: 12.0.h, // Add spacing between rows
                  ),
                  itemCount: ServicesListCubit.get(context).data.length, // Specify the number of items
                  itemBuilder: (context, index) {
                    return CustomServiceContainer(
                      title: ServicesListCubit.get(context).data[index].title,
                      description: ServicesListCubit.get(context).data[index].description,
                      image: ServicesListCubit.get(context).data[index].image,
                      route: ServicesListCubit.get(context).data[index].route,
                    );
                  },
                );
              },
            ),


          ],
        )
      ],
    );
  }
}
