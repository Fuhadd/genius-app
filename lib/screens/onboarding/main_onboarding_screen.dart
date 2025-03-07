// import 'package:flutter/material.dart';

// class MainOnboardingScreen extends StatefulWidget {
//   const MainOnboardingScreen({super.key});

//   @override
//   _MainOnboardingScreenState createState() => _MainOnboardingScreenState();
// }

// class _MainOnboardingScreenState extends State<MainOnboardingScreen> {
//   int _currentStep = 0;
//   final int _totalSteps = 4;
//   final PageController _pageController = PageController();

//   // Define your step content widgets
//   final List<Widget> _steps = [
//     const BasicInfoStep(),
//     const ContactInfoStep(),
//     const PreferencesStep(),
//     const ConfirmationStep(),
//   ];

//   void _nextStep() {
//     if (_currentStep < _totalSteps - 1) {
//       setState(() {
//         _currentStep++;
//       });
//       _pageController.animateToPage(
//         _currentStep,
//         duration: const Duration(milliseconds: 400),
//         curve: Curves.easeInOut,
//       );
//     }
//   }

//   void _previousStep() {
//     if (_currentStep > 0) {
//       setState(() {
//         _currentStep--;
//       });
//       _pageController.animateToPage(
//         _currentStep,
//         duration: const Duration(milliseconds: 400),
//         curve: Curves.easeInOut,
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             // Progress Indicator
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: ProgressIndicator(
//                 currentStep: _currentStep,
//                 totalSteps: _totalSteps,
//               ),
//             ),
//             // Step Content
//             Expanded(
//               child: PageView(
//                 controller: _pageController,
//                 physics: const NeverScrollableScrollPhysics(),
//                 children: _steps,
//               ),
//             ),
//             // Navigation Buttons
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   if (_currentStep > 0)
//                     ElevatedButton(
//                       onPressed: _previousStep,
//                       child: const Text('Previous'),
//                     ),
//                   ElevatedButton(
//                     onPressed: _nextStep,
//                     child: Text(
//                         _currentStep == _totalSteps - 1 ? 'Finish' : 'Next'),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // Custom Progress Indicator
// class ProgressIndicator extends StatelessWidget {
//   final int currentStep;
//   final int totalSteps;

//   const ProgressIndicator({
//     super.key,
//     required this.currentStep,
//     required this.totalSteps,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: List.generate(totalSteps, (index) {
//         final isCompleted = index <= currentStep;
//         final isLast = index == totalSteps - 1;

//         return Expanded(
//           child: Row(
//             children: [
//               // Circular step indicator
//               TweenAnimationBuilder<double>(
//                 tween: Tween(
//                   begin: 0.0,
//                   end: isCompleted ? 1.0 : 0.0,
//                 ),
//                 duration: const Duration(milliseconds: 300),
//                 builder: (context, value, child) {
//                   return Container(
//                     width: 30,
//                     height: 30,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: Color.lerp(
//                         Colors.grey[300],
//                         Theme.of(context).primaryColor,
//                         value,
//                       ),
//                     ),
//                     child: Center(
//                       child: Text(
//                         '${index + 1}',
//                         style: TextStyle(
//                           color: Color.lerp(
//                             Colors.black54,
//                             Colors.white,
//                             value,
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//               // Connecting line
//               if (!isLast)
//                 Expanded(
//                   child: TweenAnimationBuilder<double>(
//                     tween: Tween(
//                       begin: 0.0,
//                       end: isCompleted ? 1.0 : 0.0,
//                     ),
//                     duration: const Duration(milliseconds: 300),
//                     builder: (context, value, child) {
//                       return Container(
//                         height: 2,
//                         color: Color.lerp(
//                           Colors.grey[300],
//                           Theme.of(context).primaryColor,
//                           value,
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//             ],
//           ),
//         );
//       }),
//     );
//   }
// }

// // Example Step Widgets
// class BasicInfoStep extends StatelessWidget {
//   const BasicInfoStep({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: AnimatedSwitcher(
//         duration: const Duration(milliseconds: 300),
//         child: const Text('Basic Info Step'),
//       ),
//     );
//   }
// }

// class ContactInfoStep extends StatelessWidget {
//   const ContactInfoStep({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: AnimatedSwitcher(
//         duration: const Duration(milliseconds: 300),
//         child: const Text('Contact Info Step'),
//       ),
//     );
//   }
// }

// class PreferencesStep extends StatelessWidget {
//   const PreferencesStep({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: AnimatedSwitcher(
//         duration: const Duration(milliseconds: 300),
//         child: const Text('Preferences Step'),
//       ),
//     );
//   }
// }

// class ConfirmationStep extends StatelessWidget {
//   const ConfirmationStep({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: AnimatedSwitcher(
//         duration: const Duration(milliseconds: 300),
//         child: const Text('Confirmation Step'),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:genius_app/screens/onboarding/create_account_screen.dart';
import 'package:genius_app/screens/onboarding/phone_number_screen.dart';
import 'package:genius_app/screens/onboarding/set_password_screen.dart';
import 'package:genius_app/screens/onboarding/verify_otp_screen.dart';
import 'package:genius_app/widgets/custom_progress_bar.dart';
import 'package:go_router/go_router.dart';

class MainOnboardingScreen extends StatefulWidget {
  const MainOnboardingScreen({super.key});

  @override
  _MainOnboardingScreenState createState() => _MainOnboardingScreenState();
}

class _MainOnboardingScreenState extends State<MainOnboardingScreen> {
  final createAccountFormKey = GlobalKey<FormBuilderState>();
  int _currentStep = 0;
  final int _totalSteps = 4;

  void nextStep() {
    if (_currentStep < _totalSteps - 1) {
      setState(() {
        _currentStep++;
      });
    }
  }

  void _previousStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
      });
    } else if (_currentStep == 0 && (context.canPop())) {
      context.pop();
    }
  }

  // Define your step content widgets

  @override
  Widget build(BuildContext context) {
    final progressValue = (_currentStep + 1) / 10; //_totalSteps
    final List<Widget> steps = [
      CreateAccountScreen(
        onNext: nextStep,
        formKey: createAccountFormKey,
      ),
      PhoneNumberScreen(onNext: nextStep),
      VerifyOtpScreen(onNext: nextStep),
      SetPasswordScreen(onNext: nextStep),
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Progress Indicator
            // Padding(
            //   padding: const EdgeInsets.all(16.0),
            //   child: ProgressIndicator(
            //     currentStep: _currentStep,
            //     totalSteps: _totalSteps,
            //   ),
            // ),
            CustomProgressBar(
              onTap: (_currentStep > 0 || _currentStep == 0)
                  ? _previousStep
                  : null,
              progress: progressValue,
            ),
            // Step Content with Fade Animation
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 700),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
                child: KeyedSubtree(
                  key: ValueKey<int>(_currentStep),
                  child: steps[_currentStep],
                ),
              ),
            ),
            // Navigation Buttons
            // Padding(
            //   padding: const EdgeInsets.all(16.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       if (_currentStep > 0)
            //         ElevatedButton(
            //           onPressed: _previousStep,
            //           child: const Text('Previous'),
            //         ),
            //       ElevatedButton(
            //         onPressed: _nextStep,
            //         child: Text(
            //             _currentStep == _totalSteps - 1 ? 'Finish' : 'Next'),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

