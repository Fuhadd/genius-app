import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_button.dart';
import 'package:genius_app/widgets/custom_text_field.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class PlainSetPasswordScreen extends StatefulHookConsumerWidget {
  const PlainSetPasswordScreen({super.key});

  @override
  ConsumerState<PlainSetPasswordScreen> createState() =>
      _PlainSetPasswordScreenState();
}

class _PlainSetPasswordScreenState
    extends ConsumerState<PlainSetPasswordScreen> {
  bool is8Characters = false;
  bool hasOneUppercase = false;
  bool hasOneLowercase = false;
  bool hasOneNumber = false;
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
            // verticalSpacer(10),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        verticalSpacer(MediaQuery.of(context).padding.top + 20),
                        // CustomProgressBar(),
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

                        verticalSpacer(20),

                        semiBoldText(
                          'BECOME A SECURED GENIUS 🔐',
                          fontSize: 12.sp,
                          color: CustomColors.green500Color,
                        ),
                        verticalSpacer(15),

                        semiBoldText(
                          'You are almost there. Secure your account with a strong password',
                          fontSize: 20.sp,
                          color: CustomColors.green400Color,
                          height: 1.1,
                        ),
                        verticalSpacer(50),

                        customTextField(
                          'email',
                          'Password',
                          // obscureText: true,
                          onChanged: (value) {
                            if (value == null || value.isEmpty) {
                              is8Characters = false;
                              hasOneUppercase = false;
                              hasOneLowercase = false;
                              hasOneNumber = false;
                            } else {
                              is8Characters = value.length >= 8;
                              hasOneUppercase =
                                  value.contains(RegExp(r'[A-Z]'));
                              hasOneLowercase =
                                  value.contains(RegExp(r'[a-z]'));
                              hasOneNumber = value.contains(RegExp(r'[0-9]'));
                            }
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

                        verticalSpacer(40),

                        Wrap(
                          alignment: WrapAlignment.center,
                          runAlignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          runSpacing: 5,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 3.0),
                                    child: SvgPicture.asset(
                                      ConstantString.verifiedIcon,
                                      color: is8Characters
                                          ? CustomColors.green500Color
                                          : CustomColors.grey500Color,
                                    ),
                                  ),
                                  horizontalSpacer(5),
                                  mediumText(
                                    'at least 8 characters',
                                    fontSize: 14.sp,
                                    color: is8Characters
                                        ? CustomColors.green500Color
                                        : CustomColors.grey500Color,
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 3.0),
                                  child: SvgPicture.asset(
                                    ConstantString.verifiedIcon,
                                    color: hasOneNumber
                                        ? CustomColors.green500Color
                                        : CustomColors.grey500Color,
                                  ),
                                ),
                                horizontalSpacer(5),
                                mediumText(
                                  'at least one number',
                                  fontSize: 14.sp,
                                  color: hasOneNumber
                                      ? CustomColors.green500Color
                                      : CustomColors.grey500Color,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 3.0),
                                  child: SvgPicture.asset(
                                    ConstantString.verifiedIcon,
                                    color: hasOneLowercase
                                        ? CustomColors.green500Color
                                        : CustomColors.grey500Color,
                                  ),
                                ),
                                horizontalSpacer(5),
                                mediumText(
                                  'one lowercase',
                                  fontSize: 14.sp,
                                  color: hasOneLowercase
                                      ? CustomColors.green500Color
                                      : CustomColors.grey500Color,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 3.0),
                                  child: SvgPicture.asset(
                                    ConstantString.verifiedIcon,
                                    color: hasOneUppercase
                                        ? CustomColors.green500Color
                                        : CustomColors.grey500Color,
                                  ),
                                ),
                                horizontalSpacer(5),
                                mediumText(
                                  'one upper case',
                                  fontSize: 14.sp,
                                  color: hasOneUppercase
                                      ? CustomColors.green500Color
                                      : CustomColors.grey500Color,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Spacer(),
                        CustomButton(
                          title: 'Set Password',
                          onTap: (!is8Characters ||
                                  !hasOneUppercase ||
                                  !hasOneLowercase ||
                                  !hasOneNumber)
                              ? null
                              : () {
                                  // ref.read(onboardingProgressProvider.notifier).state = 0.2;
                                  // context.goNamed(
                                  //   RouteConstants.accountVerifiedScreen,
                                  // );
                                },
                        ),
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
