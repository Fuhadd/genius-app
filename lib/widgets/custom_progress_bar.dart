// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:genius_app/constants/custom_colors.dart';
// import 'package:genius_app/constants/custom_string.dart';
// import 'package:genius_app/utils/spacers.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:shadcn_ui/shadcn_ui.dart';

// class CustomProgressBar extends StatefulHookConsumerWidget {
//   final void Function()? onTap;
//   const CustomProgressBar({
//     super.key,
//     this.onTap,
//   });

//   @override
//   ConsumerState<CustomProgressBar> createState() => _CustomProgressBarState();
// }

// class _CustomProgressBarState extends ConsumerState<CustomProgressBar> {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         GestureDetector(
//           onTap: widget.onTap,
//           child: SvgPicture.asset(
//             ConstantString.backButtonIcon,
//           ),
//         ),
//         horizontalSpacer(10),
//         Expanded(
//           child: SizedBox(
//             height: 5,
//             child: ShadProgress(
//               value: ref.watch(onboardingProgressProvider),
//               backgroundColor: CustomColors.orange100Color,
//               color: CustomColors.orange500Color,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// final onboardingProgressProvider = StateProvider<double>((ref) => 0);

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class CustomProgressBar extends StatefulHookConsumerWidget {
  final void Function()? onTap;
  final double progress;

  const CustomProgressBar({
    super.key,
    this.onTap,
    required this.progress,
  });

  @override
  ConsumerState<CustomProgressBar> createState() => _CustomProgressBarState();
}

class _CustomProgressBarState extends ConsumerState<CustomProgressBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
      child: Row(
        children: [
          GestureDetector(
            onTap: widget.onTap,
            child: SvgPicture.asset(
              ConstantString.backButtonIcon,
            ),
          ),
          horizontalSpacer(10),
          Expanded(
            child: SizedBox(
              height: 5,
              child: ShadProgress(
                value: widget.progress,
                backgroundColor: CustomColors.orange100Color,
                color: CustomColors.orange500Color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
