// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:genius_app/constants/custom_colors.dart';
// import 'package:genius_app/constants/custom_string.dart';
// import 'package:genius_app/constants/route_constants.dart';
// import 'package:genius_app/utils/spacers.dart';
// import 'package:genius_app/widgets/custom_button.dart';
// import 'package:genius_app/widgets/custom_text_widget.dart';
// import 'package:go_router/go_router.dart';
// import 'package:shadcn_ui/shadcn_ui.dart';

// Future<dynamic> showPushNotificationBottomSheet(BuildContext context) {
//   return showShadSheet(
//     context: context,
//     side: ShadSheetSide.bottom,
//     builder: (context) {
//       return ClipRRect(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//         child: ShadSheet(
//           radius: BorderRadius.vertical(top: Radius.circular(20)),
//           padding: EdgeInsets.only(
//             top: 30.h,
//             left: 20.w,
//             right: 20.w,
//             // bottom: 20.h,
//           ),
//           closeIcon: SizedBox(),
//           title: semiBoldText('Turn on push notifications',
//               fontSize: 20.sp, color: CustomColors.green400Color),

//           // description: const Text(
//           //     "Make changes to your profile here. Click save when you're done"),
//           // actions: const [
//           //   ShadButton(child: Text('Save changes'))
//           // ],
//           child: Padding(
//             padding: const EdgeInsets.symmetric(vertical: 20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 regularText(
//                     'MyCover would love to keep you informed about what matters most.',
//                     fontSize: 15.sp,
//                     color: CustomColors.blackTextColor,
//                     textAlign: TextAlign.center),
//                 verticalSpacer(50),
//                 SvgPicture.asset(
//                   ConstantString.pinkNotificationBell,
//                 ),
//                 verticalSpacer(50),
//                 CustomButton(
//                   title: 'Yes, turn it on',
//                   onTap: () {
//                     context.goNamed(RouteConstants.selectAccountType);
//                   },
//                 ),
//                 CustomButton(
//                   title: 'Maybe later',
//                   color: Colors.transparent,
//                   textColor: CustomColors.green500Color,
//                   onTap: () {
//                     context.goNamed(RouteConstants.selectAccountType);
//                   },
//                 ),
//               ],
//             ),

//           ),
//         ),
//       );
//     },
//   );
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/constants/route_constants.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_button.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:go_router/go_router.dart';

void showHelpBottomSheet(BuildContext context) {
  showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      barrierColor: Colors.black.withOpacity(0.6),
      context: context,
      builder: (context) {
        return LayoutBuilder(builder: (context, constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height *
                  0.8, // max height constraint
            ),
            child: IntrinsicHeight(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    verticalSpacer(30),
                    boldText(
                      'Turn on push notifications',
                      fontSize: 20.sp,
                      color: CustomColors.green400Color,
                      textAlign: TextAlign.center,
                      letterSpacing: 0,
                    ),
                    verticalSpacer(32.h),
                    mediumText(
                      'MyCover would love to keep you informed about what matters most.',
                      fontSize: 16.sp,
                      color: CustomColors.blackTextColor,
                      textAlign: TextAlign.center,
                    ),
                    verticalSpacer(48.h),
                    SvgPicture.asset(
                      ConstantString.pinkNotificationBell,
                    ),
                    verticalSpacer(48.h),
                    CustomButton(
                      title: 'Yes, turn it on',
                      onTap: () {
                        context.goNamed(RouteConstants.selectAccountType);
                      },
                    ),
                    verticalSpacer(12.h),

                    GestureDetector(
                      onTap: () {
                        context.goNamed(RouteConstants.selectAccountType);
                      },
                      child: semiBoldText(
                        'Maybe later',
                        fontSize: 16.sp,
                        color: CustomColors.green500Color,
                        textAlign: TextAlign.center,
                        letterSpacing: 0,
                      ),
                    ),
                    // CustomButton(
                    //   title: 'Maybe later',
                    //   color: Colors.transparent,
                    //   textColor: CustomColors.green500Color,
                    //   onTap: () {
                    //     context.goNamed(RouteConstants.selectAccountType);
                    //   },
                    // ),
                    verticalSpacer(MediaQuery.of(context).padding.bottom + 10),
                  ],
                ),
              ),
            ),
          );
        });
      });
}
