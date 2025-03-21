import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/constants/route_constants.dart';
import 'package:genius_app/models/screen_prop_models/health_plans_model.dart';
import 'package:genius_app/screens/homepage/active_users_home_page.dart';
import 'package:genius_app/screens/homepage/new_users_home_page.dart';
import 'package:genius_app/screens/plans/my_plans_screen.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BottomNavigationScreen extends StatefulHookConsumerWidget {
  final bool shouldRefresh;
  static const routeName = '/BottomNavigationScreen';

  const BottomNavigationScreen({
    super.key,
    this.shouldRefresh = false,
  });

  @override
  ConsumerState<BottomNavigationScreen> createState() =>
      _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends ConsumerState<BottomNavigationScreen>
    with SingleTickerProviderStateMixin {
  int index = 0;
  bool showExpired = false;
  bool showInActive = false;
  // void _onPlanScreenShown() {
  //   setState(() {
  //     showExpired = false;
  //     showInActive = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    List<Widget> screenLists = [
      NewUsersHomePage(),
      MyPlansScreen(),
      ActiveUsersHomePage(),
      // Container(),
      Container(),
    ];
    return PopScope(
      // },
      canPop: false,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          // resizeToAvoidBottomInset: false,

          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Container(
            margin: const EdgeInsets.only(top: 10),
            height: 72.h,
            width: 72.w,
            child: FloatingActionButton(
              backgroundColor: CustomColors.green400Color,
              elevation: 0,
              onPressed:  () {
       context.pushNamed(RouteConstants.buyPlanScreen);
      },
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  width: 2,
                  color: CustomColors.green100Color,
                ),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: SvgPicture.asset(
                  ConstantString.coverIcon,
                ),
              ),
            ),
          ),

          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // const Divider(
              //   color: CustomColors.grey300Color,
              //   height: 0,
              // ),
              // verticalSpacer(10),
              BottomAppBar(
                // notchMargin: 100,
                // notchMargin: 40,
                // height: 70,
                elevation: 0,
                padding: const EdgeInsets.only(right: 15, left: 15, bottom: 5),
                color: Colors.transparent,

                // surfaceTintColor: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            index = 0;
                          });
                        },
                        child: Container(
                          // duration: const Duration(milliseconds: 300),
                          // curve: Curves.decelerate,
                          padding:
                              // index == 0
                              //     ?
                              const EdgeInsets.symmetric(
                            horizontal: 8.0,
                            vertical: 10,
                          ),
                          // : EdgeInsets.zero,
                          decoration: BoxDecoration(
                            // color: index == 0
                            //     ? CustomColors.green500Color
                            //     : Colors.transparent,
                            borderRadius: BorderRadius.circular(24.r),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                ConstantString.homeIcon,
                                color: index == 0
                                    ? CustomColors.green400Color
                                    : null,
                              ),
                              verticalSpacer(index == 0 ? 14.h : 7.2.h),
                              index == 0
                                  ? Icon(
                                      Icons.circle,
                                      color: CustomColors.green400Color,
                                      size: 10,
                                    )
                                  : mediumText(
                                      "Home",
                                      fontSize: 13.sp,
                                      color: CustomColors.grey400Color,
                                    )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            index = 1;
                          });
                        },
                        child: Container(
                          // duration: const Duration(milliseconds: 300),
                          // curve: Curves.decelerate,
                          padding:
                              // index == 0
                              //     ?
                              const EdgeInsets.symmetric(
                            horizontal: 8.0,
                            vertical: 10,
                          ),
                          // : EdgeInsets.zero,
                          decoration: BoxDecoration(
                            // color: index == 0
                            //     ? CustomColors.green500Color
                            //     : Colors.transparent,
                            borderRadius: BorderRadius.circular(24.r),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                ConstantString.planIcon,
                                color: index == 1
                                    ? CustomColors.green400Color
                                    : null,
                              ),
                              verticalSpacer(index == 1 ? 14.h : 7.2.h),
                              index == 1
                                  ? Icon(
                                      Icons.circle,
                                      color: CustomColors.green400Color,
                                      size: 10,
                                    )
                                  : mediumText(
                                      "My Plans",
                                      fontSize: 13.sp,
                                      color: CustomColors.grey400Color,
                                    )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 80),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            index = 2;
                          });
                        },
                        child: Container(
                          // duration: const Duration(milliseconds: 300),
                          // curve: Curves.decelerate,
                          padding:
                              // index == 0
                              //     ?
                              const EdgeInsets.symmetric(
                            horizontal: 8.0,
                            vertical: 10,
                          ),
                          // : EdgeInsets.zero,
                          decoration: BoxDecoration(
                            // color: index == 0
                            //     ? CustomColors.green500Color
                            //     : Colors.transparent,
                            borderRadius: BorderRadius.circular(24.r),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                ConstantString.supportIcon,
                                color: index == 2
                                    ? CustomColors.green400Color
                                    : null,
                              ),
                              verticalSpacer(index == 2 ? 14.h : 7.2.h),
                              index == 2
                                  ? Icon(
                                      Icons.circle,
                                      color: CustomColors.green400Color,
                                      size: 10,
                                    )
                                  : mediumText(
                                      "Support",
                                      fontSize: 13.sp,
                                      color: CustomColors.grey400Color,
                                    )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            index = 3;
                          });
                        },
                        child: Container(
                          // duration: const Duration(milliseconds: 300),
                          // curve: Curves.decelerate,
                          padding:
                              // index == 0
                              //     ?
                              const EdgeInsets.symmetric(
                            horizontal: 8.0,
                            vertical: 10,
                          ),
                          // : EdgeInsets.zero,
                          decoration: BoxDecoration(
                            // color: index == 0
                            //     ? CustomColors.green500Color
                            //     : Colors.transparent,
                            borderRadius: BorderRadius.circular(24.r),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                ConstantString.moreIcon,
                                color: index == 3
                                    ? CustomColors.green400Color
                                    : null,
                              ),
                              verticalSpacer(index == 3 ? 14.h : 7.2.h),
                              index == 3
                                  ? Icon(
                                      Icons.circle,
                                      color: CustomColors.green400Color,
                                      size: 10,
                                    )
                                  : mediumText(
                                      "More",
                                      fontSize: 13.sp,
                                      color: CustomColors.grey400Color,
                                    )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          body: screenLists[index],
        ),
      ),
    );
  }
}
