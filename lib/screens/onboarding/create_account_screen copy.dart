import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/utils/custom_text_styles.dart';
import 'package:genius_app/utils/enum.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_button.dart';
import 'package:genius_app/widgets/custom_text_field.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class SecondCreateAccountScreen extends StatefulWidget {
  const SecondCreateAccountScreen({super.key});

  @override
  State<SecondCreateAccountScreen> createState() =>
      _SecondCreateAccountScreenState();
}

class _SecondCreateAccountScreenState extends State<SecondCreateAccountScreen> {
  AccountType? accountType;
  bool termsChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpacer(MediaQuery.of(context).padding.top + 20),
                  Row(
                    children: [
                      SvgPicture.asset(
                        ConstantString.backButtonIcon,
                      ),
                      horizontalSpacer(10),
                      Expanded(child: const ShadProgress(value: 0.6)),
                    ],
                  ),
                  // AnimatedProgressBar(
                  //   progress: 0.7, // 70% progress
                  //   height: 10.0, // Optional: customize height
                  //   progressColor: Colors.blue, // Optional: customize color
                  //   backgroundColor:
                  //       Colors.grey.shade200, // Optional: customize background
                  //   animationDuration: Duration(
                  //       milliseconds:
                  //           500), // Optional: customize animation speed
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        ConstantString.needHelpIcon,
                      ),
                      horizontalSpacer(10),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Need help? ",
                              style: CustomTextStyles.medium(
                                fontSize: 12.sp,
                                color: CustomColors.blackTextColor,
                              ),
                            ),
                            TextSpan(
                              text: "Contact Support",
                              style: CustomTextStyles.semiBold(
                                fontSize: 12.sp,
                                color: CustomColors.green500Color,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  verticalSpacer(15),

                  semiBoldText(
                    'CREATE YOUR ACCOUNT 👤',
                    fontSize: 12.sp,
                    color: CustomColors.green500Color,
                  ),
                  verticalSpacer(15),

                  semiBoldText(
                    'Join MyCover and enjoy financial security.',
                    fontSize: 20.sp,
                    color: CustomColors.green400Color,
                    height: 1.1,
                  ),
                  verticalSpacer(50),

                  customTextField(
                    'email',
                    'Legal First Name',
                    validator: FormBuilderValidators.compose(
                      [
                        FormBuilderValidators.email(
                            errorText: 'Provided email not valid '),
                        FormBuilderValidators.required(
                            errorText: 'Email field cannot be empty '),
                      ],
                    ),
                  ),
                  verticalSpacer(30),
                  customTextField(
                    'email',
                    'Legal Last Name',
                    validator: FormBuilderValidators.compose(
                      [
                        FormBuilderValidators.email(
                            errorText: 'Provided email not valid '),
                        FormBuilderValidators.required(
                            errorText: 'Email field cannot be empty '),
                      ],
                    ),
                  ),
                  verticalSpacer(30),
                  customTextField(
                    'email',
                    'Email address',
                    validator: FormBuilderValidators.compose(
                      [
                        FormBuilderValidators.email(
                            errorText: 'Provided email not valid '),
                        FormBuilderValidators.required(
                            errorText: 'Email field cannot be empty '),
                      ],
                    ),
                  ),
                  verticalSpacer(30),
                  ShadCheckbox(
                    value: termsChecked,
                    onChanged: (v) => setState(() => termsChecked = v),
                    label: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "I acknowledge the ",
                            style: CustomTextStyles.medium(
                              fontSize: 14.sp,
                              color: CustomColors.grey700Color,
                            ),
                          ),
                          TextSpan(
                            text: "Terms & Conditions",
                            style: CustomTextStyles.semiBold(
                              fontSize: 14.sp,
                              color: CustomColors.green500Color,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // customTextField(
                  //   'password',
                  //   Icons.vpn_key,
                  //   Icons.remove_red_eye_outlined,
                  //   'Password',
                  //   obscureText: passwordObscured,
                  //   onSuffixTap: () {
                  //     setState(() {
                  //       passwordObscured = !passwordObscured;
                  //     });
                  //   },
                  //   onChanged: (value) {
                  //     // setState(() {
                  //     //   password = value!;
                  //     //   print(password);
                  //     // });
                  //   },
                  //   validator: FormBuilderValidators.compose([
                  //     FormBuilderValidators.minLength(6,
                  //         errorText: 'Good passwords are greater than 6 characters'),
                  //     FormBuilderValidators.required(
                  //         errorText: 'Password field cannot be empty '),
                  //   ]),
                  // ),
                  verticalSpacer(40),
                  CustomButton(
                    title: 'Continue',
                    onTap: accountType == null ? null : () {},
                  ),
                  // verticalSpacer(MediaQuery.of(context).padding.bottom + 20),
                  verticalSpacer(10),
                  Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Got an account? ",
                            style: CustomTextStyles.medium(
                              fontSize: 16.sp,
                              color: CustomColors.greenTextColor,
                            ),
                          ),
                          TextSpan(
                            text: "Login",
                            style: CustomTextStyles.semiBold(
                              fontSize: 16.sp,
                              color: CustomColors.green500Color,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        ConstantString.needHelpIcon,
                      ),
                      horizontalSpacer(10),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Need help? ",
                              style: CustomTextStyles.medium(
                                fontSize: 12.sp,
                                color: CustomColors.blackTextColor,
                              ),
                            ),
                            TextSpan(
                              text: "Contact Support",
                              style: CustomTextStyles.semiBold(
                                fontSize: 12.sp,
                                color: CustomColors.green500Color,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  verticalSpacer(MediaQuery.of(context).padding.bottom + 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
