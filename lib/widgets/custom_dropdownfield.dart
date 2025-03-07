import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

// final fruits = {
//   'apple': 'Apple',
//   'banana': 'Banana',
//   'blueberry': 'Blueberry',
//   'grapes': 'Grapes',
//   'pineapple': 'Pineapple',
// };

class CustomDropdownfield extends StatelessWidget {
  final String title, label;
  final Map<String, String> options;
  const CustomDropdownfield({
    super.key,
    required this.options,
    required this.title,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            mediumText(
              title,
              fontSize: 16.sp,
              color: CustomColors.greenTextColor,
            ),
          ],
        ),
        verticalSpacer(12.sp),
        SizedBox(
          width: double.infinity,
          height: 60.h,
          child: ShadSelect<String>(
            placeholder: mediumText(
              label,
              fontSize: 16.sp,
              color: CustomColors.grey600Color,
            ),
            options: [
              mediumText(
                title,
                fontSize: 16.sp,
                color: CustomColors.greenTextColor,
              ),
              verticalSpacer(12.sp),
              ...options.entries
                  .map((e) => ShadOption(value: e.key, child: Text(e.value))),
            ],
            selectedOptionBuilder: (context, value) => Text(options[value]!),
            onChanged: print,
          ),
        ),
      ],
    );
  }
}
