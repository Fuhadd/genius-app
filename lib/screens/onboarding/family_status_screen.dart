import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/animated_flip_card.dart';
import 'package:genius_app/widgets/custom_button.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FamilyStatusScreen extends StatefulHookConsumerWidget {
  final VoidCallback onNext;
  const FamilyStatusScreen({super.key, required this.onNext});

  @override
  ConsumerState<FamilyStatusScreen> createState() => _FamilyStatusScreenState();
}

class _FamilyStatusScreenState extends ConsumerState<FamilyStatusScreen>
    with SingleTickerProviderStateMixin {
  FamilyStatusModel? selectedFamilyStatus;

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
  void _selectInsuranceType(FamilyStatusModel familyStatus) {
    setState(() {
      selectedFamilyStatus = familyStatus;

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
                    'WHAT’S YOUR FAMILY STATUS? 👫',
                    fontSize: 12.sp,
                    color: CustomColors.green500Color,
                  ),
                  verticalSpacer(12.h),

                  semiBoldText(
                    'We would love to know your family status.',
                    fontSize: 20.sp,
                    color: CustomColors.green400Color,
                  ),
                  verticalSpacer(48.h),

                  Wrap(
                    alignment: WrapAlignment.center,
                    runAlignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    // runSpacing: 1,
                    spacing: 20,
                    children: [
                      ...familyStatuses.map((item) {
                        return AnimatedFlipCard(
                          title: item.title,
                          frontChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                item.icon,
                              ),
                              mediumText(
                                item.title,
                                fontSize: 16.sp,
                                color: CustomColors.blackTextColor,
                              ),
                            ],
                          ),
                          isSelected: selectedFamilyStatus == item,
                          backChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                item.selectedIcon,
                              ),
                              mediumText(
                                item.title,
                                fontSize: 16.sp,
                                textAlign: TextAlign.center,
                                color: CustomColors.green500Color,
                              ),
                            ],
                          ),
                          onTap: () => _selectInsuranceType(item),
                          // onTap: () => setState(() {
                          //   selectedFamilyStatus = item;
                          // }),
                        );
                      }),
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
                  //   onTap: () {
                  //     widget.onNext();
                  //     // ref.read(onboardingProgressProvider.notifier).state = 0.2;
                  //     // context.pushNamed(
                  //     //   RouteConstants.phoneNumberScreen,
                  //     // );
                  //   },
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

class FamilyStatusModel {
  final String title, icon, selectedIcon;

  FamilyStatusModel({
    required this.title,
    required this.icon,
    required this.selectedIcon,
  });
}

List<FamilyStatusModel> familyStatuses = [
  FamilyStatusModel(
    title: 'I am single',
    icon: ConstantString.singleIcon,
    selectedIcon: ConstantString.greenSingleIcon,
  ),
  FamilyStatusModel(
    title: 'I am married',
    icon: ConstantString.marriedIcon,
    selectedIcon: ConstantString.greenMarriedIcon,
  ),
  FamilyStatusModel(
    title: 'I am raising kids',
    icon: ConstantString.raisingKidsIcon,
    selectedIcon: ConstantString.greenRaisingKidsIcon,
  ),
];
