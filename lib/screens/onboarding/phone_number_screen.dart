import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/utils/enum.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/utils/string_utils.dart';
import 'package:genius_app/widgets/custom_button.dart';
import 'package:genius_app/widgets/custom_text_field.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class PhoneNumberScreen extends StatefulWidget {
  final VoidCallback onNext;
  const PhoneNumberScreen({super.key, required this.onNext});

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen>
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: FormBuilder(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpacer(20),

                    boldText(
                      'COMPLETE ACCOUNT SETUP & GET VERIFIED ✅',
                      fontSize: 12.sp,
                      color: CustomColors.green500Color,
                    ),
                    verticalSpacer(12.h),

                    semiBoldText(
                      'We need the information below to complete your setup',
                      fontSize: 20.sp,
                      color: CustomColors.green400Color,
                    ),
                    verticalSpacer(48.h),
                    Container(
                      height: 45.h,
                      constraints:
                          const BoxConstraints(maxWidth: 400, minHeight: 48),
                      decoration: BoxDecoration(
                        color: CustomColors.formBgColor,
                        borderRadius: BorderRadius.circular(60),
                      ),
                      child: TabBar(
                        controller: _tabController,
                        overlayColor:
                            WidgetStateProperty.all(Colors.transparent),
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
                                Padding(
                                  padding: const EdgeInsets.only(top: 3.0),
                                  child: SvgPicture.asset(
                                    selectedVerificationMode ==
                                            VerificationMode.sms
                                        ? ConstantString.greenMessageIcon
                                        : ConstantString.greyMessageIcon,
                                  ),
                                ),
                                horizontalSpacer(6.w),
                                semiBoldText(
                                  'Via SMS',
                                  fontSize: 14.sp,
                                  color: selectedVerificationMode ==
                                          VerificationMode.sms
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
                                Padding(
                                  padding: const EdgeInsets.only(top: 2.0),
                                  child: SvgPicture.asset(
                                    selectedVerificationMode ==
                                            VerificationMode.whatsapp
                                        ? ConstantString.greenWhatsappIcon
                                        : ConstantString.greyWhatsappIcon,
                                  ),
                                ),
                                horizontalSpacer(6.w),
                                semiBoldText(
                                  'Via WhatsApp',
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
                    Container(
                      constraints: const BoxConstraints(maxWidth: 400),
                      // Wrap TabBarView in a SizedBox or Expanded as needed (here a fixed height is used)
                      child: SizedBox(
                        height:
                            250, // adjust the height based on your layout needs
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            // Content for the SMS tab.
                            Column(
                              children: [
                                verticalSpacer(44.h),
                                customTextField(
                                  'phoneNumber',
                                  'Enter your phone number',
                                  validator: (value) {
                                    return validatePhoneNumber(
                                      value ?? "",
                                      'phone number',
                                    );
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      phoneNumber = value;
                                    });
                                  },
                                ),
                                const SizedBox(height: 40),
                              ],
                            ),
                            // Content for the WhatsApp tab.
                            Column(
                              children: [
                                verticalSpacer(44.5),
                                customTextField(
                                  'phoneNumber',
                                  'Enter your phone number',
                                  validator: (value) {
                                    return validatePhoneNumber(
                                      value ?? "",
                                      'phone number',
                                    );
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      phoneNumber = value;
                                    });
                                  },
                                ),
                                SizedBox(
                                  height: 40,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 20.h),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 4.0),
                                          child: SvgPicture.asset(
                                              ConstantString.infoIcon),
                                        ),
                                        horizontalSpacer(5),
                                        semiBoldText(
                                          'Ensure that this is your WhatsApp number',
                                          fontSize: 14.sp,
                                          color: CustomColors.grey700Color,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Row(
                    //   children: [
                    //     Expanded(
                    //       child: Container(
                    //         decoration: BoxDecoration(
                    //           color: CustomColors.formBgColor,
                    //           borderRadius: BorderRadius.circular(60),
                    //         ),
                    //         child: Padding(
                    //           padding: const EdgeInsets.all(8.0),
                    //           child: TabBar(
                    //             indicatorSize: TabBarIndicatorSize.tab,
                    //             labelColor: CustomColors.blackTextColor,
                    //             unselectedLabelColor: CustomColors.formBgColor,
                    //             labelStyle: CustomTextStyles.regular(
                    //               fontSize: 14.sp,
                    //               color: CustomColors.blackTextColor,
                    //             ),
                    //             unselectedLabelStyle: CustomTextStyles.regular(
                    //               fontSize: 14.sp,
                    //               color: CustomColors.blackTextColor,
                    //             ),
                    //             dividerColor: Colors.transparent,
                    //             indicator: BoxDecoration(
                    //               borderRadius: BorderRadius.circular(8),
                    //               boxShadow: [
                    //                 BoxShadow(
                    //                   color: CustomColors.grey400Color
                    //                       .withOpacity(0.3),
                    //                   blurRadius: 10,
                    //                   spreadRadius: 3,
                    //                 ),
                    //               ],
                    //               color: CustomColors.whiteColor,
                    //             ),
                    //             controller: _tabController,
                    //             tabs: [
                    //               Tab(
                    //                 text:
                    //                     // widget.productDetails.productCategory?.name
                    //                     //             ?.toLowerCase() ==
                    //                     //         "health"
                    //                     //     ? 'HMO'
                    //                     //     :
                    //                     "Details",
                    //               ),
                    //               Tab(
                    //                 text:
                    //                     // widget.productDetails.productCategory?.name
                    //                     //             ?.toLowerCase() ==
                    //                     //         "health"
                    //                     //     ? 'Details'
                    //                     //     :
                    //                     "How to claim",
                    //               ),
                    //               const Tab(
                    //                 text: 'Benefits',
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),

                    // ShadTabs<VerificationMode>(
                    //   value: selectedVerificationMode,
                    //   tabBarConstraints:
                    //       const BoxConstraints(maxWidth: 400, minHeight: 48),
                    //   contentConstraints: const BoxConstraints(maxWidth: 400),
                    //   padding: EdgeInsets.zero,
                    //   decoration: ShadDecoration(
                    //     color: CustomColors.formBgColor,
                    //     border: ShadBorder(
                    //       radius: BorderRadius.circular(60),
                    //     ),
                    //   ),
                    //   onChanged: (VerificationMode mode) {
                    //     setState(() {
                    //       selectedVerificationMode = mode;
                    //       phoneNumber = null;
                    //     });
                    //   },
                    //   tabs: [
                    //     ShadTab(
                    //       padding: EdgeInsets.zero,
                    //       height: 40.h,
                    //       decoration: ShadDecoration(
                    //         border: ShadBorder(
                    //           radius: BorderRadius.circular(50),
                    //         ),
                    //       ),
                    //       value: VerificationMode.sms,
                    //       content: Column(
                    //         children: [
                    //           verticalSpacer(50),
                    //           customTextField(
                    //             'phoneNumber',
                    //             'Enter your phone number',
                    //             validator: (value) {
                    //               return validatePhoneNumber(
                    //                 value ?? "",
                    //                 'phone number',
                    //               );
                    //             },
                    //             onChanged: (value) {
                    //               setState(() {
                    //                 phoneNumber = value;
                    //               });
                    //             },
                    //           ),
                    //           SizedBox(
                    //             height: 40,
                    //           )
                    //         ],
                    //       ),
                    //       child: Row(
                    //         children: [
                    //           Padding(
                    //             padding: const EdgeInsets.only(top: 4.0),
                    //             child: SvgPicture.asset(
                    //               selectedVerificationMode ==
                    //                       VerificationMode.sms
                    //                   ? ConstantString.greenMessageIcon
                    //                   : ConstantString.greyMessageIcon,
                    //             ),
                    //           ),
                    //           horizontalSpacer(5),
                    //           mediumText(
                    //             'Via SMS',
                    //             fontSize: 14.sp,
                    //             color: selectedVerificationMode ==
                    //                     VerificationMode.sms
                    //                 ? CustomColors.blackTextColor
                    //                 : CustomColors.grey500Color,
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //     ShadTab(
                    //       padding: EdgeInsets.zero,
                    //       height: 40,
                    //       decoration: ShadDecoration(
                    //         border: ShadBorder(
                    //           radius: BorderRadius.circular(50),
                    //         ),
                    //       ),
                    //       value: VerificationMode.whatsapp,
                    //       content: Column(
                    //         children: [
                    //           verticalSpacer(50),
                    //           customTextField(
                    //             'phoneNumber',
                    //             'Enter your phone number',
                    //             validator: (value) {
                    //               return validatePhoneNumber(
                    //                 value ?? "",
                    //                 'phone number',
                    //               );
                    //             },
                    //             onChanged: (value) {
                    //               setState(() {
                    //                 phoneNumber = value;
                    //               });
                    //             },
                    //           ),

                    //           SizedBox(
                    //             height: 40,
                    //             child: Padding(
                    //               padding: const EdgeInsets.only(top: 10.0),
                    //               child: Row(
                    //                 children: [
                    //                   Padding(
                    //                     padding:
                    //                         const EdgeInsets.only(top: 4.0),
                    //                     child: SvgPicture.asset(
                    //                       ConstantString.infoIcon,
                    //                     ),
                    //                   ),
                    //                   horizontalSpacer(5),
                    //                   mediumText(
                    //                     'Ensure that this is your WhatsApp number',
                    //                     fontSize: 14.sp,
                    //                     color: CustomColors.grey700Color,
                    //                   ),
                    //                 ],
                    //               ),
                    //             ),
                    //           ),
                    //           // verticalSpacer(5),
                    //         ],
                    //       ),
                    //       child: Row(
                    //         children: [
                    //           Padding(
                    //             padding: const EdgeInsets.only(top: 4.0),
                    //             child: SvgPicture.asset(
                    //               selectedVerificationMode ==
                    //                       VerificationMode.whatsapp
                    //                   ? ConstantString.greenWhatsappIcon
                    //                   : ConstantString.greyWhatsappIcon,
                    //             ),
                    //           ),
                    //           horizontalSpacer(5),
                    //           mediumText(
                    //             'Via WhatsApp',
                    //             fontSize: 14.sp,
                    //             color: selectedVerificationMode ==
                    //                     VerificationMode.whatsapp
                    //                 ? CustomColors.blackTextColor
                    //                 : CustomColors.grey500Color,
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ],
                    // ),

                    // customTextField(
                    //   'phoneNumber',
                    //   'Enter your phone number',
                    //   validator: FormBuilderValidators.compose(
                    //     [
                    //       FormBuilderValidators.email(
                    //           errorText: 'Provided email not valid '),
                    //       FormBuilderValidators.required(
                    //           errorText: 'Email field cannot be empty '),
                    //     ],
                    //   ),
                    // ),

                    // Spacer(),
                    verticalSpacer(20),
                    CustomButton(
                      title: 'Send Code',
                      onTap: StringUtils.isNullOrEmpty(phoneNumber)
                          ? null
                          : () {
                              FocusScope.of(context).unfocus();
                              bool? validate = formKey.currentState?.validate();
                              print(validate);
                              var phoneNumber = formKey
                                  .currentState?.fields['phoneNumber']?.value
                                  .toString()
                                  .trim();
                              print(phoneNumber);

                              var test =
                                  validatePhoneNumber(phoneNumber ?? '', '');

                              if (test == null) {
                                // var phoneNumber = formKey
                                //     .currentState?.fields['phoneNumber']?.value
                                //     .toString()
                                //     .trim();
                                widget.onNext();
                              }

                              // context.pushNamed(
                              //   RouteConstants.PhoneNumberScreen2,
                              // );
                            },
                    ),
                    // verticalSpacer(MediaQuery.of(context).padding.bottom + 20),

                    Spacer(),
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

// onChanged: (value) {
//   setState(() {
//     selectedVerificationMode = value;
//   });
// },

String? validatePhoneNumber(String value, String label) {
  // Regular expression for phone number validation
  final phoneRegex = RegExp(r"^0\d{10}$");

  if (!phoneRegex.hasMatch(value)) {
    return "Invalid $label. Use this format (080 000 0000)";
  }

  return null;
}
