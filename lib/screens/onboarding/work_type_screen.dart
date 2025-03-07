import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/screens/onboarding/work_status_screen.dart';
import 'package:genius_app/utils/enum.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/circular_flip_card.dart';
import 'package:genius_app/widgets/custom_button.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WorkTypeScreen extends StatefulHookConsumerWidget {
  final VoidCallback onNext;
  const WorkTypeScreen({super.key, required this.onNext});

  @override
  ConsumerState<WorkTypeScreen> createState() => _WorkTypeScreenState();
}

class _WorkTypeScreenState extends ConsumerState<WorkTypeScreen> {
  String? selectedWorkType;
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
                    'Tell us about the type of work you do',
                    fontSize: 20.sp,
                    color: CustomColors.green400Color,
                  ),
                  verticalSpacer(48.h),

                  Wrap(
                    alignment: WrapAlignment.center,
                    runAlignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runSpacing: 32.h,
                    spacing: 23.w,
                    children: [
                      ...(getWorkDetails(
                              ref.watch(selectedWorkStatusProvider) ??
                                  WorkStatus.student))
                          .map((item) {
                        return FlipCard(
                          title: item.workType,
                          workLists: item.workList,
                        );
                      }),
                    ],
                  ),

                  verticalSpacer(10),

                  Spacer(),
                  CustomButton(
                    title: 'Continue',
                    onTap: () {
                      widget.onNext();
                      // ref.read(onboardingProgressProvider.notifier).state = 0.2;
                      // context.pushNamed(
                      //   RouteConstants.phoneNumberScreen,
                      // );
                    },
                  ),
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

class WorkDetailsModel {
  final String workType;
  final List<String> workList;

  WorkDetailsModel({
    required this.workType,
    required this.workList,
  });
}

List<WorkDetailsModel> getWorkDetails(WorkStatus workStatus) {
  switch (workStatus) {
    case WorkStatus.businessStaff:
      return [
        WorkDetailsModel(
          workType: 'I work for a tech organization',
          workList: [
            'Operations',
            'Designers',
            'Marketing',
          ],
        ),
        WorkDetailsModel(
          workType: 'I work in a non-tech organization',
          workList: [
            'Sales agent',
            'Specialist',
          ],
        )
      ];
    case WorkStatus.entrepreneur:
      return [
        WorkDetailsModel(
          workType: 'SME business owner',
          workList: [
            'Operations',
            'Designers',
            'Marketing',
          ],
        ),
        WorkDetailsModel(
          workType: 'Startup founder',
          workList: [
            'Operations',
            'Designers',
            'Marketing',
          ],
        )
      ];
    case WorkStatus.freelancer:
      return [
        WorkDetailsModel(
          workType: 'Cinematography',
          workList: [
            'Photographer',
            'Video editor',
          ],
        ),
        WorkDetailsModel(
          workType: 'Gig worker',
          workList: [
            'Artisans',
            'Delivery agents',
            'Designers',
          ],
        ),
        WorkDetailsModel(
          workType: 'Creative freelancer',
          workList: [
            'Content creator',
            'Artists',
          ],
        ),
        WorkDetailsModel(
          workType: 'Tech freelancer',
          workList: [
            'Software engineer',
            'Designers',
            'Data analyst',
          ],
        ),
        WorkDetailsModel(
          workType: 'Non-tech contractor',
          workList: [
            'Sales agent',
            'Specialist',
          ],
        )
      ];
    case WorkStatus.student:
      return [];
    case WorkStatus.others:
      return [];
  }
}
