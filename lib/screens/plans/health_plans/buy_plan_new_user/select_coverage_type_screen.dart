import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:go_router/go_router.dart';

class SelectCoverageTypeScreen extends StatefulWidget {
  const SelectCoverageTypeScreen({super.key});

  @override
  State<SelectCoverageTypeScreen> createState() => _SelectCoverageTypeScreenState();
}

class _SelectCoverageTypeScreenState extends State<SelectCoverageTypeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.bgWhiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpacer(MediaQuery.of(context).padding.top + 20.h),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: SvgPicture.asset(
                    ConstantString.backButtonIcon,
                  ),
                ),
              ],
            ),
            verticalSpacer(23.h),
            semiBoldText(
              'FlexiCare',
              fontSize: 20.sp,
              color: CustomColors.primaryGreenColor,
            ),
            verticalSpacer(8.h),
            mediumText(
              'Covers you and your loved ones',
              fontSize: 14.sp,
              color: CustomColors.primaryGreenColor,
            ),
            verticalSpacer(43.h),
          ],
        ),
      ),
    );
  }
}
