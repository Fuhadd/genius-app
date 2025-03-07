import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/dialogs_and_popups/bottom_sheets/deactivate_health_plan_bottom_sheet.dart';
import 'package:genius_app/dialogs_and_popups/bottom_sheets/plan_adjustment_bottom_sheet%20copy.dart';
import 'package:genius_app/screens/plans/widgets/my_plans_container_color.dart';
import 'package:genius_app/utils/custom_text_styles.dart';
import 'package:genius_app/utils/enum.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_button.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ComparePlansTableScreen extends StatefulWidget {
  const ComparePlansTableScreen({
    super.key,
  });

  @override
  State<ComparePlansTableScreen> createState() =>
      _ComparePlansTableScreenState();
}

class _ComparePlansTableScreenState extends State<ComparePlansTableScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.bgWhiteColor,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).padding.bottom + 10,
            left: 20,
            right: 20),
        child: CustomButton(
          title: 'Plan Adjustment',
          onTap: () {
            showPlanAdjustmentBottomSheet(context);
            // ref.read(onboardingProgressProvider.notifier).state = 0.2;
            // context.goNamed(
            //   RouteConstants.bottomNavigationScreen,
            // );
          },
        ),

        //  FloatingActionButton.extended(
        //   onPressed: () {
        //     context.pushNamed(RouteConstants.phoneNumberScreen);
        //   },
        //   label: Text('Continue'),
        //   icon: Icon(Icons.arrow_forward),
        //   backgroundColor: CustomColors.green500Color, // Customize as needed
        // ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
              'Compare Plan',
              fontSize: 20.sp,
              color: CustomColors.primaryGreenColor,
            ),
            verticalSpacer(8.h),
            mediumText(
              'Compare FlexiCare and FlexiCare Mini',
              fontSize: 14.sp,
              color: CustomColors.primaryGreenColor,
            ),
            verticalSpacer(43.h),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ComparePlanRow1(),
                    ComparePlanRow2(
                      title: 'Annual coverage limit',
                      subtitle:
                          'Offers an annual medical coverage of up to ₦1,000,000',
                      secondTitle: 'Annual coverage limit',
                      secondSubtitle:
                          'Offers an annual medical coverage of up to ₦700,000.',
                    ),
                    ComparePlanRow2(
                      title: 'Childbirth and Antenatal Limit',
                      subtitle:
                          'Enjoy ₦100,000 coverage for childbirth and antenatal services',
                      secondTitle: 'Childbirth and Antenatal Limit',
                      secondSubtitle:
                          'Enjoy ₦50,000 coverage for childbirth and antenatal services',
                    ),
                    ComparePlanRow2(
                      title: 'Childbirth and Antenatal Limit',
                      subtitle:
                          'Enjoy ₦100,000 coverage for childbirth and antenatal services',
                      secondTitle: 'Childbirth and Antenatal Limit',
                      secondSubtitle:
                          'Enjoy ₦50,000 coverage for childbirth and antenatal services',
                    ),
                    ComparePlanRow2(
                      title: 'Childbirth and Antenatal Limit',
                      subtitle:
                          'Enjoy ₦100,000 coverage for childbirth and antenatal services',
                      secondTitle: 'Childbirth and Antenatal Limit',
                      secondSubtitle:
                          'Enjoy ₦50,000 coverage for childbirth and antenatal services',
                    ),
                    ComparePlanRow2(
                      title: 'Childbirth and Antenatal Limit',
                      subtitle:
                          'Enjoy ₦100,000 coverage for childbirth and antenatal services',
                      secondTitle: 'Childbirth and Antenatal Limit',
                      secondSubtitle:
                          'Enjoy ₦50,000 coverage for childbirth and antenatal services',
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ComparePlanRow1 extends StatelessWidget {
  const ComparePlanRow1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: CustomColors.green50Color,
                border: Border.all(
                  color: CustomColors.grey100Color,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.r),
                )),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: Column(
                children: [
                  semiBoldText(
                    'FlexiCare',
                    fontSize: 14.sp,
                    color: CustomColors.green400Color,
                  ),
                  verticalSpacer(8.h),
                  Container(
                    decoration: BoxDecoration(
                      color: CustomColors.whiteColor,
                      border: Border.all(
                        color: CustomColors.green450Color,
                        width: 0.4,
                      ),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            WidgetSpan(
                              alignment: PlaceholderAlignment.baseline,
                              baseline: TextBaseline.alphabetic,
                              child: Padding(
                                padding: EdgeInsets.only(top: 5, right: 10),
                                child: SvgPicture.asset(
                                  ConstantString.greenMoneyIcon,
                                  height: 14,
                                ),
                              ),
                            ),
                            TextSpan(
                                text: "₦",
                                style: TextStyle(
                                  fontFamily: '',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16.sp,
                                  color: CustomColors.green500Color,
                                )),
                            TextSpan(
                              text: "3,500",
                              style: CustomTextStyles.bold(
                                fontSize: 16.sp,
                                color: CustomColors.green500Color,
                              ),
                            ),
                            TextSpan(
                              text: "/ month",
                              style: CustomTextStyles.medium(
                                fontSize: 14.sp,
                                color: CustomColors.green500Color,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: CustomColors.bgWhiteColor,
                border: Border.all(
                  color: CustomColors.grey100Color,
                ),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8.r),
                )),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: Column(
                children: [
                  semiBoldText(
                    'FlexiCare Mini',
                    fontSize: 14.sp,
                    color: CustomColors.green400Color,
                  ),
                  verticalSpacer(8.h),
                  Container(
                    decoration: BoxDecoration(
                      color: CustomColors.whiteColor,
                      border: Border.all(
                        color: CustomColors.green450Color,
                        width: 0.4,
                      ),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            WidgetSpan(
                              alignment: PlaceholderAlignment.baseline,
                              baseline: TextBaseline.alphabetic,
                              child: Padding(
                                padding: EdgeInsets.only(top: 5, right: 10),
                                child: SvgPicture.asset(
                                  ConstantString.greenMoneyIcon,
                                  height: 14,
                                  color: CustomColors.green400Color,
                                ),
                              ),
                            ),
                            TextSpan(
                                text: "₦",
                                style: TextStyle(
                                  fontFamily: '',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16.sp,
                                  color: CustomColors.green400Color,
                                )),
                            TextSpan(
                              text: "3,500",
                              style: CustomTextStyles.bold(
                                fontSize: 16.sp,
                                color: CustomColors.green400Color,
                              ),
                            ),
                            TextSpan(
                              text: "/ month",
                              style: CustomTextStyles.medium(
                                fontSize: 14.sp,
                                color: CustomColors.green400Color,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class ComparePlanRow2 extends StatelessWidget {
  final String title, subtitle, secondTitle, secondSubtitle;
  const ComparePlanRow2({
    super.key,
    required this.title,
    required this.subtitle,
    required this.secondTitle,
    required this.secondSubtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: CustomColors.green50Color,
                border: Border.all(
                  color: CustomColors.grey100Color,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.r),
                )),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  semiBoldText(
                    title,
                    fontSize: 12.sp,
                    color: CustomColors.blackTextColor,
                  ),
                  verticalSpacer(8.h),
                  DetailsRow(
                    title: subtitle,
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: CustomColors.bgWhiteColor,
                border: Border.all(
                  color: CustomColors.grey100Color,
                ),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8.r),
                )),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  semiBoldText(
                    title,
                    fontSize: 12.sp,
                    color: CustomColors.blackTextColor,
                  ),
                  verticalSpacer(8.h),
                  DetailsRow(
                    title: secondSubtitle,
                    cicleColor: CustomColors.green500Color,
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

const invoices = [
  [
    "INV001",
    "Paid",
    // "Credit Card",
    // r"$250.00",
  ],
  [
    "INV002",
    "Pending",
    // "PayPal",
    // r"$150.00",
  ],
  [
    "INV003",
    "Unpaid",
    // "Bank Transfer",
    // r"$350.00",
  ],
  [
    "INV004",
    "Paid",
    // "Credit Card",
    // r"$450.00",
  ],
  [
    "INV005",
    "Paid",
    // "PayPal",
    // r"$550.00",
  ],
  [
    "INV006",
    "Pending",
    // "Bank Transfer",
    // r"$200.00",
  ],
  [
    "INV007",
    "Unpaid",
    // "Credit Card",
    // r"$300.00",
  ],
];

final headings = [
  'Invoice',
  'Status',
  // 'Method',
  // 'Amount',
];

class TableExample extends StatelessWidget {
  const TableExample({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadTable(
      columnCount: invoices[0].length,
      rowCount: invoices.length,
      header: (context, column) {
        final isLast = column == headings.length - 1;
        return ShadTableCell.header(
          alignment: isLast ? Alignment.centerRight : null,
          child: Text(headings[column]),
        );
      },
      columnSpanExtent: (index) {
        if (index == 2) return const FixedTableSpanExtent(150);
        // if (index == 3) {
        //   return const MaxTableSpanExtent(
        //     FixedTableSpanExtent(120),
        //     RemainingTableSpanExtent(),
        //   );
        // }
        return null;
      },
      builder: (context, index) {
        final invoice = invoices[index.row];
        return ShadTableCell(
          alignment: index.column == invoice.length - 1
              ? Alignment.centerRight
              : Alignment.centerLeft,
          child: Text(
            invoice[index.column],
            style: index.column == 0
                ? const TextStyle(fontWeight: FontWeight.w500)
                : null,
          ),
        );
      },
      // footer: (context, column) {
      //   if (column == 0) {
      //     return const ShadTableCell.footer(
      //       child: Text(
      //         'Total',
      //         style: TextStyle(fontWeight: FontWeight.w500),
      //       ),
      //     );
      //   }
      //   if (column == 3) {
      //     return const ShadTableCell.footer(
      //       alignment: Alignment.centerRight,
      //       child: Text(
      //         r'$2500.00',
      //       ),
      //     );
      //   }
      //   return const ShadTableCell(child: SizedBox());
      // },
    );
  }
}
