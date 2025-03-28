import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/constants/route_constants.dart';
import 'package:genius_app/dialogs_and_popups/bottom_sheets/hmo_id_bottom_sheet.dart';
import 'package:genius_app/dialogs_and_popups/bottom_sheets/plan_actions_bottom_sheet.dart';
import 'package:genius_app/dialogs_and_popups/bottom_sheets/plan_adjustment_bottom_sheet%20copy.dart';
import 'package:genius_app/models/screen_prop_models/health_plans_model.dart';
import 'package:genius_app/utils/custom_text_styles.dart';
import 'package:genius_app/utils/enum.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_button.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:go_router/go_router.dart';

class HealthPlansScreen extends StatefulWidget {
  final HealthPlansModel data;
  const HealthPlansScreen({super.key, required this.data});

  @override
  State<HealthPlansScreen> createState() => _HealthPlansScreenState();
}

class _HealthPlansScreenState extends State<HealthPlansScreen>
    with SingleTickerProviderStateMixin {
  final formKey = GlobalKey<FormBuilderState>();
  VerificationMode selectedVerificationMode = VerificationMode.sms;
  String? phoneNumber;
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 2,
      vsync: this,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.bgWhiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: FormBuilder(
          key: formKey,
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
              Row(
                children: [
                  boldText(
                    'FlexiCare',
                    fontSize: 20.sp,
                    color: CustomColors.primaryGreenColor,
                  ),
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: widget.data.isExpired
                          ? CustomColors.red50Color
                          : CustomColors.green100Color,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
                      child: boldText(
                        // isExpired ? 'Expired' :
                        widget.data.isExpired ? 'Expired' : 'Active',
                        fontSize: 10.sp,
                        color: widget.data.isExpired
                            ? CustomColors.red500Color
                            : CustomColors.green500Color,
                      ),
                    ),
                  ),
                  horizontalSpacer(8.w),
                  Container(
                    width: 1.5,
                    height: 28.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: CustomColors.gray200Color,
                    ),
                  ),
                  horizontalSpacer(8.w),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: CustomColors.grey100Color,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            ConstantString.smallSupportIcon,
                          ),
                          horizontalSpacer(4.w),
                          semiBoldText(
                            // isExpired ? 'Expired' :
                            'Support',
                            fontSize: 10.sp,
                            color:
                                //  isExpired
                                //     ? CustomColors.red500Color
                                //     :
                                CustomColors.blackTextColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                  horizontalSpacer(8.w),
                  GestureDetector(
                    onTap: () {
                      showPlanActionsBottomSheet(context);
                    },
                    child: Container(
                      height: 32.h,
                      width: 32.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: CustomColors.grey100Color,
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          ConstantString.newMoreIcon,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      verticalSpacer(44.h),
                      widget.data.isExpired
                          ? Container(
                              decoration: BoxDecoration(
                                  color: CustomColors.greyBgColor,
                                  borderRadius: BorderRadius.circular(8.r)),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Container(
                                  height: 236.h,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4.r),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        ConstantString.blurredImage,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Container(
                                      height: 236.h,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(4.r),
                                        color: CustomColors.whiteColor,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          boldText(
                                            'Plan Deactivated',
                                            fontSize: 20.sp,
                                            color: CustomColors.red500Color,
                                          ),
                                          verticalSpacer(12.h),
                                          RichText(
                                            textAlign: TextAlign.center,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text:
                                                      "You’ve been removed from this plan by ",
                                                  style:
                                                      CustomTextStyles.regular(
                                                    fontSize: 14.sp,
                                                    color: CustomColors
                                                        .blackTextColor,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: "Olumide & daughters.",
                                                  style:
                                                      CustomTextStyles.semiBold(
                                                    fontSize: 14.sp,
                                                    color: CustomColors
                                                        .blackTextColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          verticalSpacer(12.h),
                                          RichText(
                                            textAlign: TextAlign.center,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: "Proceed to ",
                                                  style:
                                                      CustomTextStyles.regular(
                                                    fontSize: 14.sp,
                                                    color: CustomColors
                                                        .blackTextColor,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: "reactivate ",
                                                  style:
                                                      CustomTextStyles.semiBold(
                                                    fontSize: 14.sp,
                                                    color: CustomColors
                                                        .orange500Color,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text:
                                                      "by renewing and taking full ownership of the plan.",
                                                  style:
                                                      CustomTextStyles.regular(
                                                    fontSize: 14.sp,
                                                    color: CustomColors
                                                        .blackTextColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                  color: CustomColors.greyBgColor,
                                  borderRadius: BorderRadius.circular(8.r)),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        showHmoIdBottomSheet(context);
                                      },
                                      child: Container(
                                        height: 156.h,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(
                                              4,
                                            ), // Adjust the radius as needed
                                            topRight: Radius.circular(
                                              4,
                                            ),
                                          ),
                                          image: DecorationImage(
                                            image: AssetImage(
                                              ConstantString.humanImage,
                                            ),
                                            fit: BoxFit.cover,
                                            alignment: Alignment.topCenter,
                                          ),
                                        ),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 8.h, right: 8.w),
                                              child: GestureDetector(
                                                onTap: () {
                                                  // showHmoIdBottomSheet(context);
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color:
                                                        CustomColors.whiteColor,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(6),
                                                    child: SvgPicture.asset(
                                                      ConstantString
                                                          .downloadIcon,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: CustomColors.whiteColor,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(
                                            4,
                                          ), // Adjust the radius as needed
                                          bottomRight: Radius.circular(
                                            4,
                                          ),
                                        ),
                                      ),
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            bottom: 0,
                                            right: 0,
                                            child: SvgPicture.asset(
                                              // ConstantString.doctorIcon,
                                              ConstantString.flexiBgIcon,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 12.w,
                                              vertical: 14.h,
                                            ),
                                            child: Row(
                                              children: [
                                                semiBoldText(
                                                  'Chidinma Ukaegbu',
                                                  fontSize: 14.sp,
                                                  color: CustomColors
                                                      .blackTextColor,
                                                ),
                                                Spacer(),
                                                RichText(
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: "HMO I.D: ",
                                                        style: CustomTextStyles
                                                            .regular(
                                                          fontSize: 14.sp,
                                                          color: CustomColors
                                                              .blackTextColor,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: "160003/0",
                                                        style: CustomTextStyles
                                                            .semiBold(
                                                          fontSize: 14.sp,
                                                          color: CustomColors
                                                              .blackTextColor,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    verticalSpacer(16.h),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              context.pushNamed(
                                                RouteConstants
                                                    .visitHospitalScreen,
                                              );
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(200),
                                                color: CustomColors.whiteColor,
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(6.0),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      height: 44.h,
                                                      width: 44.w,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: CustomColors
                                                            .blueColor,
                                                      ),
                                                      child: Center(
                                                        child: SvgPicture.asset(
                                                          ConstantString
                                                              .hospitalIcon,
                                                        ),
                                                      ),
                                                    ),
                                                    horizontalSpacer(9.w),
                                                    mediumText(
                                                      'Visit \na hospital',
                                                      fontSize: 14.sp,
                                                      color: CustomColors
                                                          .blackTextColor,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        horizontalSpacer(6.h),
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(200),
                                              color: CustomColors.whiteColor,
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(6.0),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height: 44.h,
                                                    width: 44.w,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: CustomColors
                                                          .green500Color,
                                                    ),
                                                    child: Center(
                                                      child: SvgPicture.asset(
                                                        ConstantString
                                                            .doctorIcon,
                                                        // ConstantString.flexiBgIcon,
                                                      ),
                                                    ),
                                                  ),
                                                  horizontalSpacer(9.w),
                                                  mediumText(
                                                    'Talk \nto a doctor',
                                                    fontSize: 14.sp,
                                                    color: CustomColors
                                                        .blackTextColor,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    // verticalSpacer(16.h),
                                  ],
                                ),
                              ),
                            ),
                      verticalSpacer(32.h),
                      widget.data.isExpired
                          ? Padding(
                              padding: EdgeInsets.only(bottom: 32.h),
                              child: CustomButton(
                                title: 'Reactivate Plan',
                                onTap: () {
                                  showPlanAdjustmentBottomSheet(context,
                                      isReActivate: true);
                                },
                              ),
                            )
                          : SizedBox.shrink(),

                      Container(
                        decoration: BoxDecoration(
                          color: CustomColors.lightOrangeColor,
                          border: Border.all(
                            color: CustomColors.orange100Color,
                          ),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 14.h, horizontal: 12.w),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        ConstantString.myPlanIcon,
                                      ),
                                      horizontalSpacer(4.w),
                                      semiBoldText(
                                        'Plan for me',
                                        fontSize: 16.sp,
                                        color: CustomColors.orange900Color,
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: CustomColors.whiteColor,
                                      borderRadius: BorderRadius.circular(4.r),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 6.w, vertical: 3.h),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            ConstantString.moneyIcon,
                                          ),
                                          horizontalSpacer(5.w),
                                          RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: "₦",
                                                  style: TextStyle(
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w600,
                                                    color: CustomColors
                                                        .greenText100Color,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: "50,000/ ",
                                                  style:
                                                      CustomTextStyles.semiBold(
                                                    fontSize: 14.sp,
                                                    color: CustomColors
                                                        .greenText100Color,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: "month",
                                                  style:
                                                      CustomTextStyles.semiBold(
                                                    fontSize: 12.sp,
                                                    color: CustomColors
                                                        .greenText100Color,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              verticalSpacer(12.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      mediumText(
                                        'Purchased By',
                                        fontSize: 10.sp,
                                        color: CustomColors.orange900Color,
                                      ),
                                      verticalSpacer(5.h),
                                      semiBoldText(
                                        'Chidinma Ukaegbu',
                                        fontSize: 12.sp,
                                        color: CustomColors.orange900Color,
                                      )
                                    ],
                                  )),
                                  // Spacer(),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      mediumText(
                                        'Plan ID',
                                        fontSize: 10.sp,
                                        color: CustomColors.orange900Color,
                                      ),
                                      verticalSpacer(5.h),
                                      Row(
                                        children: [
                                          semiBoldText(
                                            '8901382091',
                                            fontSize: 12.sp,
                                            color: CustomColors.orange900Color,
                                          ),
                                          horizontalSpacer(4.w),
                                          SvgPicture.asset(
                                            ConstantString.copyIcon,
                                          )
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                              verticalSpacer(20.h),
                              Row(
                                children: [
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      mediumText(
                                        'Date Purchased',
                                        fontSize: 10.sp,
                                        color: CustomColors.orange900Color,
                                      ),
                                      verticalSpacer(5.h),
                                      semiBoldText(
                                        '25/05/2025',
                                        fontSize: 12.sp,
                                        color: CustomColors.orange900Color,
                                      )
                                    ],
                                  )),
                                  // Spacer(),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      mediumText(
                                        'Expiry Date',
                                        fontSize: 10.sp,
                                        color: CustomColors.orange900Color,
                                      ),
                                      verticalSpacer(5.h),
                                      semiBoldText(
                                        '25/05/2025   ',
                                        fontSize: 12.sp,
                                        color: CustomColors.orange900Color,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              verticalSpacer(10.h),
                            ],
                          ),
                        ),
                      ),
                      verticalSpacer(32.h),
                      widget.data.isExpired
                          ? SizedBox.shrink()
                          : Padding(
                              padding: EdgeInsets.only(bottom: 32.h),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: CustomColors.whiteColor,
                                  borderRadius: BorderRadius.circular(8.r),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(
                                          0.005), // Subtle shadow color
                                      blurRadius: 2, // Softness of the shadow
                                      spreadRadius: 1, // Slight expansion
                                      offset: Offset(0,
                                          1), // Vertical movement of the shadow
                                    ),
                                    // BoxShadow(
                                    //   color: Colors.black
                                    //       .withOpacity(0.05), // Subtle shadow color
                                    //   blurRadius: 4, // Softness of the shadow
                                    //   spreadRadius: 1, // Slight expansion
                                    //   offset: Offset(
                                    //       0, 2), // Vertical movement of the shadow
                                    // ),
                                  ],
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: 20.h,
                                    bottom: 24.h,
                                    right: 16.w,
                                    left: 16.w,
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          semiBoldText(
                                            'All Policies',
                                            fontSize: 14.sp,
                                            color: CustomColors.greenTextColor,
                                          ),
                                        ],
                                      ),
                                      verticalSpacer(8.h),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: 36.h,
                                            width: 36.w,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color:
                                                  CustomColors.orange100Color,
                                            ),
                                            child: Center(
                                              child: boldText(
                                                'CU',
                                                fontSize: 14.sp,
                                                color:
                                                    CustomColors.orange900Color,
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              context.pushNamed(
                                                RouteConstants
                                                    .managePoliciesScreen,
                                              );
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.r),
                                                  border: Border.all(
                                                    color: CustomColors
                                                        .green400Color,
                                                  )),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 16.w,
                                                    vertical: 8.h),
                                                child: Row(
                                                  children: [
                                                    semiBoldText(
                                                      'View',
                                                      fontSize: 14.sp,
                                                      color: CustomColors
                                                          .green400Color,
                                                    ),
                                                    horizontalSpacer(13.w),
                                                    SvgPicture.asset(
                                                      ConstantString
                                                          .chevronRight,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                      // verticalSpacer(32.h),
                      Container(
                        decoration: BoxDecoration(
                          color: CustomColors.whiteColor,
                          borderRadius: BorderRadius.circular(8.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black
                                  .withOpacity(0.005), // Subtle shadow color
                              blurRadius: 2, // Softness of the shadow
                              spreadRadius: 1, // Slight expansion
                              offset: Offset(
                                  0, 1), // Vertical movement of the shadow
                            ),
                            // BoxShadow(
                            //   color: Colors.black
                            //       .withOpacity(0.05), // Subtle shadow color
                            //   blurRadius: 4, // Softness of the shadow
                            //   spreadRadius: 1, // Slight expansion
                            //   offset: Offset(
                            //       0, 2), // Vertical movement of the shadow
                            // ),
                          ],
                        ),
                        child: Column(
                          children: [
                            OptionsWidget(
                              title: 'Plan benefits',
                              subtitle: 'View your plan\'s full benefits',
                              icon: ConstantString.planBenefitIcon,
                            ),
                            Divider(
                              color: CustomColors.grey100Color,
                            ),
                            OptionsWidget(
                              title: 'Need to know',
                              subtitle: 'See the things you need to know',
                              icon: ConstantString.needToKnowIcon,
                            ),
                            Divider(
                              color: CustomColors.grey100Color,
                            ),
                            OptionsWidget(
                              title: 'How it works',
                              subtitle: 'Get to know how your plan works',
                              icon: ConstantString.howItWorksIcon,
                            ),
                          ],
                        ),
                      ),
                      verticalSpacer(20.h),
                      Row(
                        children: [
                          Column(
                            children: [
                              SvgPicture.asset(
                                ConstantString.gymIcon,
                              ),
                              semiBoldText(
                                'Gym service',
                                fontSize: 12.sp,
                                color: CustomColors.grey800Color,
                              )
                            ],
                          ),
                          Column(
                            children: [
                              SvgPicture.asset(
                                ConstantString.spaIcon,
                              ),
                              semiBoldText(
                                'Spa',
                                fontSize: 12.sp,
                                color: CustomColors.grey800Color,
                              )
                            ],
                          ),
                        ],
                      ),
                      verticalSpacer(
                          MediaQuery.of(context).padding.bottom + 20.h),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OptionsWidget extends StatelessWidget {
  final String title, subtitle, icon;
  const OptionsWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
          ),
          horizontalSpacer(12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              semiBoldText(
                title,
                fontSize: 14.sp,
                color: CustomColors.newGreenTextColor,
              ),
              subtitle.isEmpty
                  ? SizedBox.shrink()
                  : mediumText(
                      subtitle,
                      fontSize: 12.sp,
                      color: CustomColors.grey800Color,
                    )
            ],
          ),
          Spacer(),
          SvgPicture.asset(
            ConstantString.chevronRight,
          ),
        ],
      ),
    );
  }
}
