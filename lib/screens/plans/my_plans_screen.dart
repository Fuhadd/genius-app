import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/screens/plans/widgets/my_plans_container_color.dart';
import 'package:genius_app/utils/enum.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';

class MyPlansScreen extends StatefulWidget {
  const MyPlansScreen({
    super.key,
  });

  @override
  State<MyPlansScreen> createState() => _MyPlansScreenState();
}

class _MyPlansScreenState extends State<MyPlansScreen>
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
              boldText(
                'My Plans',
                fontSize: 24.sp,
                color: CustomColors.primaryGreenColor,
              ),
              verticalSpacer(8.h),
              mediumText(
                'View and manage your plans',
                fontSize: 14.sp,
                color: CustomColors.primaryGreenColor,
              ),
              verticalSpacer(40.h),
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
                            'Expired',
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
                          MyPlansContainerColor(
                            title: 'FlexiCare',
                            premium: '30,000',
                            expiryDate: '12/12/2025',
                            bgColor: CustomColors.primecareMainBlueColor,
                            dividerColor: CustomColors.primecareDivBlueColor,
                            insuranceType: InsuranceType.health,
                            name: 'Chidinma',
                            icon: ConstantString.groupFlexicareIcon,
                          ),
                          verticalSpacer(24.h),
                          MyPlansContainerColor(
                            title: 'Comprehensive',
                            premium: '30,000',
                            expiryDate: '12/12/2025',
                            bgColor: CustomColors.compMainColor,
                            dividerColor: CustomColors.compDivColor,
                            insuranceType: InsuranceType.vehicle,
                            name: 'Chidinma',
                            icon: ConstantString.groupedCompIcon,
                          ),
                          verticalSpacer(24.h),
                          MyPlansContainerColor(
                            title: 'Travel Cover',
                            premium: '30,000',
                            expiryDate: '12/12/2025',
                            bgColor: CustomColors.travelMainPurpleColor,
                            dividerColor: CustomColors.travelDivPurpleColor,
                            insuranceType: InsuranceType.travel,
                            name: 'Chidinma',
                            icon: ConstantString.groupedTravelIcon,
                          ),
                          verticalSpacer(24.h),
                          MyPlansContainerColor(
                            title: 'Gadget Cover',
                            premium: '30,000',
                            expiryDate: '12/12/2025',
                            bgColor: CustomColors.gadgetMainColor,
                            dividerColor: CustomColors.gadgetDivColor,
                            insuranceType: InsuranceType.gadget,
                            name: 'Chidinma',
                            icon: ConstantString.groupedGadgetIcon,
                          ),
                          verticalSpacer(
                              MediaQuery.of(context).padding.bottom + 20),
                        ],
                      ),
                    ),
                    // Content for the WhatsApp tab.
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          verticalSpacer(32.h),
                          MyPlansContainerColor(
                            title: 'FlexiCare',
                            premium: '30,000',
                            expiryDate: '12/12/2025',
                            bgColor: CustomColors.primecareMainBlueColor,
                            dividerColor: CustomColors.primecareDivBlueColor,
                            insuranceType: InsuranceType.health,
                            name: 'Chidinma',
                            icon: ConstantString.groupFlexicareIcon,
                            isExpired: true,
                          ),
                          verticalSpacer(24.h),
                          MyPlansContainerColor(
                            title: 'Travel Cover',
                            premium: '30,000',
                            expiryDate: '12/12/2025',
                            bgColor: CustomColors.travelMainPurpleColor,
                            dividerColor: CustomColors.travelDivPurpleColor,
                            insuranceType: InsuranceType.travel,
                            name: 'Chidinma',
                            icon: ConstantString.groupedTravelIcon,
                            isExpired: true,
                          ),
                          verticalSpacer(24.h),
                          MyPlansContainerColor(
                            title: 'Gadget Cover',
                            premium: '30,000',
                            expiryDate: '12/12/2025',
                            bgColor: CustomColors.gadgetMainColor,
                            dividerColor: CustomColors.gadgetDivColor,
                            insuranceType: InsuranceType.gadget,
                            name: 'Chidinma',
                            icon: ConstantString.groupedGadgetIcon,
                            isExpired: true,
                          ),
                          verticalSpacer(24.h),
                          MyPlansContainerColor(
                            title: 'Comprehensive',
                            premium: '30,000',
                            expiryDate: '12/12/2025',
                            bgColor: CustomColors.compMainColor,
                            dividerColor: CustomColors.compDivColor,
                            insuranceType: InsuranceType.vehicle,
                            name: 'Chidinma',
                            icon: ConstantString.groupedCompIcon,
                            isExpired: true,
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
