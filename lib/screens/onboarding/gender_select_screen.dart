import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/utils/enum.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_button.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:genius_app/widgets/grid_options_container.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GenderSelectScreen extends StatefulHookConsumerWidget {
  final VoidCallback onNext;
  const GenderSelectScreen({super.key, required this.onNext});

  @override
  ConsumerState<GenderSelectScreen> createState() => _GenderSelectScreenState();
}

class _GenderSelectScreenState extends ConsumerState<GenderSelectScreen>
    with SingleTickerProviderStateMixin {
  Gender? gender;
  late AnimationController _buttonAnimationController;
  late Animation<Offset> _buttonSlideAnimation;
  bool _showButton = false;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller for the button slide-in animation
    _buttonAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    // Define the slide animation from below screen to normal position
    _buttonSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 2), // Start from below the screen
      end: Offset.zero, // End at normal position
    ).animate(CurvedAnimation(
      parent: _buttonAnimationController,
      curve: Curves.easeOutQuart, // Smooth entry curve
    ));
  }

  @override
  void dispose() {
    _buttonAnimationController.dispose();
    super.dispose();
  }

  // Function to handle insurance type selection
  void _selectInsuranceType(Gender seleectedGender) {
    setState(() {
      gender = seleectedGender;

      // Show button with animation if it's not already shown
      if (!_showButton) {
        _showButton = true;
        _buttonAnimationController.forward();
      }
    });
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // verticalSpacer(MediaQuery.of(context).padding.top + 20),
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

                  boldText(
                    'HOW WOULD YOU DESCRIBE YOURSELF? 😊',
                    fontSize: 12.sp,
                    color: CustomColors.green500Color,
                  ),
                  verticalSpacer(12.h),

                  semiBoldText(
                    'What’s your gender?',
                    fontSize: 20.sp,
                    color: CustomColors.green400Color,
                  ),
                  verticalSpacer(28.h),
                  verticalSpacer(48.h),

                  Row(
                    children: [
                      GridOptionsContainer(
                        title: "Male",
                        icon: ConstantString.maleIcon,
                        isSelected: gender == Gender.male,
                        onTap: () => _selectInsuranceType(Gender.male),
                        // onTap: () => setState(() {
                        //   gender = Gender.male;
                        // }),
                      ),
                      horizontalSpacer(20),
                      GridOptionsContainer(
                        title: "Female",
                        icon: ConstantString.femaleIcon,
                        isSelected: gender == Gender.female,
                        onTap: () => _selectInsuranceType(Gender.female),
                        // onTap: () => setState(() {
                        //   gender = Gender.female;
                        // }),
                      ),
                    ],
                  ),

                  verticalSpacer(10),

                  Spacer(),
                  _showButton
                      ? SlideTransition(
                          position: _buttonSlideAnimation,
                          child: CustomButton(
                            title: 'Continue',
                            onTap: () {
                              widget.onNext();
                            },
                          ),
                        )
                      : SizedBox(height: 48.h),
                  // CustomButton(
                  //   title: 'Continue',
                  //   onTap: gender == null
                  //       ? null
                  //       : () {
                  //           widget.onNext();
                  //           // ref.read(onboardingProgressProvider.notifier).state = 0.2;
                  //           // context.pushNamed(
                  //           //   RouteConstants.phoneNumberScreen,
                  //           // );
                  //         },
                  // ),
                  // verticalSpacer(MediaQuery.of(context).padding.bottom + 20),
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
