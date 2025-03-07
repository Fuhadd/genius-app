import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/utils/custom_text_styles.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_button.dart';
import 'package:genius_app/widgets/custom_text_field.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

Future<dynamic> resendOtpBottomSheet(BuildContext context) {
  return showShadSheet(
    context: context,
    side: ShadSheetSide.bottom,
    builder: (context) {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        child: ShadSheet(
          radius: BorderRadius.vertical(top: Radius.circular(20)),
          padding: EdgeInsets.only(
            top: 30.h,
            left: 20.w,
            right: 20.w,
            // bottom: 20.h,
          ),
          closeIcon: SizedBox(),
          title:
              // semiBoldText(
              //     'Having trouble receiving the OTP via SMS? try WhatsApp',
              //     fontSize: 20.sp,
              //     color: CustomColors.green400Color),
              RichText(
            text: TextSpan(
              text: "Having trouble receiving the OTP via SMS? try WhatsApp ",
              style: CustomTextStyles.semiBold(
                  fontSize: 20.sp, color: CustomColors.green400Color),
              children: [
                WidgetSpan(
                  alignment: PlaceholderAlignment.baseline,
                  baseline: TextBaseline.alphabetic,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: SvgPicture.asset(
                      ConstantString.greenWhatsappIcon,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // description: const Text(
          //     "Make changes to your profile here. Click save when you're done"),
          // actions: const [
          //   ShadButton(child: Text('Save changes'))
          // ],
          child: Material(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  verticalSpacer(20),
                  mediumText('WhatsApp Number',
                      fontSize: 16.sp, color: CustomColors.greenTextColor),
                  verticalSpacer(20),
                  customTextField(
                    'phoneNumber',
                    'Enter your WhatsApp number',
                    validator: FormBuilderValidators.compose(
                      [
                        FormBuilderValidators.email(
                            errorText: 'Provided email not valid '),
                        FormBuilderValidators.required(
                            errorText: 'Email field cannot be empty '),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: SvgPicture.asset(
                              ConstantString.infoIcon,
                            ),
                          ),
                          horizontalSpacer(5),
                          mediumText(
                            'Ensure that this is your WhatsApp number',
                            fontSize: 14.sp,
                            color: CustomColors.grey700Color,
                          ),
                        ],
                      ),
                    ),
                  ),
                  verticalSpacer(50),
                  CustomButton(
                    title: 'Resend Code',
                    onTap: () {
                      context.pop();
                    },
                  ),
                  CustomButton(
                    title: 'Stick with SMS',
                    buttonColor: Colors.transparent,
                    textColor: CustomColors.green500Color,
                    onTap: () {
                      context.pop();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
