import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/dialogs_and_popups/bottom_sheets/dependant_removed_bottom_sheet.dart';
import 'package:genius_app/dialogs_and_popups/bottom_sheets/edit_dependant_bottom_sheet.dart';
import 'package:genius_app/dialogs_and_popups/bottom_sheets/remove_dependant_bottom_sheet.dart';
import 'package:genius_app/utils/enum.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:genius_app/widgets/more_actions_widget.dart';
import 'package:go_router/go_router.dart';

void showDependantActionsBottomSheet(BuildContext context,
    {InsuranceType? insuranceType}) {
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
                        title: insuranceType == InsuranceType.vehicle
                            ? 'Edit vehicle details'
                            : 'Edit policy',
                        icon: ConstantString.editPlanIcon,
                        onTap: () {
                          context.pop();
                          showEditDependantBottomSheet(context,
                              insuranceType: InsuranceType.vehicle);
                        },
                      ),
                      Visibility(
                        visible: insuranceType == InsuranceType.vehicle,
                        child: MoreActionsWidget(
                          title: 'Make claim',
                          icon: ConstantString.smallMakeClaimIcon,
                          onTap: () {
                            context.pop();
                            // showEditDependantBottomSheet(context);
                          },
                        ),
                      ),
                      MoreActionsWidget(
                        title: insuranceType == InsuranceType.vehicle
                            ? 'Remove vehicle'
                            : 'Remove policy',
                        icon: ConstantString.removePolicyIcon,
                        textColor: CustomColors.red500Color,
                        onTap: () {
                          context.pop();
                          showRemoveDependantBottomSheet(context,
                              insuranceType: InsuranceType.vehicle);
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
