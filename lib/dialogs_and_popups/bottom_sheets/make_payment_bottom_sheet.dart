import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/constants/route_constants.dart';
import 'package:genius_app/dialogs_and_popups/bottom_sheets/dependant_removed_bottom_sheet.dart';
import 'package:genius_app/models/screen_prop_models/plan_summary_model.dart';
import 'package:genius_app/utils/custom_text_styles.dart';
import 'package:genius_app/utils/enum.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/animated_list_selector.dart';
import 'package:genius_app/widgets/custom_button.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:genius_app/widgets/grid_options_container.dart';
import 'package:genius_app/widgets/grid_radio_chip_container.dart';
import 'package:go_router/go_router.dart';

void showMakePaymentBottomSheet(
  BuildContext context, {
  bool isRenewal = false,
  bool isNewPurchase = false,
}) {
  showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      barrierColor: Colors.black.withOpacity(0.6),
      context: context,
      builder: (context) {
        PaymentMethod? paymentMethod;
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
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
                          'Make Payment',
                          fontSize: 20.sp,
                          color: CustomColors.green400Color,
                          textAlign: TextAlign.center,
                          letterSpacing: 0,
                        ),
                        verticalSpacer(32.h),
                        semiBoldText(
                          'Select preferred payment method',
                          fontSize: 16.sp,
                          color: CustomColors.blackTextColor,
                        ),
                        verticalSpacer(16.h),
                        ListOptionsContainer(
                          title: "",
                          subTitle: "",
                          titleWidget: semiBoldText(
                            'Pay from wallet',
                            fontSize: 14.sp,
                            color: CustomColors.blackTextColor,
                          ),
                          subTitleWidget: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Balance: ",
                                  style: CustomTextStyles.regular(
                                    color: CustomColors.blackTextColor,
                                    fontSize: 12.sp,
                                  ),
                                ),
                                TextSpan(
                                    text: "₦",
                                    style: TextStyle(
                                      fontFamily: '',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12.sp,
                                      color: CustomColors.green500Color,
                                    )),
                                TextSpan(
                                  text: "100,000",
                                  style: CustomTextStyles.semiBold(
                                    color: CustomColors.green500Color,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          icon: ConstantString.purpleWalletIcon,
                          selectedIcon: ConstantString.purpleWalletIcon,
                          isSelected: paymentMethod == PaymentMethod.wallet,
                          onTap: () => setState(() {
                            paymentMethod = PaymentMethod.wallet;
                          }),
                        ),
                        verticalSpacer(12.h),
                        ListOptionsContainer(
                          title: "",
                          subTitle: "",
                          titleWidget: semiBoldText(
                            'Pay online',
                            fontSize: 14.sp,
                            color: CustomColors.blackTextColor,
                          ),
                          subTitleWidget: regularText(
                            'Make secure payment online',
                            fontSize: 12.sp,
                            color: CustomColors.blackTextColor,
                          ),
                          icon: ConstantString.payOnlineIcon,
                          selectedIcon: ConstantString.payOnlineIcon,
                          isSelected: paymentMethod == PaymentMethod.online,
                          onTap: () => setState(() {
                            paymentMethod = PaymentMethod.online;
                          }),
                        ),
                        verticalSpacer(48.h),
                        CustomButton(
                          title: 'Continue',
                          onTap: () {
                            if (isRenewal) {
                              context.pop();
                              context.pushReplacementNamed(
                                RouteConstants.renewalSuccessfulScreen,
                              );
                            } else if (isNewPurchase) {
                              context.pushReplacementNamed(
                                extra: PlanSummaryScreenModel(
                                    planSummaryType:
                                        PlanSummaryType.newPlanPurchase),
                                RouteConstants.paymentSuccessfulScreen,
                              );
                            } else {
                              context.pop();
                            }
                          },
                        ),
                        verticalSpacer(100.h),
                      ],
                    ),
                  ),
                ),
              ),
            );
          });
        });
      });
}
