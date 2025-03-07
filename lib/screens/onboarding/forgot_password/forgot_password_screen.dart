import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/route_constants.dart';
import 'package:genius_app/screens/onboarding/phone_number_screen.dart';
import 'package:genius_app/utils/enum.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_button.dart';
import 'package:genius_app/widgets/custom_text_field.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ForgotPasswordScreen extends StatefulHookConsumerWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ConsumerState<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  AccountType? accountType;
  bool termsChecked = false;
  String? phoneNumber;
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
                  // CustomProgressBar(),

                  verticalSpacer(20),

                  mediumText(
                    'FORGOT YOUR PASSWORD? 🥲',
                    fontSize: 12.sp,
                    color: CustomColors.green500Color,
                  ),
                  verticalSpacer(15),

                  semiBoldText(
                    'Provide your phone number, let’s get you back on track',
                    fontSize: 20.sp,
                    color: CustomColors.green400Color,
                    height: 1.1,
                  ),
                  verticalSpacer(50),

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
                  Spacer(),

                  CustomButton(
                    title: 'Send code to this number',
                    onTap: phoneNumber == null
                        ? null
                        : () {
                            // ref.read(onboardingProgressProvider.notifier).state = 0.2;
                            context.pushNamed(
                              RouteConstants.verifyOtpScreen,
                            );
                          },
                  ),
                  // verticalSpacer(MediaQuery.of(context).padding.bottom + 20),
                  verticalSpacer(10),
                  Spacer(),

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
