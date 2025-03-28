import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/utils/custom_text_styles.dart';
import 'package:genius_app/utils/enum.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/animated_list_selector.dart';
import 'package:genius_app/widgets/custom_button.dart';
import 'package:genius_app/widgets/custom_text_field.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:go_router/go_router.dart';

class BuyDependantSlotScreen extends StatefulWidget {
  const BuyDependantSlotScreen({
    super.key,
  });

  @override
  State<BuyDependantSlotScreen> createState() => _BuyDependantSlotScreenState();
}

class _BuyDependantSlotScreenState extends State<BuyDependantSlotScreen> {
  bool isLoading = false;
  String amount = '0.00';

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
              'Buy dependant slot',
              fontSize: 20.sp,
              color: CustomColors.primaryGreenColor,
            ),
            verticalSpacer(8.h),
            mediumText(
              'Buy slots for new dependant(s) under your plan',
              fontSize: 14.sp,
              color: CustomColors.primaryGreenColor,
            ),
            verticalSpacer(43.h),
            customTextFieldWithText(
              'dependentNumber',
              '0',
              title: 'Number of dependants',
              validator: FormBuilderValidators.compose(
                [
                  FormBuilderValidators.required(
                      errorText: 'Email Address field cannot be empty '),
                ],
              ),
              onChanged: (p0) async {
                setState(() {
                  isLoading = true;
                });
                await Future.delayed(
                  Duration(seconds: 1),
                );

                setState(() {
                  amount = '3,500';
                  isLoading = false;
                });
              },
            ),
            Spacer(),
            Divider(
              color: CustomColors.grey100Color,
            ),
            verticalSpacer(24.h),
            Container(
              height: 61.h,
              decoration: BoxDecoration(
                  color: CustomColors.lightOrangeColor,
                  border: Border.all(color: CustomColors.orange200Color),
                  borderRadius: BorderRadius.circular(8.r)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  isLoading
                      ? CircularProgressIndicator.adaptive(
                          valueColor: AlwaysStoppedAnimation(
                              CustomColors.orange950Color),
                        )
                      : RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: "₦",
                                  style: TextStyle(
                                    fontFamily: '',
                                    fontWeight: FontWeight.w600,
                                    color: CustomColors.orange950Color,
                                    fontSize: 16.sp,
                                  )),
                              TextSpan(
                                text: amount,
                                style: CustomTextStyles.semiBold(
                                  color: CustomColors.orange950Color,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                ],
              ),
            ),
            verticalSpacer(48.h),
            CustomButton(
              title: 'Continue',
              onTap: (isLoading == true || amount == '0.00') ? null : () {},
            ),
            verticalSpacer(MediaQuery.of(context).padding.bottom + 40.h)
          ],
        ),
      ),
    );
  }
}
