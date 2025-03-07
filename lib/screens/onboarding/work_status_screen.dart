import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/constants/route_constants.dart';
import 'package:genius_app/utils/enum.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_button.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:genius_app/widgets/single_list_options_container.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WorkStatusScreen extends StatefulHookConsumerWidget {
  final VoidCallback onNext, nextTwoStep;
  const WorkStatusScreen(
      {super.key, required this.onNext, required this.nextTwoStep});

  @override
  ConsumerState<WorkStatusScreen> createState() => _WorkStatusScreenState();
}

class _WorkStatusScreenState extends ConsumerState<WorkStatusScreen> {
  WorkStatus? workStatus;
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
                    'What best describes your work status?',
                    fontSize: 20.sp,
                    color: CustomColors.green400Color,
                  ),
                  verticalSpacer(48.h),

                  SingleListOptionsContainer(
                    title: "A staff of a business",
                    icon: ConstantString.untickedSquare,
                    selectedIcon: ConstantString.tickSquare,
                    isSelected: workStatus == WorkStatus.businessStaff,
                    onTap: () => setState(() {
                      workStatus = WorkStatus.businessStaff;
                    }),
                  ),
                  verticalSpacer(20.h),
                  SingleListOptionsContainer(
                    title: "Entrepreneur",
                    icon: ConstantString.untickedSquare,
                    selectedIcon: ConstantString.tickSquare,
                    isSelected: workStatus == WorkStatus.entrepreneur,
                    onTap: () => setState(() {
                      workStatus = WorkStatus.entrepreneur;
                    }),
                  ),
                  verticalSpacer(20.h),
                  SingleListOptionsContainer(
                    title: "Freelancer",
                    icon: ConstantString.untickedSquare,
                    selectedIcon: ConstantString.tickSquare,
                    isSelected: workStatus == WorkStatus.freelancer,
                    onTap: () => setState(() {
                      workStatus = WorkStatus.freelancer;
                    }),
                  ),
                  verticalSpacer(20.h),
                  SingleListOptionsContainer(
                    title: "Student",
                    icon: ConstantString.untickedSquare,
                    selectedIcon: ConstantString.tickSquare,
                    isSelected: workStatus == WorkStatus.student,
                    onTap: () => setState(() {
                      workStatus = WorkStatus.student;
                    }),
                  ),
                  verticalSpacer(20.h),
                  SingleListOptionsContainer(
                    title: "Others (specify)",
                    icon: ConstantString.untickedSquare,
                    selectedIcon: ConstantString.tickSquare,
                    isSelected: workStatus == WorkStatus.others,
                    onTap: () => setState(() {
                      workStatus = WorkStatus.others;
                    }),
                  ),
                  verticalSpacer(10),
//
                  Spacer(),
                  CustomButton(
                    title: 'Continue',
                    onTap: workStatus == null
                        ? null
                        : () {
                            ref
                                .read(selectedWorkStatusProvider.notifier)
                                .state = workStatus;

                            if (ref.watch(selectedWorkStatusProvider) ==
                                    WorkStatus.student ||
                                ref.watch(selectedWorkStatusProvider) ==
                                    WorkStatus.others) {
                              widget.nextTwoStep();
                            } else {
                              widget.onNext();
                            }

                            // context.pushNamed(
                            //   RouteConstants.phoneNumberScreen,
                            // );
                          },
                  ),
                  verticalSpacer(12.h),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        context.goNamed(
                          RouteConstants.bottomNavigationScreen,
                        );
                      },
                      child: semiBoldText(
                        'Explore the genius app',
                        fontSize: 16.sp,
                        color: CustomColors.green500Color,
                      ),
                    ),
                  ),

                  // verticalSpacer(MediaQuery.of(context).padding.bottom + 20),
                  Spacer(),

                  // verticalSpacer(MediaQuery.of(context).padding.bottom + 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final selectedWorkStatusProvider = StateProvider<WorkStatus?>((ref) => null);
