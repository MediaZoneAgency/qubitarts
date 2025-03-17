import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SwipeImageGallery extends StatefulWidget {
  const SwipeImageGallery({Key? key}) : super(key: key);

  @override
  _SwipeImageGalleryState createState() => _SwipeImageGalleryState();
}

class _SwipeImageGalleryState extends State<SwipeImageGallery> {
  final List<String> images = [
    'assets/images/top_image.png', // Replace with your image paths

    'assets/images/center_image.png',
    'assets/images/bottom_image.png',
  ];

  int currentIndex = 0; // Start with the center image

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Top image
          if (currentIndex > 0)
            Positioned(
             // top: 50, // Adjust as needed
              child: Transform.rotate(
                angle: -0.09, // -5.13 degrees
                child: Container(

                    height: 278.h,

                    width: 329.w,
                    decoration: BoxDecoration(

                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(images[currentIndex - 1]),
                        ),
                        borderRadius: BorderRadius.circular(28.r)),
                    child: SizedBox()
                ),
              ),
            ),

          // Center image


          // Bottom image
          if (currentIndex < images.length - 1)
            Positioned(
              //bottom: 50, // Adjust as needed
              child: Transform.rotate(
                angle: 0.12, // 7.12 degrees
                child:Container(

                    height: 278.h,

                    width: 329.w,
                    decoration: BoxDecoration(

                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(images[currentIndex + 1]),
                        ),
                        borderRadius: BorderRadius.circular(28.r)),
                    child: SizedBox()
                ),
              ),
            ),
          PageView.builder(
            itemCount: images.length,
            controller: PageController(initialPage: currentIndex),
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
                print('Current index: $currentIndex');
              });
            },
            itemBuilder: (context, index) {
              return Container(
margin: EdgeInsets.symmetric(horizontal: 32.w,vertical: 10.h),
                  height: 278.h,

                  width: 329.w,
                  decoration: BoxDecoration(

                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(images[index]),
                      ),
                      borderRadius: BorderRadius.circular(28.r)),
                  child: SizedBox()
              );
            },
          )
        ],
      ),
    );
  }
}
