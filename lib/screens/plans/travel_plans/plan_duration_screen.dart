import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/dialogs_and_popups/bottom_sheets/change_cover_period_bottom_sheet%20copy.dart';
import 'package:genius_app/utils/custom_text_styles.dart';
import 'package:genius_app/utils/enum.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/activities_widget.dart';
import 'package:genius_app/widgets/custom_button.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:go_router/go_router.dart';

class PlanDurationScreen extends StatefulWidget {
  const PlanDurationScreen({
    super.key,
  });

  @override
  State<PlanDurationScreen> createState() => _PlanDurationScreenState();
}

class _PlanDurationScreenState extends State<PlanDurationScreen>
    with SingleTickerProviderStateMixin {
  final formKey = GlobalKey<FormBuilderState>();
  VerificationMode selectedVerificationMode = VerificationMode.sms;
  String? phoneNumber;
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 4,
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
              semiBoldText(
                'Cover Period',
                fontSize: 20.sp,
                color: CustomColors.primaryGreenColor,
              ),
              verticalSpacer(8.h),
              mediumText(
                'Manage the duration of your plan',
                fontSize: 14.sp,
                color: CustomColors.primaryGreenColor,
              ),
              verticalSpacer(47.h),
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
                          selectedVerificationMode == VerificationMode.sms
                              ? semiBoldText(
                                  'Monthly',
                                  fontSize: 14.sp,
                                  color: CustomColors.blackTextColor,
                                )
                              : mediumText(
                                  'Monthly',
                                  fontSize: 14.sp,
                                  color: CustomColors.grey500Color,
                                ),
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          selectedVerificationMode == VerificationMode.whatsapp
                              ? semiBoldText(
                                  'Quarterly',
                                  fontSize: 14.sp,
                                  color: CustomColors.blackTextColor,
                                )
                              : mediumText(
                                  'Quarterly',
                                  fontSize: 14.sp,
                                  color: CustomColors.grey500Color,
                                ),
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          selectedVerificationMode == VerificationMode.whatsapp
                              ? semiBoldText(
                                  'Bi-annually',
                                  fontSize: 14.sp,
                                  color: CustomColors.blackTextColor,
                                )
                              : mediumText(
                                  'Bi-annually',
                                  fontSize: 14.sp,
                                  color: CustomColors.grey500Color,
                                ),
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          selectedVerificationMode == VerificationMode.whatsapp
                              ? semiBoldText(
                                  'Annually',
                                  fontSize: 14.sp,
                                  color: CustomColors.blackTextColor,
                                )
                              : mediumText(
                                  'Annually',
                                  fontSize: 14.sp,
                                  color: CustomColors.grey500Color,
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
                    CoverPeriodContainer(
                      period: 'Monthly',
                      price: '3,500',
                      premiumPrice: '17,500',
                      illustrationColor: CustomColors.pink550Color,
                      isActive: true,
                    ),
                    // Content for the WhatsApp tab.
                    CoverPeriodContainer(
                      period: 'Quarterly',
                      price: '10,500',
                      premiumPrice: '52,500',
                      illustrationColor: CustomColors.purple500Color,
                    ),
                    CoverPeriodContainer(
                      period: 'Bi-annually',
                      price: '21,000',
                      premiumPrice: '105,000',
                      illustrationColor: CustomColors.orange500Color,
                    ),
                    CoverPeriodContainer(
                      period: 'Annually',
                      price: '42,000',
                      premiumPrice: '210,000',
                      illustrationColor: CustomColors.pink400Color,
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

class CoverPeriodContainer extends StatelessWidget {
  final String price, period, premiumPrice;
  final Color illustrationColor;
  final bool isActive;
  const CoverPeriodContainer({
    super.key,
    required this.price,
    required this.period,
    required this.premiumPrice,
    required this.illustrationColor,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          verticalSpacer(24.h),
          Container(
            decoration: BoxDecoration(
              color: CustomColors.whiteColor,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                color: CustomColors.grey100Color,
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
                      ConstantString.coverPeriodIllus,
                      color: illustrationColor,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Column(
                        children: [
                          verticalSpacer(24.h),
                          Container(
                            decoration: BoxDecoration(
                              color: CustomColors.green50Color,
                              borderRadius: BorderRadius.circular(8.r),
                              border: Border.all(
                                color: CustomColors.green450Color,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 12.w, horizontal: 24.w),
                              child: RichText(
                                textAlign: TextAlign.end,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text: "₦",
                                        style: TextStyle(
                                          fontFamily: '',
                                          fontWeight: FontWeight.w700,
                                          color: CustomColors.green400Color,
                                          fontSize: 14.sp,
                                        )),
                                    TextSpan(
                                      text: '$price ',
                                      style: CustomTextStyles.bold(
                                        color: CustomColors.green400Color,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Per Person $period',
                                      style: CustomTextStyles.medium(
                                        color: CustomColors.green400Color,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          verticalSpacer(32.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              mediumText(
                                'Total Policies',
                                fontSize: 14.sp,
                                color: CustomColors.grey600Color,
                              ),
                              semiBoldText(
                                'Five (5)',
                                fontSize: 14.sp,
                                color: CustomColors.blackTextColor,
                              ),
                            ],
                          ),
                          verticalSpacer(24.h),
                          Divider(
                            color: CustomColors.gray200Color,
                          ),
                          verticalSpacer(24.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              mediumText(
                                'Premium',
                                fontSize: 14.sp,
                                color: CustomColors.grey600Color,
                              ),
                              RichText(
                                textAlign: TextAlign.end,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text: "₦",
                                        style: TextStyle(
                                          fontFamily: '',
                                          fontWeight: FontWeight.w700,
                                          color: CustomColors.green500Color,
                                          fontSize: 14.sp,
                                        )),
                                    TextSpan(
                                      text: '$premiumPrice ',
                                      style: CustomTextStyles.bold(
                                        color: CustomColors.green500Color,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          verticalSpacer(58.h),
                        ],
                      ),
                    ),
                    isActive
                        ? Container(
                            decoration: BoxDecoration(
                              color: CustomColors.grey300Color,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(8.r),
                                  bottomLeft: Radius.circular(8.r)),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 24.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  semiBoldText(
                                    'Current cover period',
                                    fontSize: 16.sp,
                                    color: CustomColors.whiteColor,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.only(
                              bottom: 20.h,
                              right: 12.w,
                              left: 12.w,
                            ),
                            child: CustomButton(
                              title: 'Switch to ${period.toLowerCase()}',
                              onTap: () {
                                showChangeCoverPeriodBottomSheet(context);
                              },
                            ),
                          ),
                  ],
                ),
              ],
            ),
          ),
          verticalSpacer(MediaQuery.of(context).padding.bottom + 20),
        ],
      ),
    );
  }
}
