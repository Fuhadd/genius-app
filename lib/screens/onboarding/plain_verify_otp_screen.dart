import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/constants/route_constants.dart';
import 'package:genius_app/dialogs_and_popups/bottom_sheets/resend_otp_bottom_sheet.dart';
import 'package:genius_app/utils/custom_text_styles.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_button.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class PlainVerifyOtpScreen extends StatefulHookConsumerWidget {
  const PlainVerifyOtpScreen({super.key});

  @override
  ConsumerState<PlainVerifyOtpScreen> createState() =>
      _PlainVerifyOtpScreenState();
}

class _PlainVerifyOtpScreenState extends ConsumerState<PlainVerifyOtpScreen> {
  bool buttonActive = false;

  Timer? countdownTimer;
  Duration myDuration = const Duration(minutes: 3);
  String seconds = "60";
  bool isCountdownActive = false;

  @override
  void initState() {
    // startTimer();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
    setState(() {
      isCountdownActive = true;
    });
  }

  void stopTimer() {
    setState(() {
      countdownTimer?.cancel();
      isCountdownActive = false;
    });
  }

  void resetTimer() {
    stopTimer();
    setState(() {
      myDuration = const Duration(minutes: 3);
      isCountdownActive = false;
    });
  }

  void setCountDown() {
    const reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        if (countdownTimer != null) {
          countdownTimer?.cancel();
        }
        isCountdownActive = false;
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final pinController = useTextEditingController();

    var isPin = useState(false);
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
                        // CustomProgressBar(),

                        verticalSpacer(20),

                        semiBoldText(
                          'VERIFICATION CODE 🔢',
                          fontSize: 12.sp,
                          color: CustomColors.green500Color,
                        ),
                        verticalSpacer(15),

                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    "We’ve sent a 4-digit code as an SMS to your phone ",
                                style: CustomTextStyles.medium(
                                  fontSize: 20.sp,
                                  color: CustomColors.green400Color,
                                ),
                              ),
                              TextSpan(
                                text: "08037287292",
                                style: CustomTextStyles.semiBold(
                                  fontSize: 20.sp,
                                  color: CustomColors.green500Color,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),

                        verticalSpacer(50),

                        verticalSpacer(30),

                        PinCodeTextField(
                          mainAxisAlignment: MainAxisAlignment.center,
                          appContext: context,
                          length: 4,
                          obscureText: false,
                          animationType: AnimationType.fade,
                          keyboardType: TextInputType.number,
                          hintCharacter: 'o',
                          hintStyle: CustomTextStyles.medium(
                            fontSize: 14.sp,
                            color: CustomColors.grey500Color,
                          ),
                          // textStyle: CustomTextStyles.w500(
                          //   fontSize: 14.sp,
                          //   color: CustomColors.grey800Color,
                          // ),
                          controller: pinController,
                          pinTheme: PinTheme(
                            fieldOuterPadding:
                                EdgeInsets.only(right: 8.0.w, left: 8.0.w),
                            shape: PinCodeFieldShape.box,
                            fieldHeight: 60.h,
                            fieldWidth: 60.w,
                            selectedColor: CustomColors.green500Color,
                            selectedFillColor: CustomColors.whiteColor,
                            activeFillColor: CustomColors.grey50Color,
                            activeColor: CustomColors.grey50Color,
                            inactiveColor: CustomColors.grey50Color,
                            inactiveFillColor: CustomColors.grey50Color,
                            borderWidth: 1,
                            selectedBorderWidth: 1,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          cursorColor: Theme.of(context).primaryColor,
                          animationDuration: const Duration(milliseconds: 300),
                          enableActiveFill: true,
                          onCompleted: (v) {
                            isPin.value = true;
                          },
                          onChanged: (value) {
                            isPin.value =
                                pinController.text.length >= 6 ? true : false;
                          },
                          beforeTextPaste: (text) {
                            return true;
                          },
                        ),
                        verticalSpacer(15),
                        Center(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Didn’t receive the code? ",
                                  style: CustomTextStyles.medium(
                                    fontSize: 16.sp,
                                    color: CustomColors.grey700Color,
                                  ),
                                ),
                                TextSpan(
                                  text: "Resend",
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      resendOtpBottomSheet(context);
                                      // resetTimer();
                                      // startTimer();
                                    },
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
                        CustomButton(
                          title: 'Verify',
                          onTap: !isPin.value
                              ? null
                              : () {
                                  // ref.read(onboardingProgressProvider.notifier).state = 0.2;
                                  // widget.onNext();
                                  context.pushNamed(
                                    RouteConstants.setPasswordScreen,
                                  );
                                },
                        ),
                        // verticalSpacer(MediaQuery.of(context).padding.bottom + 20),

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
