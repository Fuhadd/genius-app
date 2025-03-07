import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/constants/route_constants.dart';
import 'package:genius_app/models/screen_prop_models/add_dependency_form_model.dart';
import 'package:genius_app/utils/enum.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/animated_list_selector.dart';
import 'package:genius_app/widgets/custom_button.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:go_router/go_router.dart';

class AddDependantScreen extends StatefulWidget {
  const AddDependantScreen({
    super.key,
  });

  @override
  State<AddDependantScreen> createState() => _AddDependantScreenState();
}

class _AddDependantScreenState extends State<AddDependantScreen> {
  NewDependantType? dependantType;

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
              'Add Dependant',
              fontSize: 20.sp,
              color: CustomColors.primaryGreenColor,
            ),
            verticalSpacer(8.h),
            mediumText(
              'Choose a dependant policy type',
              fontSize: 14.sp,
              color: CustomColors.primaryGreenColor,
            ),
            verticalSpacer(43.h),
            ListOptionsContainer(
              title: "",
              subTitle: "",
              content:
                  'Dependant has a unique email and phone number and can manage their policy.',
              icon: ConstantString.roundProfileIcon,
              selectedIcon: ConstantString.roundProfileIcon,
              isSelected: dependantType == NewDependantType.uniqueEmail,
              verticalPadding: 30.h,
              selectedIconColor: CustomColors.purple500Color,
              unSelectedIconColor: CustomColors.grey400Color,
              onTap: () => setState(() {
                dependantType = NewDependantType.uniqueEmail;
              }),
            ),
            verticalSpacer(24.h),
            ListOptionsContainer(
              title: "",
              subTitle: "",
              content:
                  'Dependant has no unique email or phone number and cannot manage their policy.',
              icon: ConstantString.groupProfileIcon,
              selectedIcon: ConstantString.groupProfileIcon,
              verticalPadding: 30.h,
              isSelected: dependantType == NewDependantType.noUniqueEmail,
              selectedIconColor: CustomColors.pink400Color,
              onTap: () => setState(() {
                dependantType = NewDependantType.noUniqueEmail;
              }),
            ),
            Spacer(),
            CustomButton(
              title: 'Continue',
              onTap: dependantType == null
                  ? null
                  : () {
                      // context.pop();
                      context.pushNamed(
                        RouteConstants.addDependantFormScreen,
                        extra: AddDependencyFormModel(
                          dependantType: dependantType!,
                        ),
                      );
                    },
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