// Custom Progress Indicator
class ProgressIndicator extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const ProgressIndicator({
    super.key,
    required this.currentStep,
    required this.totalSteps,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(totalSteps, (index) {
        final isCompleted = index <= currentStep;
        final isLast = index == totalSteps - 1;

        return Expanded(
          child: Row(
            children: [
              // Circular step indicator
              TweenAnimationBuilder<double>(
                tween: Tween(
                  begin: 0.0,
                  end: isCompleted ? 1.0 : 0.0,
                ),
                duration: const Duration(milliseconds: 300),
                builder: (context, value, child) {
                  return Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.lerp(
                        Colors.grey[300],
                        Theme.of(context).primaryColor,
                        value,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '${index + 1}',
                        style: TextStyle(
                          color: Color.lerp(
                            Colors.black54,
                            Colors.white,
                            value,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              // Connecting line
              if (!isLast)
                Expanded(
                  child: TweenAnimationBuilder<double>(
                    tween: Tween(
                      begin: 0.0,
                      end: isCompleted ? 1.0 : 0.0,
                    ),
                    duration: const Duration(milliseconds: 300),
                    builder: (context, value, child) {
                      return Container(
                        height: 2,
                        color: Color.lerp(
                          Colors.grey[300],
                          Theme.of(context).primaryColor,
                          value,
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),
        );
      }),
    );
  }
}
