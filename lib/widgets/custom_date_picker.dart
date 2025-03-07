import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/utils/custom_text_styles.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// ignore: must_be_immutable
class CustomMiniDatePicker extends StatefulHookConsumerWidget {
  final String label, description;
  final bool isTodayMax;
  final int? minDate;

  final AutoDisposeStateProvider<String?> selectedDate;
  const CustomMiniDatePicker({
    super.key,
    required this.label,
    required this.description,
    required this.isTodayMax,
    this.minDate,
    required this.selectedDate,
  });

  @override
  ConsumerState<CustomMiniDatePicker> createState() =>
      _CustomMiniDatePickerState();
}

class _CustomMiniDatePickerState extends ConsumerState<CustomMiniDatePicker> {
  Timer? debounce;
  @override
  Widget build(BuildContext context) {
    var today = DateTime.now();
    var maxDate = widget.isTodayMax ? today : DateTime(3000);
    var minDate = widget.minDate == null
        ? DateTime(1000)
        : today.subtract(Duration(days: widget.minDate!));

    DateTime initialDate = today;

    return GestureDetector(
      onTap: () async {
        FocusScope.of(context).unfocus();
        final date = await showDatePicker(
          context: context,
          initialDate: initialDate,
          firstDate: minDate,
          lastDate: maxDate,
          builder: (BuildContext context, Widget? child) {
            return Theme(
              data: customDatePickerTheme,
              child: child!,
            );
          },
        );

        if (date != null) {
          setState(() {
            ref.read(widget.selectedDate.notifier).state =
                date.toString().substring(0, 10);
          });
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              mediumText(
                widget.label,
                fontSize: 14.sp,
                color: CustomColors.greenTextColor,
              ),
            ],
          ),
          verticalSpacer(12.sp),
          Container(
            width: double.infinity,
            height: 46,
            decoration: BoxDecoration(
              color: CustomColors.formBgColor,
              border: Border.all(
                color: CustomColors.grey100Color,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: ref.watch(widget.selectedDate) == null
                        ? Text(
                            widget.description,
                            style: CustomTextStyles.medium(
                              fontSize: 16.sp,
                              color: CustomColors.grey600Color,
                            ),
                          )
                        : Text(
                            ref.watch(widget.selectedDate)!,
                            style: CustomTextStyles.semiBold(
                              fontSize: 16.sp,
                              color: CustomColors.greenTextColor,
                            ),
                          ),
                  ),
                  SvgPicture.asset(
                    ConstantString.calendarIcon,
                  ),
                ],
              ),
            ),
          ),
          // verticalSpacer(25.sp),
        ],
      ),
    );
  }
}

final ThemeData customDatePickerTheme = ThemeData(
  colorScheme: ColorScheme.light(
      primary: CustomColors.green500Color, // Header background color
      onPrimary: Colors.white, // Header text color
      onSurface: Colors.black),
  dialogBackgroundColor: Colors.white, // Background color of the dialog

  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: CustomColors.green500Color, // Button text color
    ),
  ),
  // timePickerTheme: TimePickerThemeData(
  //   backgroundColor: CustomColors.primaryBrandColor(), // Background color
  //   hourMinuteColor: MaterialStateColor.resolveWith((states) =>
  //       states.contains(MaterialState.selected)
  //           ? CustomColors.primaryBrandColor()
  //           : Colors.transparent), // Selected hour/minute background color

  //   hourMinuteTextColor: MaterialStateColor.resolveWith(
  //       (states) => states.contains(MaterialState.selected)
  //           ? Colors.white
  //           : states.contains(MaterialState.disabled)
  //               ? Colors.grey
  //               : Colors.black), // Selected hour/minute text color

  //   dialHandColor: CustomColors.primaryBrandColor(), // Dial hand color
  //   dialBackgroundColor: Colors.white, // Dial background color
  //   entryModeIconColor: Colors.white, // Entry mode icon color
  //   helpTextStyle: const TextStyle(color: Colors.black), // Help text style
  //   hourMinuteTextStyle:
  //       const TextStyle(color: Colors.black), // Hour/Minute text style
  //   dayPeriodTextStyle:
  //       const TextStyle(color: Colors.black), // AM/PM text style
  //   dayPeriodColor: MaterialStateColor.resolveWith((states) =>
  //       states.contains(MaterialState.selected)
  //           ? CustomColors.primaryBrandColor()
  //           : Colors.transparent), // AM/PM selector background color
  //   shape: RoundedRectangleBorder(
  //     borderRadius: BorderRadius.circular(8.0), // Adjust as needed
  //   ),
  //   elevation: 0,
  // ),

  datePickerTheme: DatePickerThemeData(
    headerBackgroundColor:
        CustomColors.green500Color, // Header background color
    headerForegroundColor: Colors.white, // Header text color
    dayBackgroundColor: WidgetStateColor.resolveWith((states) =>
        states.contains(WidgetState.selected)
            ? CustomColors.green500Color
            : Colors.transparent), // Selected day background color

    dayForegroundColor: WidgetStateColor.resolveWith(
        (states) => states.contains(WidgetState.selected)
            ? Colors.white
            : states.contains(WidgetState.disabled)
                ? Colors.grey
                : Colors.black), // Selected day text color

    weekdayStyle: const TextStyle(color: Colors.black), // Weekday text color
    dayStyle: const TextStyle(color: Colors.black),

    // disabledDayForegroundColor: Colors.grey, // Disabled day text color
    // disabledDayBackgroundColor: Colors.transparent,
    elevation: 0,
  ),
);
