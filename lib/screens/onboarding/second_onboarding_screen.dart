import 'package:flutter/material.dart';
import 'package:genius_app/screens/onboarding/family_status_screen.dart';
import 'package:genius_app/screens/onboarding/gender_select_screen.dart';
import 'package:genius_app/screens/onboarding/insurance_type_screen.dart';
import 'package:genius_app/screens/onboarding/routine_screen.dart';
import 'package:genius_app/screens/onboarding/work_status_screen.dart';
import 'package:genius_app/screens/onboarding/work_type_screen.dart';
import 'package:genius_app/utils/enum.dart';
import 'package:genius_app/widgets/custom_progress_bar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SecondOnboardingScreen extends StatefulHookConsumerWidget {
  const SecondOnboardingScreen({super.key});

  @override
  ConsumerState<SecondOnboardingScreen> createState() =>
      _SecondOnboardingScreenState();
}

class _SecondOnboardingScreenState
    extends ConsumerState<SecondOnboardingScreen> {
  int _currentStep = 0;
  final int _totalSteps = 6;

  void nextStep() {
    if (_currentStep < _totalSteps - 1) {
      setState(() {
        _currentStep++;
      });
    }
  }

  void nextTwoStep() {
    if (_currentStep < _totalSteps - 1) {
      setState(() {
        _currentStep = _currentStep + 2;
      });
    }
  }

  void _previousTwoStep() {
    if (_currentStep > 0) {
      setState(() {
        // _currentStep--;
        _currentStep = _currentStep - 2;
      });
    }
  }

  void _previousStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
      });
    }
  }

  // Define your step content widgets

  @override
  Widget build(BuildContext context) {
    final progressValue = ((_currentStep + 1) + 4) / (10); //_totalSteps
    final List<Widget> steps = [
      InsuranceTypeScreen(onNext: nextStep),
      GenderSelectScreen(onNext: nextStep),
      WorkStatusScreen(
        onNext: nextStep,
        nextTwoStep: nextTwoStep,
      ),
      WorkTypeScreen(onNext: nextStep),
      FamilyStatusScreen(onNext: nextStep),
      RoutineScreen(onNext: nextStep),
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
              onTap: _currentStep > 0
                  ? ref.watch(selectedWorkStatusProvider) ==
                              WorkStatus.student ||
                          ref.watch(selectedWorkStatusProvider) ==
                              WorkStatus.others
                      ? _previousTwoStep
                      : _previousStep
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
