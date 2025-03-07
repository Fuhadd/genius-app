// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:genius_app/constants/custom_colors.dart';
// import 'package:genius_app/utils/spacers.dart';
// import 'package:genius_app/widgets/custom_text_widget.dart';
// import 'dart:math' show pi;

// class FlipCard extends StatefulWidget {
//   final String title;
//   final List<String> workLists;

//   const FlipCard({
//     super.key,
//     required this.title,
//     required this.workLists,
//   });

//   @override
//   State<FlipCard> createState() => _FlipCardState();
// }

// class _FlipCardState extends State<FlipCard>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;
//   bool _isFrontVisible = true;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 800),
//     );

//     _animation = TweenSequence<double>([
//       TweenSequenceItem(
//         tween: Tween(begin: 0.0, end: pi / 2)
//             .chain(CurveTween(curve: Curves.easeInOut)),
//         weight: 50,
//       ),
//       TweenSequenceItem(
//         tween: Tween(begin: pi / 2, end: pi)
//             .chain(CurveTween(curve: Curves.easeInOut)),
//         weight: 50,
//       ),
//     ]).animate(_controller);

//     _animation.addListener(() {
//       if (_animation.value >= pi / 2) {
//         setState(() {
//           _isFrontVisible = false;
//         });
//       } else {
//         setState(() {
//           _isFrontVisible = true;
//         });
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   void _flipCard() {
//     if (_controller.status == AnimationStatus.dismissed) {
//       _controller.forward();
//     } else {
//       _controller.reverse();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: _flipCard,
//       child: AnimatedBuilder(
//         animation: _animation,
//         builder: (context, child) {
//           return Transform(
//             alignment: Alignment.center,
//             transform: Matrix4.identity()
//               ..setEntry(3, 2, 0.001)
//               ..rotateY(_animation.value),
//             child: SizedBox(
//               height: 156.h,
//               width: 156.w,
//               child: _isFrontVisible
//                   ? // Front side
//                   Container(
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: CustomColors.formBgColor,
//                       ),
//                       child: Center(
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                           child: w500Text(
//                             widget.title,
//                             fontSize: 16.sp,
//                             textAlign: TextAlign.center,
//                             color: CustomColors.blackTextColor,
//                           ),
//                         ),
//                       ),
//                     )
//                   : // Back side (reversed to appear correct after flip)
//                   Transform(
//                       alignment: Alignment.center,
//                       transform: Matrix4.identity()..rotateY(pi),
//                       child: Container(
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           border: Border.all(
//                             color: CustomColors.green200Color,
//                             width: 1.32,
//                           ),
//                           color: CustomColors.green50Color,
//                         ),
//                         child: Stack(
//                           children: [
//                             Positioned(
//                               right: 25,
//                               top: 10,
//                               child: Icon(
//                                 Icons.check_circle,
//                                 size: 22,
//                                 color: CustomColors.green500Color,
//                               ),
//                             ),
//                             Center(
//                               child: Padding(
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 20.0),
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     // Dynamic list items
//                                     ...widget.workLists.map((item) {
//                                       return Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: [
//                                           Icon(
//                                             Icons.circle,
//                                             size: 8,
//                                             color: CustomColors.green500Color,
//                                           ),
//                                           horizontalSpacer(5),
//                                           Expanded(
//                                             child: w500Text(
//                                               item, // Use item from the list
//                                               fontSize: 14.sp,
//                                               // textAlign: TextAlign.center,
//                                               color: CustomColors.green500Color,
//                                             ),
//                                           ),
//                                         ],
//                                       );
//                                     }),

//                                     Row(
//                                       children: [
//                                         w500Text(
//                                           'etc...',
//                                           fontSize: 14.sp,
//                                           // textAlign: TextAlign.center,
//                                           color: CustomColors.green500Color,
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'dart:math' show pi;

// Create a ValueNotifier to track the currently selected card
final ValueNotifier<String?> selectedCardNotifier =
    ValueNotifier<String?>(null);

class FlipCard extends StatefulWidget {
  final String title;
  final List<String> workLists;

  const FlipCard({
    super.key,
    required this.title,
    required this.workLists,
  });

  @override
  State<FlipCard> createState() => _FlipCardState();
}

class _FlipCardState extends State<FlipCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isFrontVisible = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _animation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(begin: 0.0, end: pi / 2)
            .chain(CurveTween(curve: Curves.easeInOut)),
        weight: 50,
      ),
      TweenSequenceItem(
        tween: Tween(begin: pi / 2, end: pi)
            .chain(CurveTween(curve: Curves.easeInOut)),
        weight: 50,
      ),
    ]).animate(_controller);

    _animation.addListener(() {
      if (_animation.value >= pi / 2) {
        setState(() {
          _isFrontVisible = false;
        });
      } else {
        setState(() {
          _isFrontVisible = true;
        });
      }
    });

    // Listen to changes in selected card
    selectedCardNotifier.addListener(_handleSelectionChange);
  }

  @override
  void dispose() {
    selectedCardNotifier.removeListener(_handleSelectionChange);
    _controller.dispose();
    super.dispose();
  }

  void _handleSelectionChange() {
    // If this card is not the selected one and it's flipped, flip it back
    if (selectedCardNotifier.value != widget.title && !_isFrontVisible) {
      _controller.reverse();
    }
  }

  void _flipCard() {
    if (_controller.status == AnimationStatus.dismissed) {
      // Update the selected card before flipping
      selectedCardNotifier.value = widget.title;
      _controller.forward();
    } else {
      selectedCardNotifier.value = null;
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _flipCard,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(_animation.value),
            child: SizedBox(
              height: 156.h,
              width: 156.w,
              child: _isFrontVisible
                  ? // Front side
                  Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: CustomColors.formBgColor,
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: mediumText(
                            widget.title,
                            fontSize: 16.sp,
                            textAlign: TextAlign.center,
                            color: CustomColors.blackTextColor,
                          ),
                        ),
                      ),
                    )
                  : // Back side (reversed to appear correct after flip)
                  Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()..rotateY(pi),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: CustomColors.green200Color,
                            width: 1.32,
                          ),
                          color: CustomColors.green50Color,
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              right: 25,
                              top: 10,
                              child: Icon(
                                Icons.check_circle,
                                size: 22,
                                color: CustomColors.green500Color,
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ...widget.workLists.map((item) {
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.circle,
                                            size: 8,
                                            color: CustomColors.green500Color,
                                          ),
                                          horizontalSpacer(5),
                                          Expanded(
                                            child: mediumText(
                                              item,
                                              fontSize: 14.sp,
                                              color: CustomColors.green500Color,
                                            ),
                                          ),
                                        ],
                                      );
                                    }),
                                    Row(
                                      children: [
                                        mediumText(
                                          'etc...',
                                          fontSize: 14.sp,
                                          color: CustomColors.green500Color,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
            ),
          );
        },
      ),
    );
  }
}
