import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/constants/route_constants.dart';
import 'package:genius_app/utils/custom_text_styles.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_button.dart';
import 'package:genius_app/widgets/custom_text_field.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

Future<dynamic> emailExistsBottomSheet(BuildContext context) {
  return showShadSheet(
    context: context,
    side: ShadSheetSide.bottom,
    builder: (context) {
      bool obscurePassword = true;
      String password = "";
      return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
        return ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          child: ShadSheet(
            radius: BorderRadius.vertical(top: Radius.circular(20)),
            padding: EdgeInsets.only(
              top: 30.h,
              left: 20.w,
              right: 20.w,
              // bottom: 20.h,
            ),
            closeIcon: SizedBox(),
            title:
                // semiBoldText(
                //     'Having trouble receiving the OTP via SMS? try WhatsApp',
                //     fontSize: 20.sp,
                //     color: CustomColors.green400Color),
                RichText(
              textAlign: TextAlign.center,
              // WidgetSpan(
              //   alignment: PlaceholderAlignment.baseline,
              //   baseline: TextBaseline.alphabetic,
              //   child: Padding(
              //     padding: const EdgeInsets.only(top: 8.0),
              //     child: SvgPicture.asset(
              //       ConstantString.greenWhatsappIcon,
              //     ),
              //   ),
              // ),
              text: TextSpan(
                // text: "Email already exists",
                style: CustomTextStyles.semiBold(
                    fontSize: 20.sp, color: CustomColors.green400Color),
                children: [
                  WidgetSpan(
                    alignment: PlaceholderAlignment.baseline,
                    baseline: TextBaseline.alphabetic,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0, right: 10),
                      child: SvgPicture.asset(
                        ConstantString.infoIcon,
                      ),
                    ),
                  ),
                  TextSpan(
                    text: "Email already exists",
                    style: CustomTextStyles.semiBold(
                      fontSize: 20.sp,
                      color: CustomColors.green400Color,
                    ),
                  ),
                ],
              ),
            ),

            // description: const Text(
            //     "Make changes to your profile here. Click save when you're done"),
            // actions: const [
            //   ShadButton(child: Text('Save changes'))
            // ],
            child: Material(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                "We found an existing profile with the email ",
                            style: CustomTextStyles.regular(
                              fontSize: 14.sp,
                              color: CustomColors.blackTextColor,
                            ),
                          ),
                          TextSpan(
                            text: "chidinma@mycovergenius.com",
                            style: CustomTextStyles.medium(
                              fontSize: 14.sp,
                              color: CustomColors.green500Color,
                            ),
                          ),
                          TextSpan(
                            text:
                                ". Please log in with your credentials to continue.",
                            style: CustomTextStyles.regular(
                              fontSize: 14.sp,
                              color: CustomColors.blackTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // regularText(
                    //     'MyCover would love to keep you informed about what matters most.',
                    //     fontSize: 15.sp,
                    //     color: CustomColors.blackTextColor,
                    //     textAlign: TextAlign.center),
                    // // verticalSpacer(50),
                    verticalSpacer(40),
                    mediumText('Password',
                        fontSize: 16.sp, color: CustomColors.greenTextColor),
                    verticalSpacer(10),
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
                              errorText: 'Email field cannot be empty '),
                        ],
                      ),

                      suffix: obscurePassword
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
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

                    SizedBox(
                      height: 40,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                context.goNamed(
                                    RouteConstants.forgotPasswordScreen);
                              },
                              child: mediumText(
                                'Forgot password?',
                                fontSize: 14.sp,
                                color: CustomColors.green500Color,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    verticalSpacer(50),
                    CustomButton(
                      title: 'Log in to my account',
                      onTap: () {
                        context.pop();
                      },
                    ),
                    verticalSpacer(18),
                    Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Not your account? ",
                              style: CustomTextStyles.medium(
                                fontSize: 16.sp,
                                color: CustomColors.greenTextColor,
                              ),
                            ),
                            TextSpan(
                              text: "Logout",
                              style: CustomTextStyles.medium(
                                fontSize: 16.sp,
                                color: CustomColors.green500Color,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    verticalSpacer(50),
                  ],
                ),
              ),
            ),
          ),
        );
      });
    },
  );
}
