import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/constants/route_constants.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:genius_app/widgets/more_actions_widget.dart';
import 'package:go_router/go_router.dart';

void showPlanActionsBottomSheet(BuildContext context) {
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
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      verticalSpacer(30),
                      boldText(
                        'More Actions',
                        fontSize: 20.sp,
                        color: CustomColors.green400Color,
                        textAlign: TextAlign.center,
                        letterSpacing: 0,
                      ),
                      verticalSpacer(32.h),
                      MoreActionsWidget(
                        title: 'View hospital list',
                        icon: ConstantString.newHospitalIcon,
                      ),
                      MoreActionsWidget(
                        title: 'Talk to a doctor',
                        icon: ConstantString.doctorTalkIcon,
                      ),
                      MoreActionsWidget(
                        title: 'Plan Usage',
                        icon: ConstantString.planUsageIcon,
                        onTap: () {
                          context.pop();
                          context.pushNamed(
                            RouteConstants.planUsageScreen,
                          );
                        },
                      ),
                      MoreActionsWidget(
                        title: 'Plan History',
                        icon: ConstantString.planHistoryIcon,
                        onTap: () {
                          context.pop();
                          context.pushNamed(
                            RouteConstants.planHistoryScreen,
                          );
                        },
                      ),
                      MoreActionsWidget(
                        title: 'Renew plan ahead',
                        icon: ConstantString.newRenewPlanIcon,
                        onTap: () {
                          context.pop();
                          context.pushNamed(
                            RouteConstants.renewPlanAheadScreen,
                          );
                        },
                      ),
                      MoreActionsWidget(
                        title: 'Manage dependant (s)',
                        icon: ConstantString.manageDependentIcon,
                        onTap: () {
                          context.pop();
                          context.pushNamed(
                            RouteConstants.managePoliciesScreen,
                          );
                        },
                      ),
                      MoreActionsWidget(
                        title: 'Change plan',
                        icon: ConstantString.changePlanIcon,
                        onTap: () {
                          context.pop();
                          context.pushNamed(
                            RouteConstants.changePlansScreen,
                          );
                        },
                      ),
                      MoreActionsWidget(
                        title: 'Edit plan',
                        icon: ConstantString.editPlanIcon,
                        onTap: () {
                          context.pop();
                          context.pushNamed(
                            RouteConstants.editPlanScreen,
                          );
                        },
                      ),
                      verticalSpacer(
                          MediaQuery.of(context).padding.bottom + 10),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
      });
}
