import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/utils/custom_text_styles.dart';
import 'package:genius_app/utils/enum.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/activities_widget.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:genius_app/widgets/plan_expandable_container.dart';
import 'package:go_router/go_router.dart';

class PlanUsageScreen extends StatefulWidget {
  const PlanUsageScreen({
    super.key,
  });

  @override
  State<PlanUsageScreen> createState() => _PlanUsageScreenState();
}

class _PlanUsageScreenState extends State<PlanUsageScreen>
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
              semiBoldText(
                'Plan Usage',
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
                                  'Activities',
                                  fontSize: 14.sp,
                                  color: CustomColors.blackTextColor,
                                )
                              : mediumText(
                                  'Amount used',
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
                                  'Activities',
                                  fontSize: 14.sp,
                                  color: CustomColors.blackTextColor,
                                )
                              : mediumText(
                                  'Amount used',
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
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          verticalSpacer(24.h),
                          Row(
                            children: [
                              mediumText(
                                'Activities',
                                fontSize: 14.sp,
                                color: CustomColors.blackTextColor,
                              ),
                              horizontalSpacer(5.w),
                              Container(
                                decoration: BoxDecoration(
                                  color: CustomColors.green100Color,
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 6.w, vertical: 2.h),
                                  child: semiBoldText(
                                    '50',
                                    fontSize: 12.sp,
                                    color: CustomColors.green500Color,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          verticalSpacer(24.h),

                          Container(
                            decoration: BoxDecoration(
                              color: CustomColors.whiteColor,
                            ),
                            child: Column(
                              children: [
                                ActivitiesWidget(
                                  icon: ConstantString.pinkHospitalIcon,
                                  title: 'Hospital Visit',
                                  subTitle: 'St Alex hospital, Lekki',
                                  date: 'July, 20, 2024',
                                  color: CustomColors.pink50Color,
                                ),
                                ActivitiesWidget(
                                  icon: ConstantString.virtualConsultationIcon,
                                  title: 'Virtual Consultation',
                                  subTitle: 'Dr Alex Igwe',
                                  date: 'July, 20, 2024',
                                  color: CustomColors.lightBlueColor,
                                ),
                                ActivitiesWidget(
                                    icon: ConstantString.addedDependantIcon,
                                    title: 'Added Dependant',
                                    subTitle: 'Kimberly Olumide',
                                    date: 'July, 20, 2024',
                                    color: CustomColors.lightOrangeColor),
                                ActivitiesWidget(
                                  icon: ConstantString.virtualConsultationIcon,
                                  title: 'Virtual Consultation',
                                  subTitle: 'Dr Alex Igwe',
                                  date: 'July, 20, 2024',
                                  color: CustomColors.lightBlueColor,
                                ),
                                ActivitiesWidget(
                                  icon: ConstantString.pinkHospitalIcon,
                                  title: 'Hospital Visit',
                                  subTitle: 'St Alex hospital, Lekki',
                                  date: 'July, 20, 2024',
                                  color: CustomColors.pink50Color,
                                  showDivider: false,
                                ),
                              ],
                            ),
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
                          PlanExpandableContainer(
                            title: "Annual Limit",
                            subtitle: '2,000,000',
                            isExpanded: false,
                            expandedHeight: 300.h,
                            iconBgColor: CustomColors.lightOrangeColor,
                            icon: ConstantString.orangeMoneyIcon,
                            child: Column(
                              children: [
                                verticalSpacer(5),
                                AnnualLimitContainer(
                                  title: 'Family Planning',
                                  subtitle: '7,000',
                                  issubtitleCurrency: true,
                                ),
                                AnnualLimitContainer(
                                  title: 'Accident & emergency',
                                  subtitle: '80,000',
                                  issubtitleCurrency: true,
                                ),
                                AnnualLimitContainer(
                                  title: 'Eye care (Month 4)',
                                  subtitle: '10,000',
                                  issubtitleCurrency: true,
                                ),
                                AnnualLimitContainer(
                                  title: 'Dental care (Month 4)',
                                  subtitle: '10,000',
                                  issubtitleCurrency: true,
                                ),
                                AnnualLimitContainer(
                                  title: 'Physiotherapy care',
                                  subtitle: '20,000',
                                  issubtitleCurrency: true,
                                ),
                                AnnualLimitContainer(
                                  title: 'Family Planning',
                                  subtitle: '7,000',
                                  issubtitleCurrency: true,
                                ),
                                AnnualLimitContainer(
                                  title: 'Surgeries',
                                  subtitle: '100,000',
                                  issubtitleCurrency: true,
                                ),
                                AnnualLimitContainer(
                                  title: 'Obstetrics care (Month 11)',
                                  subtitle: '100,000',
                                  issubtitleCurrency: true,
                                ),
                                AnnualLimitContainer(
                                  title: 'Renal care (Month 11)',
                                  subtitle: '40,000',
                                  issubtitleCurrency: true,
                                ),
                                AnnualLimitContainer(
                                  title: 'Mortuary Services (Month 7)',
                                  subtitle: '40,000',
                                  issubtitleCurrency: true,
                                ),
                              ],
                            ),
                          ),
                          verticalSpacer(20.h),
                          PlanExpandableContainer(
                            title: "Amount Used",
                            subtitle: '510,000',
                            isExpanded: false,
                            expandedHeight: 300.h,
                            iconBgColor: CustomColors.pink50Color,
                            icon: ConstantString.pinkMoneyIcon,
                            child: Column(
                              children: [
                                verticalSpacer(5),
                                AnnualLimitContainer(
                                  title: 'Family Planning',
                                  subtitle: '7,000',
                                  issubtitleCurrency: true,
                                ),
                                AnnualLimitContainer(
                                  title: 'Accident & emergency',
                                  subtitle: '80,000',
                                  issubtitleCurrency: true,
                                ),
                                AnnualLimitContainer(
                                  title: 'Eye care (Month 4)',
                                  subtitle: '10,000',
                                  issubtitleCurrency: true,
                                ),
                                AnnualLimitContainer(
                                  title: 'Dental care (Month 4)',
                                  subtitle: '10,000',
                                  issubtitleCurrency: true,
                                ),
                                AnnualLimitContainer(
                                  title: 'Physiotherapy care',
                                  subtitle: '20,000',
                                  issubtitleCurrency: true,
                                ),
                                AnnualLimitContainer(
                                  title: 'Family Planning',
                                  subtitle: '7,000',
                                  issubtitleCurrency: true,
                                ),
                                AnnualLimitContainer(
                                  title: 'Surgeries',
                                  subtitle: '100,000',
                                  issubtitleCurrency: true,
                                ),
                                AnnualLimitContainer(
                                  title: 'Obstetrics care (Month 11)',
                                  subtitle: '100,000',
                                  issubtitleCurrency: true,
                                ),
                                AnnualLimitContainer(
                                  title: 'Renal care (Month 11)',
                                  subtitle: '40,000',
                                  issubtitleCurrency: true,
                                ),
                                AnnualLimitContainer(
                                  title: 'Mortuary Services (Month 7)',
                                  subtitle: '40,000',
                                  issubtitleCurrency: true,
                                ),
                              ],
                            ),
                          ),
                          verticalSpacer(20.h),
                          PlanExpandableContainer(
                            title: "Balance",
                            subtitle: '490,000',
                            isExpanded: false,
                            expandedHeight: 300.h,
                            iconBgColor: CustomColors.green50Color,
                            icon: ConstantString.greenMoneyIcon,
                            child: Column(
                              children: [
                                verticalSpacer(5),
                                AnnualLimitContainer(
                                  title: 'Family Planning',
                                  subtitle: '7,000',
                                  issubtitleCurrency: true,
                                ),
                                AnnualLimitContainer(
                                  title: 'Accident & emergency',
                                  subtitle: '80,000',
                                  issubtitleCurrency: true,
                                ),
                                AnnualLimitContainer(
                                  title: 'Eye care (Month 4)',
                                  subtitle: '10,000',
                                  issubtitleCurrency: true,
                                ),
                                AnnualLimitContainer(
                                  title: 'Dental care (Month 4)',
                                  subtitle: '10,000',
                                  issubtitleCurrency: true,
                                ),
                                AnnualLimitContainer(
                                  title: 'Physiotherapy care',
                                  subtitle: '20,000',
                                  issubtitleCurrency: true,
                                ),
                                AnnualLimitContainer(
                                  title: 'Family Planning',
                                  subtitle: '7,000',
                                  issubtitleCurrency: true,
                                ),
                                AnnualLimitContainer(
                                  title: 'Surgeries',
                                  subtitle: '100,000',
                                  issubtitleCurrency: true,
                                ),
                                AnnualLimitContainer(
                                  title: 'Obstetrics care (Month 11)',
                                  subtitle: '100,000',
                                  issubtitleCurrency: true,
                                ),
                                AnnualLimitContainer(
                                  title: 'Renal care (Month 11)',
                                  subtitle: '40,000',
                                  issubtitleCurrency: true,
                                ),
                                AnnualLimitContainer(
                                  title: 'Mortuary Services (Month 7)',
                                  subtitle: '40,000',
                                  issubtitleCurrency: true,
                                ),
                              ],
                            ),
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

// class PlanExpandableContainer extends StatefulWidget {
//   final String title, icon, subtitle;
//   final Widget child;
//   final Color? titleColor;
//   final double? fontSize, expandedHeight;
//   final bool? isExpanded;
//   final Color iconBgColor;

//   const PlanExpandableContainer({
//     super.key,
//     required this.title,
//     required this.subtitle,
//     required this.child,
//     required this.iconBgColor,
//     required this.icon,
//     this.titleColor,
//     this.fontSize,
//     this.expandedHeight,
//     this.isExpanded = false,
//   });

//   @override
//   State<PlanExpandableContainer> createState() =>
//       _PlanExpandableContainerState();
// }

// class _PlanExpandableContainerState extends State<PlanExpandableContainer> {
//   bool _isExpanded = false;
//   @override
//   void initState() {
//     _isExpanded = widget.isExpanded ?? false;
//     super.initState();
//   }

//   void _toggleContainer() {
//     setState(() {
//       _isExpanded = !_isExpanded;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: _toggleContainer,
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 300),
//         curve: Curves.easeInOut,
//         padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 15),
//         decoration: BoxDecoration(
//           color: CustomColors.whiteColor,
//           borderRadius: BorderRadius.circular(8.r),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.005),
//               blurRadius: 2,
//               spreadRadius: 1,
//               offset: Offset(0, 1),
//             ),
//           ],
//         ),
//         // width: 300,
//         height: _isExpanded
//             ? widget.expandedHeight ?? MediaQuery.of(context).size.height * 0.32
//             : 64.h,
//         child: ClipRect(
//           child: Padding(
//             padding: const EdgeInsets.only(top: 0.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               // mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Row(
//                   children: [
//                     Container(
//                       height: 40.h,
//                       width: 40.w,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: widget.iconBgColor,
//                       ),
//                       child: Center(
//                         child: SvgPicture.asset(
//                           widget.icon,
//                         ),
//                       ),
//                     ),
//                     horizontalSpacer(5.w),
//                     semiBoldText(
//                       widget.title,
//                       fontSize: widget.fontSize ?? 14.sp,
//                       color: widget.titleColor ?? CustomColors.grey700Color,
//                     ),
//                     horizontalSpacer(10.w),
//                     Expanded(
//                       child: RichText(
//                         textAlign: TextAlign.end,
//                         text: TextSpan(
//                           children: [
//                             TextSpan(
//                                 text: "₦",
//                                 style: TextStyle(
//                                   fontFamily: '',
//                                   fontWeight: FontWeight.w700,
//                                   color: CustomColors.blackTextColor,
//                                   fontSize: 14.sp,
//                                 )),
//                             TextSpan(
//                               text: widget.subtitle,
//                               style: CustomTextStyles.bold(
//                                 color: CustomColors.blackTextColor,
//                                 fontSize: 14.sp,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     horizontalSpacer(5.w),
//                     AnimatedRotation(
//                       turns: _isExpanded ? 0.5 : 0,
//                       duration: const Duration(milliseconds: 300),
//                       child: Center(
//                         child: SvgPicture.asset(
//                           ConstantString.chevronDown,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Expanded(
//                   child: AnimatedCrossFade(
//                     firstChild: Container(),
//                     secondChild: Padding(
//                       padding: const EdgeInsets.only(top: 15, bottom: 5),
//                       child:

//                           //     HtmlWidget(
//                           //   widget.subTtitle,
//                           // ),

//                           Scrollbar(
//                         // isAlwaysShown: true,
//                         child: SingleChildScrollView(
//                           child: Column(
//                             children: [
//                               Divider(
//                                 thickness: 0.4,
//                                 color: CustomColors.gray200Color,
//                               ),
//                               widget.child,
//                             ],
//                           ),

//                           // Text(
//                           //   'Here is the expanded content. You can show more information here. Here is the expanded content. You can show more information here.Here is the expanded content. You can show more information here.Here is the expanded content. You can show more information here.\nHere is the expanded content. You can show more information here.t. You can show more information here.Here is the expanded content. You can show more information here.Here is the expanded content. You can show more information here.\nHere is the expanded content. You can show more information here.t. You can show more information here.Here is the expanded content. You can show more information here.Here is the expanded content. You can show more information here.\nHere is the expanded content. You can show more information here.t. You can show more information here.Here is the expanded content. You can show more information here.Here is the expanded content. You can show more information here.\nHere is the expanded content. You can show more information here.t. You can show more information here.Here is the expanded content. You can show more information here.Here is the expanded content. You can show more information here.\nHere is the expanded content. You can show more information here.t. You can show more information here.Here is the expanded content. You can show more information here.Here is the expanded content. You can show more information here.\nHere is the expanded content. You can show more information here.t. You can show more information here.Here is the expanded content. You can show more information here.Here is the expanded content. You can show more information here.\nHere is the expanded content. You can show more information here.t. You can show more information here.Here is the expanded content. You can show more information here.Here is the expanded content. You can show more information here.\nHere is the expanded content. You can show more information here.t. You can show more information here.Here is the expanded content. You can show more information here.Here is the expanded content. You can show more information here.\nHere is the expanded content. You can show more information here.t. You can show more information here.Here is the expanded content. You can show more information here.Here is the expanded content. You can show more information here.\nHere is the expanded content. You can show more information here.t. You can show more information here.Here is the expanded content. You can show more information here.Here is the expanded content. You can show more information here.\nHere is the expanded content. You can show more information here.t. You can show more information here.Here is the expanded content. You can show more information here.Here is the expanded content. You can show more information here.\nHere is the expanded content. You can show more information here.t. You can show more information here.Here is the expanded content. You can show more information here.Here is the expanded content. You can show more information here.\nHere is the expanded content. You can show more information here.t. You can show more information here.Here is the expanded content. You can show more information here.Here is the expanded content. You can show more information here.\nHere is the expanded content. You can show more information here.t. You can show more information here.Here is the expanded content. You can show more information here.Here is the expanded content. You can show more information here.\nHere is the expanded content. You can show more information here.t. You can show more information here.Here is the expanded content. You can show more information here.Here is the expanded content. You can show more information here.\nHere is the expanded content. You can show more information here.',
//                           //   style: TextStyle(color: Colors.black, fontSize: 16),
//                           // ),
//                         ),
//                       ),
//                     ),
//                     crossFadeState: _isExpanded
//                         ? CrossFadeState.showSecond
//                         : CrossFadeState.showFirst,
//                     duration: const Duration(milliseconds: 300),
//                   ),
//                 ),
//                 // if (_isExpanded) ...[
//                 //   const SizedBox(height: 20),
//                 //   const Text(
//                 //     'Here is the expanded content. You can show more information here.',
//                 //     style: TextStyle(color: Colors.white, fontSize: 16),
//                 //   ),
//                 // ],
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class AnnualLimitContainer extends StatelessWidget {
  final String title, subtitle;
  final bool istitleCurrency, issubtitleCurrency;
  const AnnualLimitContainer({
    super.key,
    required this.title,
    required this.subtitle,
    this.issubtitleCurrency = false,
    this.istitleCurrency = false,
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
                            style: CustomTextStyles.bold(
                              fontSize: 12.sp,
                              color: CustomColors.grey600Color,
                            ),
                          ),
                        ],
                      ),
                    )
                  : semiBoldText(
                      title,
                      fontSize: 12.sp,
                      color: CustomColors.grey600Color,
                    ),
              Expanded(
                child: Align(
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
                                    color: CustomColors.grey700Color,
                                    fontSize: 12.sp,
                                  )),
                              TextSpan(
                                text: subtitle,
                                style: CustomTextStyles.bold(
                                  fontSize: 12.sp,
                                  color: CustomColors.grey700Color,
                                ),
                              ),
                            ],
                          ),
                        )
                      : boldText(
                          subtitle,
                          fontSize: 12.sp,
                          color: CustomColors.grey700Color,
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
