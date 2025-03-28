import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/dialogs_and_popups/bottom_sheets/dependant_actions_bottom_sheet.dart';
import 'package:genius_app/utils/custom_text_styles.dart';
import 'package:genius_app/utils/enum.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_button.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:go_router/go_router.dart';

class DependantScreen extends StatefulWidget {
  const DependantScreen({
    super.key,
  });

  @override
  State<DependantScreen> createState() => _DependantScreenState();
}

class _DependantScreenState extends State<DependantScreen>
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
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        semiBoldText(
                          'Dependant',
                          fontSize: 20.sp,
                          color: CustomColors.primaryGreenColor,
                        ),
                        verticalSpacer(8.h),
                        mediumText(
                          'Manage this dependant',
                          fontSize: 14.sp,
                          color: CustomColors.primaryGreenColor,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: CustomColors.green100Color,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
                      child: boldText(
                        // isExpired ? 'Expired' :
                        'Active',
                        fontSize: 12.sp,
                        color:
                            //  isExpired
                            //     ? CustomColors.red500Color
                            //     :
                            CustomColors.green500Color,
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
                  GestureDetector(
                    onTap: () {
                      showDependantActionsBottomSheet(context);
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
              verticalSpacer(37.h),
              Container(
                height: 45.h,
                constraints: const BoxConstraints(maxWidth: 400, minHeight: 48),
                decoration: BoxDecoration(
                  color: CustomColors.formBgColor,
                  borderRadius: BorderRadius.circular(60),
                ),
                child: TabBar(
                  controller: _tabController,
                  overlayColor: WidgetStateProperty.all(Colors.transparent),
                  dividerHeight: 0,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    // You can adjust the indicator color as needed.
                    color: Colors.white,
                  ),
                  labelPadding: EdgeInsets.zero,
                  padding: EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 4,
                  ),
                  onTap: (int mode) {
                    print(mode);
                    setState(() {
                      selectedVerificationMode = mode == 0
                          ? VerificationMode.sms
                          : VerificationMode.whatsapp;
                      // phoneNumber = null;
                    });
                  },
                  tabs: [
                    Tab(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          semiBoldText(
                            'HMO I.D',
                            fontSize: 14.sp,
                            color:
                                selectedVerificationMode == VerificationMode.sms
                                    ? CustomColors.blackTextColor
                                    : CustomColors.grey500Color,
                          ),
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          semiBoldText(
                            'Details',
                            fontSize: 14.sp,
                            color: selectedVerificationMode ==
                                    VerificationMode.whatsapp
                                ? CustomColors.blackTextColor
                                : CustomColors.grey500Color,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpacer(24.h),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: CustomColors.lightBlueColor,
                  border: Border.all(
                    color: CustomColors.primecareMainBlueColor,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.r),
                        child: SvgPicture.asset(
                          ConstantString.blueRoundPattern,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 14.w,
                        vertical: 16.h,
                      ),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                ConstantString.roundProfileIcon,
                              ),
                              verticalSpacer(8.h),
                              semiBoldText(
                                'Clarisse Ukaegbu',
                                fontSize: 20.sp,
                                color: CustomColors.greenText100Color,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpacer(20.h),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    // Content for the SMS tab.
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          // verticalSpacer(24.h),
                          // Container(
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(8.r),
                          //     color: CustomColors.lightBlueColor,
                          //     border: Border.all(
                          //       color: CustomColors.primecareMainBlueColor,
                          //     ),
                          //   ),
                          //   child: Stack(
                          //     children: [
                          //       Positioned(
                          //         bottom: 0,
                          //         right: 0,
                          //         child: ClipRRect(
                          //           borderRadius: BorderRadius.circular(8.r),
                          //           child: SvgPicture.asset(
                          //             ConstantString.blueRoundPattern,
                          //           ),
                          //         ),
                          //       ),
                          //       Padding(
                          //         padding: EdgeInsets.symmetric(
                          //           horizontal: 14.w,
                          //           vertical: 16.h,
                          //         ),
                          //         child: Row(
                          //           children: [
                          //             Column(
                          //               crossAxisAlignment:
                          //                   CrossAxisAlignment.start,
                          //               children: [
                          //                 SvgPicture.asset(
                          //                   ConstantString.roundProfileIcon,
                          //                 ),
                          //                 verticalSpacer(8.h),
                          //                 semiBoldText(
                          //                   'Clarisse Ukaegbu',
                          //                   fontSize: 20.sp,
                          //                   color:
                          //                       CustomColors.greenText100Color,
                          //                 ),
                          //               ],
                          //             ),
                          //           ],
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // verticalSpacer(20.h),
                          Container(
                            decoration: BoxDecoration(
                                color: CustomColors.greyBgColor,
                                borderRadius: BorderRadius.circular(8.r)),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  Container(
                                    height: 180.h,
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
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: CustomColors.lightOrangeColor,
                                    ),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          top: 0,
                                          right: 0,
                                          child: SvgPicture.asset(
                                            // ConstantString.doctorIcon,
                                            ConstantString.hour24Logo,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 16.h,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                // ConstantString.doctorIcon,
                                                ConstantString.smallSupportIcon,
                                                color:
                                                    CustomColors.orange500Color,
                                              ),
                                              horizontalSpacer(4.w),
                                              RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: "Call Olivia ",
                                                      style: CustomTextStyles
                                                          .medium(
                                                        fontSize: 12.sp,
                                                        color: CustomColors
                                                            .blackTextColor,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: "09076890324 ",
                                                      style: CustomTextStyles
                                                          .semiBold(
                                                        fontSize: 12.sp,
                                                        color: CustomColors
                                                            .orange500Color,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: "for help",
                                                      style: CustomTextStyles
                                                          .medium(
                                                        fontSize: 12.sp,
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
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 12.h, horizontal: 12.w),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    height: 24.h,
                                                    width: 24.w,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: CustomColors
                                                          .lightBlueColor,
                                                    ),
                                                    child: Center(
                                                      child: SvgPicture.asset(
                                                        ConstantString
                                                            .blueHealthIcon,
                                                      ),
                                                    ),
                                                  ),
                                                  horizontalSpacer(4.w),
                                                  semiBoldText(
                                                    'FlexiCare',
                                                    fontSize: 20.sp,
                                                    color: CustomColors
                                                        .green400Color,
                                                  ),
                                                ],
                                              ),
                                              Spacer(),
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(40),
                                                  color:
                                                      CustomColors.green50Color,
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 14.w,
                                                      vertical: 4.h),
                                                  child: boldText(
                                                    'Active',
                                                    fontSize: 12.sp,
                                                    color: CustomColors
                                                        .green500Color,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          verticalSpacer(20.h),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                  child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  regularText(
                                                    'Name',
                                                    fontSize: 12.sp,
                                                    color: CustomColors
                                                        .blackTextColor,
                                                  ),
                                                  verticalSpacer(5.h),
                                                  semiBoldText(
                                                    'Chidinma Ukaegbu',
                                                    fontSize: 14.sp,
                                                    color: CustomColors
                                                        .blackTextColor,
                                                  )
                                                ],
                                              )),
                                              // Spacer(),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  regularText(
                                                    'Member I.D',
                                                    fontSize: 12.sp,
                                                    color: CustomColors
                                                        .blackTextColor,
                                                  ),
                                                  verticalSpacer(5.h),
                                                  semiBoldText(
                                                    '160003/0',
                                                    fontSize: 14.sp,
                                                    color: CustomColors
                                                        .blackTextColor,
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          verticalSpacer(16.h),
                                          Divider(
                                            color: CustomColors.grey100Color,
                                          ),
                                          verticalSpacer(16.h),
                                          Row(
                                            children: [
                                              Expanded(
                                                  child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  regularText(
                                                    'Active Date',
                                                    fontSize: 12.sp,
                                                    color: CustomColors
                                                        .blackTextColor,
                                                  ),
                                                  verticalSpacer(5.h),
                                                  semiBoldText(
                                                    '12th May, 2025',
                                                    fontSize: 12.sp,
                                                    color: CustomColors
                                                        .blackTextColor,
                                                  ),
                                                ],
                                              )),
                                              // Spacer(),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  regularText(
                                                    'Expiry Date',
                                                    fontSize: 12.sp,
                                                    color: CustomColors
                                                        .blackTextColor,
                                                  ),
                                                  verticalSpacer(5.h),
                                                  semiBoldText(
                                                    '12th June, 2025',
                                                    fontSize: 12.sp,
                                                    color: CustomColors
                                                        .red500Color,
                                                  ),
                                                ],
                                              ),
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
                                                  regularText(
                                                    'In partnership with',
                                                    fontSize: 12.sp,
                                                    color: CustomColors
                                                        .blackTextColor,
                                                  ),
                                                  verticalSpacer(5.h),
                                                  Image.asset(
                                                    ConstantString.bastionLogo,
                                                    height: 20.h,
                                                  ),
                                                ],
                                              )),
                                            ],
                                          ),
                                          verticalSpacer(10.h),
                                        ],
                                      ),
                                    ),
                                  ),

                                  verticalSpacer(16.h),
                                  Center(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(200),
                                        color: CustomColors.whiteColor,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 6.h, horizontal: 12),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            semiBoldText(
                                              'Download',
                                              fontSize: 12.sp,
                                              color: CustomColors.green400Color,
                                            ),
                                            horizontalSpacer(10.w),
                                            SvgPicture.asset(
                                              ConstantString.greenDownloadIcon,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  // verticalSpacer(16.h),
                                ],
                              ),
                            ),
                          ),
                          verticalSpacer(
                              MediaQuery.of(context).padding.bottom + 30),
                        ],
                      ),
                    ),
                    // Content for the WhatsApp tab.
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: CustomColors.whiteColor,
                                border: Border.all(
                                  color: CustomColors.grey100Color,
                                ),
                                borderRadius: BorderRadius.circular(8.r)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12.w,
                              ),
                              child: Column(
                                children: [
                                  DependantDetailsContainer(
                                    title: 'First Name',
                                    subtitle: 'Clarisse',
                                  ),
                                  DependantDetailsContainer(
                                    title: 'Last Name',
                                    subtitle: 'Ukaegbu',
                                  ),
                                  DependantDetailsContainer(
                                    title: 'Email',
                                    subtitle: 'clarisse@gmail.com',
                                  ),
                                  DependantDetailsContainer(
                                    title: 'Phone Number',
                                    subtitle: '07031945084',
                                  ),
                                  DependantDetailsContainer(
                                    title: 'Policy type',
                                    subtitle: 'Major',
                                  ),
                                  DependantDetailsContainer(
                                    title: 'Policy I.D',
                                    subtitle: '160003/0',
                                  ),
                                  DependantDetailsContainer(
                                    title: 'Gender',
                                    subtitle: 'Female',
                                  ),
                                  DependantDetailsContainer(
                                    title: 'NIN',
                                    subtitle: '1600009201910',
                                  ),
                                  DependantDetailsContainer(
                                    title: 'Relationship',
                                    subtitle: 'Sister',
                                  ),
                                  verticalSpacer(30),
                                ],
                              ),
                            ),
                          ),
                          verticalSpacer(
                              MediaQuery.of(context).padding.bottom + 30),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DependantDetailsContainer extends StatelessWidget {
  final String title, subtitle;
  final Widget? subtitleBody;
  const DependantDetailsContainer({
    super.key,
    required this.title,
    required this.subtitle,
    this.subtitleBody,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              mediumText(
                title,
                fontSize: 14.sp,
                color: CustomColors.grey600Color,
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: subtitleBody ??
                      semiBoldText(
                        subtitle,
                        fontSize: 14.sp,
                        color: CustomColors.orange900Color,
                      ),
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
    );
  }
}

class ManagePolicyWidget extends StatelessWidget {
  final String title, subtitle, icon;
  final PolicyUser policyUser;
  const ManagePolicyWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.policyUser,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomColors.whiteColor,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.005), // Subtle shadow color
            blurRadius: 2, // Softness of the shadow
            spreadRadius: 1, // Slight expansion
            offset: Offset(0, 1), // Vertical movement of the shadow
          ),
          // BoxShadow(
          //   color: Colors.black.withOpacity(0.004), // Subtle shadow color
          //   blurRadius: 2, // Softness of the shadow
          //   spreadRadius: 1, // Slight expansion
          //   offset: Offset(0, 1), // Vertical movement of the shadow
          // ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        child: Row(
          children: [
            Container(
              height: 40.h,
              width: 40.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: CustomColors.green50Color,
              ),
              child: Center(
                child: SvgPicture.asset(
                  icon,
                  color: CustomColors.green500Color,
                ),
              ),
            ),
            horizontalSpacer(12.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                mediumText(
                  title,
                  fontSize: 14.sp,
                  color: CustomColors.blackTextColor,
                ),
                mediumText(
                  subtitle,
                  fontSize: 12.sp,
                  color: CustomColors.grey700Color,
                )
              ],
            ),
            Spacer(),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: CustomColors.brown50Color,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
                child: semiBoldText(
                  policyUser == PolicyUser.owner
                      ? 'Owner'
                      : policyUser == PolicyUser.owner
                          ? 'Major'
                          : 'Minor',
                  fontSize: 10.sp,
                  color: CustomColors.brown500Color,
                ),
              ),
            ),
            horizontalSpacer(10.w),
            SvgPicture.asset(
              ConstantString.chevronRight,
            ),
          ],
        ),
      ),
    );
  }
}
