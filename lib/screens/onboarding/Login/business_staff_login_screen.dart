import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/constants/route_constants.dart';
import 'package:genius_app/utils/custom_text_styles.dart';
import 'package:genius_app/utils/enum.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_button.dart';
import 'package:genius_app/widgets/custom_text_field.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class BusinessStaffLoginScreen extends StatefulWidget {
  const BusinessStaffLoginScreen({super.key});

  @override
  State<BusinessStaffLoginScreen> createState() =>
      _BusinessStaffLoginScreenState();
}

class _BusinessStaffLoginScreenState extends State<BusinessStaffLoginScreen> {
  LoginMode selectedLoginMode = LoginMode.email;

  bool obscurePassword = true;
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            verticalSpacer(MediaQuery.of(context).padding.top + 20),
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
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // verticalSpacer(MediaQuery.of(context).padding.top + 20),
                        // CustomProgressBar(),

                        verticalSpacer(20),

                        semiBoldText(
                          'Welcome back Genius👋🏼',
                          fontSize: 12.sp,
                          color: CustomColors.green500Color,
                        ),
                        verticalSpacer(15),

                        semiBoldText(
                          'Login to get started, we are here for you',
                          fontSize: 20.sp,
                          color: CustomColors.green400Color,
                          height: 1.1,
                        ),
                        verticalSpacer(50),

                        Column(
                          children: [
                            customTextField(
                              'phoneNumber',
                              'Phone Number',
                              validator: FormBuilderValidators.compose(
                                [
                                  FormBuilderValidators.email(
                                      errorText: 'Provided email not valid '),
                                  FormBuilderValidators.required(
                                      errorText:
                                          'Email field cannot be empty '),
                                ],
                              ),
                            ),
                            verticalSpacer(25),
                            customTextField(
                              'password',
                              'Type your password',
                              // obscureText: true,
                              onChanged: (value) {
                                // if (value == null || value.isEmpty) {
                                //   is8Characters = false;
                                //   hasOneUppercase = false;
                                //   hasOneLowercase = false;
                                //   hasOneNumber = false;
                                // } else {
                                //   is8Characters = value.length >= 8;
                                //   hasOneUppercase = value.contains(RegExp(r'[A-Z]'));
                                //   hasOneLowercase = value.contains(RegExp(r'[a-z]'));
                                //   hasOneNumber = value.contains(RegExp(r'[0-9]'));
                                // }
                                password = value!;
                                print(password);
                                setState(() {});
                              },
                              validator: FormBuilderValidators.compose(
                                [
                                  FormBuilderValidators.email(
                                      errorText: 'Provided email not valid '),
                                  FormBuilderValidators.required(
                                      errorText:
                                          'Email field cannot be empty '),
                                ],
                              ),

                              suffix: obscurePassword
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          ConstantString.eyeClosedIcon,
                                        ),
                                      ],
                                    )
                                  : const Icon(
                                      Icons.remove_red_eye_outlined,
                                      color: CustomColors.grey500Color,
                                    ),
                              obscureText: obscurePassword,

                              onSuffixTap: () {
                                setState(() {
                                  obscurePassword = !obscurePassword;
                                });
                              },
                            ),

                            // SizedBox(
                            //   height: 40,
                            //   child: Padding(
                            //     padding: const EdgeInsets.only(top: 10.0),
                            //     child: Row(
                            //       children: [
                            //         Padding(
                            //           padding: const EdgeInsets.only(top: 4.0),
                            //           child: SvgPicture.asset(
                            //             ConstantString.infoIcon,
                            //           ),
                            //         ),
                            //         horizontalSpacer(5),
                            //         w500Text(
                            //           'Ensure that this is your WhatsApp number',
                            //           fontSize: 14.sp,
                            //           color: CustomColors.grey700Color,
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            // verticalSpacer(5),
                          ],
                        ),

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

                        verticalSpacer(15),
                        GestureDetector(
                          onTap: () {
                            context
                                .goNamed(RouteConstants.forgotPasswordScreen);
                          },
                          child: mediumText(
                            'Forgot password?',
                            fontSize: 14.sp,
                            color: CustomColors.green500Color,
                          ),
                        ),

                        Spacer(),
                        CustomButton(
                          title: 'Let me in',
                          onTap: () {
                            context.pushNamed(
                              RouteConstants.verifyOtpScreen,
                            );
                          },
                        ),
                        verticalSpacer(10),
                        Center(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "I do not have an account, ",
                                  style: CustomTextStyles.medium(
                                    fontSize: 16.sp,
                                    color: CustomColors.greenTextColor,
                                  ),
                                ),
                                TextSpan(
                                  text: "Sign me up",
                                  style: CustomTextStyles.medium(
                                    fontSize: 16.sp,
                                    color: CustomColors.green500Color,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // verticalSpacer(MediaQuery.of(context).padding.bottom + 20),
                        Spacer(),

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
    );
  }
}

 // onChanged: (value) {
                    //   setState(() {
                    //     selectedVerificationMode = value;
                    //   });
                    // },