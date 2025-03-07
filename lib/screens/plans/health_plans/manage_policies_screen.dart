import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/constants/route_constants.dart';
import 'package:genius_app/utils/enum.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_button.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:go_router/go_router.dart';

class ManagePoliciesScreen extends StatefulWidget {
  const ManagePoliciesScreen({
    super.key,
  });

  @override
  State<ManagePoliciesScreen> createState() => _ManagePoliciesScreenState();
}

class _ManagePoliciesScreenState extends State<ManagePoliciesScreen>
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
      floatingActionButton: selectedVerificationMode == VerificationMode.sms
          ? Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom + 10,
                  left: 20,
                  right: 20),
              child: CustomButton(
                title: 'Add Dependant Slot',
                onTap: () {
                  context.pushNamed(
                    RouteConstants.addDependantScreen,
                  );
                },
              ),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButtonAnimator: FloatingActionButtonAnimator.noAnimation,
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
              semiBoldText(
                'Manage policies',
                fontSize: 20.sp,
                color: CustomColors.primaryGreenColor,
              ),
              verticalSpacer(8.h),
              mediumText(
                'View and manage policies on this plan',
                fontSize: 14.sp,
                color: CustomColors.primaryGreenColor,
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
                            'Active',
                            fontSize: 14.sp,
                            color:
                                selectedVerificationMode == VerificationMode.sms
                                    ? CustomColors.blackTextColor
                                    : CustomColors.grey500Color,
                          ),
                          horizontalSpacer(6.w),
                          Container(
                            height: 19.h,
                            width: 19.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: selectedVerificationMode ==
                                      VerificationMode.sms
                                  ? CustomColors.green500Color
                                  : CustomColors.grey300Color,
                            ),
                            child: Center(
                              child: semiBoldText(
                                '4',
                                fontSize: 12.sp,
                                color: CustomColors.whiteColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          semiBoldText(
                            'Pending Slot',
                            fontSize: 14.sp,
                            color: selectedVerificationMode ==
                                    VerificationMode.whatsapp
                                ? CustomColors.blackTextColor
                                : CustomColors.grey500Color,
                          ),
                          horizontalSpacer(6.w),
                          Container(
                            height: 19.h,
                            width: 19.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: selectedVerificationMode ==
                                      VerificationMode.whatsapp
                                  ? CustomColors.red500Color
                                  : CustomColors.grey300Color,
                            ),
                            child: Center(
                              child: semiBoldText(
                                '4',
                                fontSize: 12.sp,
                                color: CustomColors.whiteColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    // Content for the SMS tab.
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          verticalSpacer(32.h),
                          ManagePolicyWidget(
                            title: 'Chidinma Ukaegbu',
                            subtitle: 'Policy I.D: 160003/0',
                            icon: ConstantString.roundProfileIcon,
                            policyUser: PolicyUser.owner,
                          ),
                          verticalSpacer(16.h),
                          ManagePolicyWidget(
                            title: 'Clarisse Ukaegbu',
                            subtitle: 'Policy I.D: 160003/0',
                            icon: ConstantString.roundProfileIcon,
                            policyUser: PolicyUser.major,
                          ),
                          verticalSpacer(16.h),
                          ManagePolicyWidget(
                            title: 'Clarisse Ukaegbu',
                            subtitle: 'Policy I.D: 160003/0',
                            icon: ConstantString.roundProfileIcon,
                            policyUser: PolicyUser.major,
                          ),
                          verticalSpacer(16.h),
                          ManagePolicyWidget(
                            title: 'Clarisse Ukaegbu',
                            subtitle: 'Policy I.D: 160003/0',
                            icon: ConstantString.roundProfileIcon,
                            policyUser: PolicyUser.minor,
                          ),
                          verticalSpacer(30.h),
                          // CustomButton(
                          //   title: 'Add Dependant Slot',
                          //   onTap: () {},
                          // ),
                          verticalSpacer(
                              MediaQuery.of(context).padding.bottom + 20),
                        ],
                      ),
                    ),
                    // Content for the WhatsApp tab.
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          verticalSpacer(20.h),
                          Container(
                            decoration: BoxDecoration(
                              color: CustomColors.lightOrangeColor,
                              border: Border.all(
                                color: CustomColors.orange500Color,
                                width: 0.2,
                              ),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12.w, vertical: 13.h),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    ConstantString.roundWarningIcon,
                                  ),
                                  horizontalSpacer(12.w),
                                  Expanded(
                                    child: mediumText(
                                      'Activate these dependants so they can access care.',
                                      fontSize: 12.sp,
                                      color: CustomColors.orange900Color,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          verticalSpacer(20.h),
                          ManagePolicyWidget(
                            title: 'Dependant 1',
                            subtitle: 'Policy I.D: 160003/0',
                            icon: ConstantString.profileIcon,
                            policyUser: PolicyUser.owner,
                            isPending: true,
                          ),
                          verticalSpacer(16.h),
                          ManagePolicyWidget(
                            title: 'Dependant 2',
                            subtitle: 'Policy I.D: 160003/0',
                            icon: ConstantString.profileIcon,
                            policyUser: PolicyUser.major,
                            isPending: true,
                          ),
                          verticalSpacer(16.h),
                          ManagePolicyWidget(
                            title: 'Dependant 3',
                            subtitle: 'Policy I.D: 160003/0',
                            icon: ConstantString.profileIcon,
                            policyUser: PolicyUser.major,
                            isPending: true,
                          ),
                          verticalSpacer(16.h),
                          ManagePolicyWidget(
                            title: 'Dependant 4',
                            subtitle: 'Policy I.D: 160003/0',
                            icon: ConstantString.profileIcon,
                            policyUser: PolicyUser.minor,
                            isPending: true,
                          ),
                          verticalSpacer(
                              MediaQuery.of(context).padding.bottom + 20),
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

class ManagePolicyWidget extends StatelessWidget {
  final String title, subtitle, icon;
  final PolicyUser policyUser;
  final bool isPending;

  const ManagePolicyWidget(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.icon,
      required this.policyUser,
      this.isPending = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isPending
          ? () {
              // context.pop();
              context.pushNamed(
                RouteConstants.addDependantScreen,
              );
            }
          : () {
              // context.pop();
              context.pushNamed(
                RouteConstants.dependantScreen,
              );
            },
      child: Container(
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
                  color: isPending
                      ? CustomColors.grey100Color
                      : CustomColors.green50Color,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    icon,
                    color: isPending
                        ? CustomColors.grey500Color
                        : CustomColors.green500Color,
                    height: 17.h,
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
                    isPending ? 'Add dependant details to activate' : subtitle,
                    fontSize: 12.sp,
                    color: CustomColors.grey700Color,
                  )
                ],
              ),
              Spacer(),
              isPending
                  ? SizedBox.shrink()
                  : Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: CustomColors.brown50Color,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 6.w, vertical: 4.h),
                        child: semiBoldText(
                          policyUser == PolicyUser.owner
                              ? 'Owner'
                              : policyUser == PolicyUser.major
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
      ),
    );
  }
}
