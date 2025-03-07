// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:genius_app/constants/custom_colors.dart';
// import 'package:genius_app/constants/custom_string.dart';
// import 'package:genius_app/utils/enum.dart';
// import 'package:genius_app/utils/spacers.dart';
// import 'package:genius_app/widgets/custom_button.dart';
// import 'package:genius_app/widgets/custom_text_widget.dart';
// import 'package:genius_app/widgets/single_list_options_container.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:shadcn_ui/shadcn_ui.dart';

// class InsuranceTypeScreen extends StatefulHookConsumerWidget {
//   final VoidCallback onNext;
//   const InsuranceTypeScreen({super.key, required this.onNext});

//   @override
//   ConsumerState<InsuranceTypeScreen> createState() =>
//       _InsuranceTypeScreenState();
// }

// class _InsuranceTypeScreenState extends ConsumerState<InsuranceTypeScreen> {
//   InsuranceType? insuranceType;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20.0),
//         child: CustomScrollView(
//           slivers: [
//             SliverFillRemaining(
//               hasScrollBody: false,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // verticalSpacer(MediaQuery.of(context).padding.top + 20)
//                   // CustomProgressBar(),
//                   // AnimatedProgressBar(
//                   //   progress: 0.7, // 70% progress
//                   //   height: 10.0, // Optional: customize height
//                   //   progressColor: Colors.blue, // Optional: customize color
//                   //   backgroundColor:
//                   //       Colors.grey.shade200, // Optional: customize background
//                   //   animationDuration: Duration(
//                   //       milliseconds:
//                   //           500), // Optional: customize animation speed
//                   // ),

//                   verticalSpacer(20),

//                   Row(
//                     children: [
//                       boldText(
//                         'LET’S HELP YOU MAKE THE RIGHT CHOICE ',
//                         fontSize: 12.sp,
//                         color: CustomColors.green500Color,
//                       ),
//                       SvgPicture.asset(
//                         ConstantString.coverLogo,
//                       )
//                     ],
//                   ),
//                   verticalSpacer(12.h),

//                   semiBoldText(
//                     'What type of insurance is your priority right now?',
//                     fontSize: 20.sp,
//                     color: CustomColors.green400Color,
//                   ),
//                   verticalSpacer(48.h),

//                   SingleListOptionsContainer(
//                     title: "Gadgets and Devices",
//                     icon: ConstantString.gadgetIcon,
//                     selectedIcon: ConstantString.greenGadgetIcon,
//                     isSelected: insuranceType == InsuranceType.gadget,
//                     textColor: CustomColors.blackTextColor,
//                     onTap: () => setState(() {
//                       insuranceType = InsuranceType.gadget;
//                     }),
//                   ),
//                   verticalSpacer(20.h),
//                   SingleListOptionsContainer(
//                     title: "Travel Insurance",
//                     icon: ConstantString.travelIcon,
//                     selectedIcon: ConstantString.greenTravelIcon,
//                     isSelected: insuranceType == InsuranceType.travel,
//                     textColor: CustomColors.blackTextColor,
//                     onTap: () => setState(() {
//                       insuranceType = InsuranceType.travel;
//                     }),
//                   ),
//                   verticalSpacer(20.h),
//                   SingleListOptionsContainer(
//                     title: "Health Insurance",
//                     icon: ConstantString.healthIcon,
//                     selectedIcon: ConstantString.greenHealthIcon,
//                     isSelected: insuranceType == InsuranceType.health,
//                     textColor: CustomColors.blackTextColor,
//                     onTap: () => setState(() {
//                       insuranceType = InsuranceType.health;
//                     }),
//                   ),
//                   verticalSpacer(20.h),
//                   SingleListOptionsContainer(
//                     title: "Vehicle Insurance",
//                     icon: ConstantString.vehicleIcon,
//                     selectedIcon: ConstantString.greenVehicleIcon,
//                     isSelected: insuranceType == InsuranceType.vehicle,
//                     textColor: CustomColors.blackTextColor,
//                     onTap: () => setState(() {
//                       insuranceType = InsuranceType.vehicle;
//                     }),
//                   ),

