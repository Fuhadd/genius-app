import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/route_constants.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/animated_flip_card.dart';
import 'package:genius_app/widgets/custom_button.dart';
import 'package:genius_app/widgets/custom_circular_flip_card.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RoutineScreen extends StatefulHookConsumerWidget {
  final VoidCallback onNext;
  const RoutineScreen({super.key, required this.onNext});

  @override
  ConsumerState<RoutineScreen> createState() => _RoutineScreenState();
}

class _RoutineScreenState extends ConsumerState<RoutineScreen> {
  List<String> selectedRoutines = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).padding.bottom + 10,
            left: 20,
            right: 20),
        child: CustomButton(
          title: 'Continue',
          onTap: () {
            // ref.read(onboardingProgressProvider.notifier).state = 0.2;
            context.goNamed(
              RouteConstants.bottomNavigationScreen,
            );
          },
        ),

        //  FloatingActionButton.extended(
        //   onPressed: () {
        //     context.pushNamed(RouteConstants.phoneNumberScreen);
        //   },
        //   label: Text('Continue'),
        //   icon: Icon(Icons.arrow_forward),
        //   backgroundColor: CustomColors.green500Color, // Customize as needed
        // ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
                    'WHAT’S YOUR VIBE? 🤗',
                    fontSize: 12.sp,
                    color: CustomColors.green500Color,
                  ),
                  verticalSpacer(15),

                  semiBoldText(
                    'Let’s get to know your routine',
                    fontSize: 20.sp,
                    color: CustomColors.green400Color,
                    height: 1.1,
                  ),
                  verticalSpacer(50),

                  // Wrap(
                  //   alignment: WrapAlignment.center,
                  //   runAlignment: WrapAlignment.center,
                  //   crossAxisAlignment: WrapCrossAlignment.center,
                  //   runSpacing: 5,
                  //   children: [
                  //     ...routines.map((item) {
                  //       return AnimatedFlipCard(
                  //         title: item,
                  //         frontChild: Padding(
                  //           padding:
                  //               const EdgeInsets.symmetric(horizontal: 10.0),
                  //           child: w500Text(
                  //             item,
                  //             fontSize: 16.sp,
                  //             color: CustomColors.blackTextColor,
                  //             textAlign: TextAlign.center,
                  //           ),
                  //         ),
                  //         backChild: Padding(
                  //           padding:
                  //               const EdgeInsets.symmetric(horizontal: 10.0),
                  //           child: w500Text(
                  //             item,
                  //             fontSize: 16.sp,
                  //             color: CustomColors.green500Color,
                  //             textAlign: TextAlign.center,
                  //           ),
                  //         ),
                  //       );
                  //     }),
                  //   ],
                  // ),
                  // ZigZagLayout(routines: routines),

                  // SizedBox(
                  //   width: double.infinity,
                  //   child: Stack(
                  //     children: [
                  //       Positioned(
                  //         left: 0,
                  //         right: 0,
                  //         child: AnimatedContainer(
                  //           duration: const Duration(milliseconds: 300),
                  //           height: 128.h,
                  //           width: 128.w,
                  //           decoration: BoxDecoration(
                  //             shape: BoxShape.circle,
                  //             color: CustomColors.formBgColor,
                  //             border: Border.all(
                  //                 color: CustomColors.grey100Color, width: 1),
                  //           ),
                  //           child: Center(
                  //             child: Padding(
                  //               padding: EdgeInsets.symmetric(horizontal: 10.0),
                  //               child: Padding(
                  //                 padding: const EdgeInsets.symmetric(
                  //                     horizontal: 10.0),
                  //                 child: mediumText(
                  //                   routines[0],
                  //                   fontSize: 15.sp,
                  //                   color: CustomColors.blackTextColor,
                  //                   textAlign: TextAlign.center,
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      runAlignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      runSpacing: 2,
                      children: [
                        for (int i = 0; i < routines.length; i++)
                          if (i % 3 == 0)
                            // Single item row
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AnimatedFlipCard(
                                  title: routines[i],
                                  size: 128,
                                  frontChild: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: mediumText(
                                      routines[i],
                                      fontSize: 15.sp,
                                      color: CustomColors.blackTextColor,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  isSelected:
                                      selectedRoutines.contains(routines[i]),
                                  backChild: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: mediumText(
                                      routines[i],
                                      fontSize: 15.sp,
                                      color: CustomColors.green500Color,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  onTap: () {
                                    if (selectedRoutines
                                        .contains(routines[i])) {
                                      selectedRoutines.removeWhere(
                                          (item) => item == routines[i]);
                                    } else {
                                      selectedRoutines.add(routines[i]);
                                    }
                                  },
                                ),
                              ],
                            )
                          else if (i % 3 == 1)
                            // Two items row
                            Row(
                              mainAxisAlignment: i + 1 < routines.length
                                  ? MainAxisAlignment.center
                                  : MainAxisAlignment.start,
                              children: [
                                AnimatedFlipCard(
                                  size: 128,
                                  title: routines[i],
                                  frontChild: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    child: Center(
                                      child: mediumText(
                                        routines[i],
                                        fontSize: 15.sp,
                                        color: CustomColors.blackTextColor,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  isSelected:
                                      selectedRoutines.contains(routines[i]),
                                  onTap: () {
                                    print(selectedRoutines);
                                    if (selectedRoutines
                                        .contains(routines[i])) {
                                      selectedRoutines.removeWhere(
                                          (item) => item == routines[i]);
                                    } else {
                                      selectedRoutines.add(routines[i]);
                                    }
                                    setState(() {});
                                  },
                                  backChild: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: mediumText(
                                      routines[i],
                                      fontSize: 15.sp,
                                      color: CustomColors.green500Color,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                if (i + 1 < routines.length)
                                  AnimatedFlipCard(
                                    size: 128,
                                    title: routines[i + 1],
                                    frontChild: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: mediumText(
                                        routines[i + 1],
                                        fontSize: 15.sp,
                                        color: CustomColors.blackTextColor,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    isSelected:
                                        selectedRoutines.contains(routines[i]),
                                    onTap: () {
                                      if (selectedRoutines
                                          .contains(routines[i])) {
                                        selectedRoutines.removeWhere(
                                            (item) => item == routines[i]);
                                      } else {
                                        selectedRoutines.add(routines[i]);
                                      }
                                    },
                                    backChild: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Center(
                                        child: mediumText(
                                          routines[i + 1],
                                          fontSize: 15.sp,
                                          color: CustomColors.green500Color,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                      ],
                    ),
                  ),
                  verticalSpacer(10),

                  // Spacer(),
                  // CustomButton(
                  //   title: 'Continue',
                  //   onTap: () {
                  //     // ref.read(onboardingProgressProvider.notifier).state = 0.2;
                  //     context.pushNamed(
                  //       RouteConstants.phoneNumberScreen,
                  //     );
                  //   },
                  // ),
                  // verticalSpacer(MediaQuery.of(context).padding.bottom + 20),
                  // Spacer(),

                  verticalSpacer(MediaQuery.of(context).padding.bottom + 20),
                ],
              ),
            ),

            /// FIXED BUTTON AT THE BOTTOM
            // Padding(
            //   padding: EdgeInsets.only(
            //     bottom: MediaQuery.of(context).padding.bottom + 20,
            //   ),
            //   child: CustomButton(
            //     title: 'Continue',
            //     onTap: () {
            //       context.pushNamed(RouteConstants.phoneNumberScreen);
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

List<String> routines = [
  'Health and fitness',
  'I travel a lot',
  'I go to the cinema',
  'I love music concerts',
  'Financial education',
  'Nutrition and dieting',
  'Fashion & Styling',
  'Tech & Gadgets',
  'Volunteering & Charity Work',
  'I own a car',
  'I own multiple cars',
];

class ZigZagLayout extends StatelessWidget {
  final List<String> routines;

  const ZigZagLayout({
    super.key,
    required this.routines,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;
        final itemWidth = 156.w;
        final spacing = 5.0;

        // Calculate how many items can fit in a row
        final itemsPerRow = (maxWidth / (itemWidth + spacing)).floor();

        // Create rows with proper alignment
        List<Widget> rows = [];
        for (int i = 0; i < routines.length; i += itemsPerRow) {
          final isOddRow = (i ~/ itemsPerRow) % 2 == 1;
          final rowItems = routines.skip(i).take(itemsPerRow).toList();

          // Add padding to create zigzag effect
          final rowPadding = isOddRow ? itemWidth / 2 : 0.0;

          rows.add(
            Padding(
              padding: EdgeInsets.only(left: rowPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: rowItems.map((item) {
                  return Padding(
                    padding: EdgeInsets.only(right: spacing),
                    child: CustomFlipCard(
                      title: item,
                      frontChild: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: mediumText(
                          item,
                          fontSize: 16.sp,
                          color: CustomColors.blackTextColor,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      backChild: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: mediumText(
                          item,
                          fontSize: 16.sp,
                          color: CustomColors.green500Color,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          );

          // Add vertical spacing between rows
          if (i + itemsPerRow < routines.length) {
            rows.add(SizedBox(height: spacing));
          }
        }

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: rows,
          ),
        );
      },
    );
  }
}
