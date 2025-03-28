import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/dialogs_and_popups/bottom_sheets/plan_history_option_bottom_sheet.dart';
import 'package:genius_app/utils/custom_text_styles.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:genius_app/widgets/plan_expandable_container.dart';
import 'package:go_router/go_router.dart';

class PlanHistoryScreen extends StatefulWidget {
  const PlanHistoryScreen({
    super.key,
  });

  @override
  State<PlanHistoryScreen> createState() => _PlanHistoryScreenState();
}

class _PlanHistoryScreenState extends State<PlanHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.bgWhiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpacer(MediaQuery.of(context).padding.top + 20.h),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: SvgPicture.asset(
                    ConstantString.backButtonIcon,
                  ),
                ),
              ],
            ),
            verticalSpacer(23.h),
            semiBoldText(
              'Plan History',
              fontSize: 20.sp,
              color: CustomColors.primaryGreenColor,
            ),
            verticalSpacer(8.h),
            mediumText(
              'Here’s  an overview of your plan usage',
              fontSize: 14.sp,
              color: CustomColors.primaryGreenColor,
            ),
            verticalSpacer(47.h),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    verticalSpacer(20.h),
                    PlanExpandableContainer(
                      title: "2025",
                      showsubtitle: false,
                      subtitle: '',
                      isExpanded: true,
                      expandedHeight: 400.h,
                      titlePadding: 8.w,
                      iconBgColor: CustomColors.green50Color,
                      icon: ConstantString.greenCalenderIcon,
                      child: Column(
                        children: [
                          verticalSpacer(5),
                          Row(
                            children: [
                              semiBoldText(
                                'May, 2025',
                                fontSize: 14.sp,
                                color: CustomColors.green400Color,
                              ),
                            ],
                          ),
                          verticalSpacer(20),
                          PlanHistoryContainer(
                            title: 'Next renewal date',
                            subtitle: '23rd June, 2025',
                            issubtitleCurrency: false,
                          ),
                          PlanHistoryContainer(
                            title: 'Premium',
                            subtitle: '20,000',
                            subtitleTextColor: CustomColors.green500Color,
                            issubtitleCurrency: true,
                          ),
                          PlanHistoryContainer(
                            title: 'Top-Up Date',
                            subtitle: '30th April, 2023',
                            issubtitleCurrency: false,
                          ),
                          PlanHistoryContainer(
                            title: 'Number of policies',
                            subtitle: '5',
                            issubtitleCurrency: false,
                            onTap: () {
                              showPlanHistoryOptionBottomSheet(
                                context,
                                'Number of policies',
                              );
                            },
                          ),
                          PlanHistoryContainer(
                            title: 'Added policies',
                            subtitle: '2',
                            issubtitleCurrency: false,
                            onTap: () {
                              showPlanHistoryOptionBottomSheet(
                                context,
                                'Added policies',
                              );
                            },
                          ),
                          PlanHistoryContainer(
                            title: 'Removed policies',
                            subtitle: '3',
                            issubtitleCurrency: false,
                            onTap: () {
                              showPlanHistoryOptionBottomSheet(
                                context,
                                'Removed policies',
                              );
                            },
                          ),
                          PlanHistoryContainer(
                            title: 'Plan Renewed',
                            subtitle: '24th May, 2025',
                            issubtitleCurrency: false,
                          ),
                          PlanHistoryContainer(
                            title: 'Cover Period',
                            subtitle: 'Monthly',
                            issubtitleCurrency: false,
                          ),
                          PlanHistoryContainer(
                            title: 'Plan Expired',
                            subtitle: '23rd May, 2023',
                            issubtitleCurrency: false,
                          ),
                          verticalSpacer(20),
                          Row(
                            children: [
                              semiBoldText(
                                'April, 2025',
                                fontSize: 14.sp,
                                color: CustomColors.green400Color,
                              ),
                            ],
                          ),
                          verticalSpacer(10),
                          PlanHistoryContainer(
                            title: 'Next renewal date',
                            subtitle: '23rd June, 2025',
                            issubtitleCurrency: false,
                          ),
                          PlanHistoryContainer(
                            title: 'Premium',
                            subtitle: '20,000',
                            subtitleTextColor: CustomColors.green500Color,
                            issubtitleCurrency: true,
                          ),
                          PlanHistoryContainer(
                            title: 'Top-Up Date',
                            subtitle: '30th April, 2023',
                            issubtitleCurrency: false,
                          ),
                        ],
                      ),
                    ),
                    verticalSpacer(20.h),
                    PlanExpandableContainer(
                      title: "2024",
                      showsubtitle: false,
                      subtitle: '',
                      isExpanded: false,
                      expandedHeight: 400.h,
                      titlePadding: 8.w,
                      iconBgColor: CustomColors.brown50Color,
                      iconColor: CustomColors.brown500Color,
                      icon: ConstantString.greenCalenderIcon,
                      child: Column(
                        children: [
                          verticalSpacer(5),
                          Row(
                            children: [
                              semiBoldText(
                                'May, 2025',
                                fontSize: 14.sp,
                                color: CustomColors.green400Color,
                              ),
                            ],
                          ),
                          verticalSpacer(20),
                          PlanHistoryContainer(
                            title: 'Next renewal date',
                            subtitle: '23rd June, 2025',
                            issubtitleCurrency: false,
                          ),
                          PlanHistoryContainer(
                            title: 'Premium',
                            subtitle: '20,000',
                            subtitleTextColor: CustomColors.green500Color,
                            issubtitleCurrency: true,
                          ),
                          PlanHistoryContainer(
                            title: 'Top-Up Date',
                            subtitle: '30th April, 2023',
                            issubtitleCurrency: false,
                          ),
                          PlanHistoryContainer(
                            title: 'Number of policies',
                            subtitle: '5',
                            issubtitleCurrency: false,
                            onTap: () {
                              showPlanHistoryOptionBottomSheet(
                                context,
                                'Number of policies',
                              );
                            },
                          ),
                          PlanHistoryContainer(
                            title: 'Added policies',
                            subtitle: '2',
                            issubtitleCurrency: false,
                            onTap: () {
                              showPlanHistoryOptionBottomSheet(
                                context,
                                'Added policies',
                              );
                            },
                          ),
                          PlanHistoryContainer(
                            title: 'Removed policies',
                            subtitle: '3',
                            issubtitleCurrency: false,
                            onTap: () {
                              showPlanHistoryOptionBottomSheet(
                                context,
                                'Removed policies',
                              );
                            },
                          ),
                          PlanHistoryContainer(
                            title: 'Plan Renewed',
                            subtitle: '24th May, 2025',
                            issubtitleCurrency: false,
                          ),
                          PlanHistoryContainer(
                            title: 'Cover Period',
                            subtitle: 'Monthly',
                            issubtitleCurrency: false,
                          ),
                          PlanHistoryContainer(
                            title: 'Plan Expired',
                            subtitle: '23rd May, 2023',
                            issubtitleCurrency: false,
                          ),
                          verticalSpacer(20),
                          Row(
                            children: [
                              semiBoldText(
                                'April, 2025',
                                fontSize: 14.sp,
                                color: CustomColors.green400Color,
                              ),
                            ],
                          ),
                          verticalSpacer(10),
                          PlanHistoryContainer(
                            title: 'Next renewal date',
                            subtitle: '23rd June, 2025',
                            issubtitleCurrency: false,
                          ),
                          PlanHistoryContainer(
                            title: 'Premium',
                            subtitle: '20,000',
                            subtitleTextColor: CustomColors.green500Color,
                            issubtitleCurrency: true,
                          ),
                          PlanHistoryContainer(
                            title: 'Top-Up Date',
                            subtitle: '30th April, 2023',
                            issubtitleCurrency: false,
                          ),
                        ],
                      ),
                    ),
                    verticalSpacer(20.h),
                    PlanExpandableContainer(
                      title: "2023",
                      showsubtitle: false,
                      subtitle: '',
                      isExpanded: false,
                      expandedHeight: 400.h,
                      titlePadding: 8.w,
                      iconBgColor: CustomColors.purple50Color,
                      iconColor: CustomColors.purple500Color,
                      icon: ConstantString.greenCalenderIcon,
                      child: Column(
                        children: [
                          verticalSpacer(5),
                          Row(
                            children: [
                              semiBoldText(
                                'May, 2025',
                                fontSize: 14.sp,
                                color: CustomColors.green400Color,
                              ),
                            ],
                          ),
                          verticalSpacer(20),
                          PlanHistoryContainer(
                            title: 'Next renewal date',
                            subtitle: '23rd June, 2025',
                            issubtitleCurrency: false,
                          ),
                          PlanHistoryContainer(
                            title: 'Premium',
                            subtitle: '20,000',
                            subtitleTextColor: CustomColors.green500Color,
                            issubtitleCurrency: true,
                          ),
                          PlanHistoryContainer(
                            title: 'Top-Up Date',
                            subtitle: '30th April, 2023',
                            issubtitleCurrency: false,
                          ),
                          PlanHistoryContainer(
                            title: 'Number of policies',
                            subtitle: '5',
                            issubtitleCurrency: false,
                            onTap: () {},
                          ),
                          PlanHistoryContainer(
                            title: 'Added policies',
                            subtitle: '2',
                            issubtitleCurrency: false,
                            onTap: () {},
                          ),
                          PlanHistoryContainer(
                            title: 'Removed policies',
                            subtitle: '3',
                            issubtitleCurrency: false,
                            onTap: () {},
                          ),
                          PlanHistoryContainer(
                            title: 'Plan Renewed',
                            subtitle: '24th May, 2025',
                            issubtitleCurrency: false,
                          ),
                          PlanHistoryContainer(
                            title: 'Cover Period',
                            subtitle: 'Monthly',
                            issubtitleCurrency: false,
                          ),
                          PlanHistoryContainer(
                            title: 'Plan Expired',
                            subtitle: '23rd May, 2023',
                            issubtitleCurrency: false,
                          ),
                          verticalSpacer(20),
                          Row(
                            children: [
                              semiBoldText(
                                'April, 2025',
                                fontSize: 14.sp,
                                color: CustomColors.green400Color,
                              ),
                            ],
                          ),
                          verticalSpacer(10),
                          PlanHistoryContainer(
                            title: 'Next renewal date',
                            subtitle: '23rd June, 2025',
                            issubtitleCurrency: false,
                          ),
                          PlanHistoryContainer(
                            title: 'Premium',
                            subtitle: '20,000',
                            subtitleTextColor: CustomColors.green500Color,
                            issubtitleCurrency: true,
                          ),
                          PlanHistoryContainer(
                            title: 'Top-Up Date',
                            subtitle: '30th April, 2023',
                            issubtitleCurrency: false,
                          ),
                        ],
                      ),
                    ),
                    verticalSpacer(MediaQuery.of(context).padding.bottom + 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlanHistoryContainer extends StatelessWidget {
  final String title, subtitle;
  final bool istitleCurrency, issubtitleCurrency;
  final Color? subtitleTextColor;
  final void Function()? onTap;
  const PlanHistoryContainer({
    super.key,
    required this.title,
    required this.subtitle,
    this.issubtitleCurrency = false,
    this.istitleCurrency = false,
    this.onTap,
    this.subtitleTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(
          top: 20.h,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 8.h,
                  width: 8.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: CustomColors.orange500Color,
                  ),
                ),
                horizontalSpacer(12.w),
                istitleCurrency
                    ? RichText(
                        textAlign: TextAlign.end,
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: "₦",
                                style: TextStyle(
                                  fontFamily: '',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.sp,
                                  color: CustomColors.grey600Color,
                                )),
                            TextSpan(
                              text: title,
                              style: CustomTextStyles.semiBold(
                                fontSize: 12.sp,
                                color: CustomColors.grey600Color,
                              ),
                            ),
                          ],
                        ),
                      )
                    : semiBoldText(
                        title,
                        fontSize: 13.sp,
                        color: CustomColors.grey600Color,
                      ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: issubtitleCurrency
                            ? RichText(
                                textAlign: TextAlign.end,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text: "₦",
                                        style: TextStyle(
                                          fontFamily: '',
                                          fontWeight: FontWeight.w700,
                                          color: subtitleTextColor ??
                                              CustomColors.grey700Color,
                                          fontSize: 13.sp,
                                        )),
                                    TextSpan(
                                      text: subtitle,
                                      style: CustomTextStyles.semiBold(
                                        fontSize: 13.sp,
                                        color: subtitleTextColor ??
                                            CustomColors.grey700Color,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : boldText(
                                subtitle,
                                fontSize: 13.sp,
                                color: subtitleTextColor ??
                                    CustomColors.grey700Color,
                              ),
                      ),
                      onTap == null
                          ? SizedBox.shrink()
                          : Padding(
                              padding: EdgeInsets.only(left: 10.w),
                              child: SvgPicture.asset(
                                ConstantString.nextIcon,
                              ),
                            ),
                    ],
                  ),
                ),
              ],
            ),
            verticalSpacer(20.h),
            DottedLine(
              direction: Axis.horizontal,
              alignment: WrapAlignment.center,
              lineLength: double.infinity,
              lineThickness: 1.0,
              dashLength: 7.0,
              dashColor: CustomColors.gray200Color,
              dashRadius: 0.0,
              dashGapLength: 8.0,
              // dashGapColor: CustomColors.grey100Color,
              dashGapRadius: 0.0,
            ),
          ],
        ),
      ),
    );
  }
}