//                   Spacer(),
//                   CustomButton(
//                     title: 'Continue',
//                     onTap: insuranceType == null
//                         ? null
//                         : () {
//                             widget.onNext();
//                             // ref.read(onboardingProgressProvider.notifier).state = 0.2;
//                             // context.pushNamed(
//                             //   RouteConstants.phoneNumberScreen,
//                             // );
//                           },
//                   ),
//                   // verticalSpacer(MediaQuery.of(context).padding.bottom + 20),
//                   Spacer(),

//                   verticalSpacer(MediaQuery.of(context).padding.bottom + 20),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/utils/enum.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_button.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:genius_app/widgets/single_list_options_container.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class InsuranceTypeScreen extends StatefulHookConsumerWidget {
  final VoidCallback onNext;
  const InsuranceTypeScreen({super.key, required this.onNext});

  @override
  ConsumerState<InsuranceTypeScreen> createState() =>
      _InsuranceTypeScreenState();
}

class _InsuranceTypeScreenState extends ConsumerState<InsuranceTypeScreen>
    with SingleTickerProviderStateMixin {
  InsuranceType? insuranceType;
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
  void _selectInsuranceType(InsuranceType type) {
    setState(() {
      insuranceType = type;

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
                  verticalSpacer(20),

                  Row(
                    children: [
                      boldText(
                        'LET\'S HELP YOU MAKE THE RIGHT CHOICE ',
                        fontSize: 12.sp,
                        color: CustomColors.green500Color,
                      ),
                      SvgPicture.asset(
                        ConstantString.coverLogo,
                      )
                    ],
                  ),
                  verticalSpacer(12.h),

                  semiBoldText(
                    'What type of insurance is your priority right now?',
                    fontSize: 20.sp,
                    color: CustomColors.green400Color,
                  ),
                  verticalSpacer(48.h),

                  SingleListOptionsContainer(
                    title: "Gadgets and Devices",
                    icon: ConstantString.gadgetIcon,
                    selectedIcon: ConstantString.greenGadgetIcon,
                    isSelected: insuranceType == InsuranceType.gadget,
                    textColor: CustomColors.blackTextColor,
                    onTap: () => _selectInsuranceType(InsuranceType.gadget),
                  ),
                  verticalSpacer(20.h),
                  SingleListOptionsContainer(
                    title: "Travel Insurance",
                    icon: ConstantString.travelIcon,
                    selectedIcon: ConstantString.greenTravelIcon,
                    isSelected: insuranceType == InsuranceType.travel,
                    textColor: CustomColors.blackTextColor,
                    onTap: () => _selectInsuranceType(InsuranceType.travel),
                  ),
                  verticalSpacer(20.h),
                  SingleListOptionsContainer(
                    title: "Health Insurance",
                    icon: ConstantString.healthIcon,
                    selectedIcon: ConstantString.greenHealthIcon,
                    isSelected: insuranceType == InsuranceType.health,
                    textColor: CustomColors.blackTextColor,
                    onTap: () => _selectInsuranceType(InsuranceType.health),
                  ),
                  verticalSpacer(20.h),
                  SingleListOptionsContainer(
                    title: "Vehicle Insurance",
                    icon: ConstantString.vehicleIcon,
                    selectedIcon: ConstantString.greenVehicleIcon,
                    isSelected: insuranceType == InsuranceType.vehicle,
                    textColor: CustomColors.blackTextColor,
                    onTap: () => _selectInsuranceType(InsuranceType.vehicle),
                  ),

                  Spacer(),

                  // Only show the button if an insurance type has been selected
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
                      : SizedBox(
                          height:
                              48.h), // Empty space with same height as button

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
