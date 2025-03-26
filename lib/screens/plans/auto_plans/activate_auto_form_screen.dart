import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/constants/route_constants.dart';
import 'package:genius_app/models/screen_prop_models/activate_auto_form_model.dart';
import 'package:genius_app/models/screen_prop_models/add_dependency_form_model.dart';
import 'package:genius_app/models/screen_prop_models/send_activation_email_model.dart';
import 'package:genius_app/screens/onboarding/phone_number_screen.dart';
import 'package:genius_app/screens/plans/health_plans/upload_dependant_image_screen.dart';
import 'package:genius_app/utils/custom_text_styles.dart';
import 'package:genius_app/utils/enum.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/animated_list_selector.dart';
import 'package:genius_app/widgets/custom_button.dart';
import 'package:genius_app/widgets/custom_date_picker.dart';
import 'package:genius_app/widgets/custom_dropdownfield.dart';
import 'package:genius_app/widgets/custom_list_dropdown_field.dart';
import 'package:genius_app/widgets/custom_text_field.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ActivateAutoFormScreen extends StatefulWidget {
  final ActivateAutoFormModel data;
  const ActivateAutoFormScreen({super.key, required this.data});

  @override
  State<ActivateAutoFormScreen> createState() => _ActivateAutoFormScreenState();
}

class _ActivateAutoFormScreenState extends State<ActivateAutoFormScreen> {
  String? phoneNumber;
  File? selectedImage;

  File? selectedImage2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.bgWhiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
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
                'Activate ${widget.data.autoPlan.description}',
                // widget.data.dependantType.name,
                fontSize: 20.sp,
                color: CustomColors.primaryGreenColor,
              ),
              verticalSpacer(8.h),
              mediumText(
                'Upload valid files and information about the vehicle.',
                fontSize: 14.sp,
                color: CustomColors.primaryGreenColor,
              ),
              verticalSpacer(43.h),
              Container(
                decoration: BoxDecoration(
                  color: CustomColors.whiteColor,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: CustomColors.grey100Color,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black
                          .withOpacity(0.005), // Subtle shadow color
                      blurRadius: 2, // Softness of the shadow
                      spreadRadius: 1, // Slight expansion
                      offset: Offset(0, 1), // Vertical movement of the shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 14.h,
                    horizontal: 12.w,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            ConstantString.autoIcon,
                            height: 30,
                          ),
                        ],
                      ),
                      verticalSpacer(28.h),
                      ActivateAutoRow(
                        title1: 'Cover Period',
                        subtitle1:
                            widget.data.autoPlan == AutoPlans.comprehensiveAuto
                                ? 'Monthly'
                                : 'Annual',
                        title2: 'Category',
                        subtitle2: 'Private',
                      ),
                      ActivateAutoRow(
                        title1: 'Type',
                        subtitle1: 'Saloon',
                        title2: 'Manufacturer',
                        subtitle2: 'Tesla',
                      ),
                      ActivateAutoRow(
                        title1: 'Vehicle’s worth',
                        subtitle1: 'Monthly',
                        subtitle1Body: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: "₦",
                                  style: TextStyle(
                                    fontFamily: '',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.sp,
                                    color: CustomColors.blackTextColor,
                                  )),
                              TextSpan(
                                text: '100,000,000',
                                style: CustomTextStyles.semiBold(
                                  fontSize: 14.sp,
                                  color: CustomColors.blackTextColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        title2: 'Model',
                        subtitle2: 'Model X',
                      )
                    ],
                  ),
                ),
              ),
              verticalSpacer(24.h),
              Row(
                children: [
                  mediumText(
                    'Vehicle license',
                    fontSize: 16.sp,
                    color: CustomColors.greenTextColor,
                  ),
                ],
              ),
              verticalSpacer(12.sp),
              GestureDetector(
                onTap: () async {
                  if (selectedImage != null) {
                    setState(() {
                      selectedImage = null;
                    });
                  } else {
                    selectedImage = await selectImage(ImageSource.gallery);
                    if (selectedImage != null) {
                      setState(() {});
                    }
                  }
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: DottedBorder(
                    // color: CustomColors.gray200Color,
                    // dashPattern: const [10, 10],
                    // borderType: BorderType.RRect,
                    // radius: const Radius.circular(5),
                    // padding: EdgeInsets.zero,
                    color: CustomColors.gray200Color,
                    dashPattern: const [10, 3],
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(8),
                    padding: EdgeInsets.all(1), // Try adding a small padding
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: CustomColors.grey50Color,
                        borderRadius: BorderRadius.circular(8),
                        // border: Border.all(
                        //   width: 8,
                        //   color: CustomColors.grey50Color,
                        // )
                      ),
                      child: SizedBox(
                        height: 68.h,
                        // decoration: BoxDecoration(
                        //   color: CustomColors.whiteColor,
                        //   borderRadius: BorderRadius.circular(8),
                        // ),
                        child: selectedImage != null
                            ? Padding(
                                padding: EdgeInsets.symmetric(vertical: 0.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      ConstantString.pdfIcon,
                                    ),
                                    horizontalSpacer(12.w),
                                    mediumText(
                                      'Tap to upload',
                                      fontSize: 14.sp,
                                      color: CustomColors.grey600Color,
                                    ),
                                    horizontalSpacer(8.w),
                                    SvgPicture.asset(
                                      ConstantString.trashIconOutline,
                                    ),
                                  ],
                                ),
                              )
                            : Padding(
                                padding: EdgeInsets.symmetric(vertical: 0.h),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      ConstantString.smallUploadIcon,
                                    ),
                                    verticalSpacer(8.h),
                                    mediumText(
                                      'Tap to upload',
                                      fontSize: 14.sp,
                                      color: CustomColors.grey600Color,
                                    ),
                                  ],
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
              ),
              verticalSpacer(24.h),
              Row(
                children: [
                  mediumText(
                    'Proof of ownership',
                    fontSize: 16.sp,
                    color: CustomColors.greenTextColor,
                  ),
                ],
              ),
              verticalSpacer(12.sp),
              GestureDetector(
                onTap: () async {
                  if (selectedImage2 != null) {
                    setState(() {
                      selectedImage2 = null;
                    });
                  } else {
                    selectedImage2 = await selectImage(ImageSource.gallery);
                    if (selectedImage2 != null) {
                      setState(() {});
                    }
                  }
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: DottedBorder(
                    // color: CustomColors.gray200Color,
                    // dashPattern: const [10, 10],
                    // borderType: BorderType.RRect,
                    // radius: const Radius.circular(5),
                    // padding: EdgeInsets.zero,
                    color: CustomColors.gray200Color,
                    dashPattern: const [10, 3],
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(8),
                    padding: EdgeInsets.all(1), // Try adding a small padding
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: CustomColors.grey50Color,
                        borderRadius: BorderRadius.circular(8),
                        // border: Border.all(
                        //   width: 8,
                        //   color: CustomColors.grey50Color,
                        // )
                      ),
                      child: SizedBox(
                        height: 68.h,
                        // decoration: BoxDecoration(
                        //   color: CustomColors.whiteColor,
                        //   borderRadius: BorderRadius.circular(8),
                        // ),
                        child: selectedImage2 != null
                            ? Padding(
                                padding: EdgeInsets.symmetric(vertical: 0.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      ConstantString.pdfIcon,
                                    ),
                                    horizontalSpacer(12.w),
                                    mediumText(
                                      'Tap to upload',
                                      fontSize: 14.sp,
                                      color: CustomColors.grey600Color,
                                    ),
                                    horizontalSpacer(8.w),
                                    SvgPicture.asset(
                                      ConstantString.trashIconOutline,
                                    ),
                                  ],
                                ),
                              )
                            : Padding(
                                padding: EdgeInsets.symmetric(vertical: 0.h),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      ConstantString.smallUploadIcon,
                                    ),
                                    verticalSpacer(8.h),
                                    mediumText(
                                      'Tap to upload',
                                      fontSize: 14.sp,
                                      color: CustomColors.grey600Color,
                                    ),
                                  ],
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
              ),
              verticalSpacer(24.h),
              customTextFieldWithText(
                'chasisNumber',
                '0',
                title: 'Chassis Number',
                validator: FormBuilderValidators.compose(
                  [
                    FormBuilderValidators.required(
                        errorText: 'Chassis Number field cannot be empty '),
                  ],
                ),
              ),
              verticalSpacer(24.h),
              customTextFieldWithText(
                'engineNumer',
                '0',
                title: 'Engine Number',
                validator: FormBuilderValidators.compose(
                  [
                    FormBuilderValidators.required(
                        errorText: 'Engine Number field cannot be empty '),
                  ],
                ),
              ),
              verticalSpacer(24.h),
              customTextFieldWithText(
                'plateNumber',
                '0',
                title: 'Plate Number',
                validator: FormBuilderValidators.compose(
                  [
                    FormBuilderValidators.required(
                        errorText: 'Plate Number field cannot be empty '),
                  ],
                ),
              ),
              verticalSpacer(24.h),
              customTextFieldWithText(
                'vehicleColor',
                'Enter colour',
                title: 'Vehicle Colour',
                validator: FormBuilderValidators.compose(
                  [
                    FormBuilderValidators.required(
                        errorText: 'Vehicle Colour field cannot be empty '),
                  ],
                ),
              ),
              verticalSpacer(24.h),
              customTextFieldWithText(
                'manufactureYear',
                'YYYY',
                title: 'Year of Manufacture',
                validator: FormBuilderValidators.compose(
                  [
                    FormBuilderValidators.required(
                        errorText:
                            'Year of Manufacture field cannot be empty '),
                  ],
                ),
              ),
              verticalSpacer(48.h),
              CustomButton(
                title: 'Continue',
                onTap:
                    // phoneNumber == null
                    //     ? null
                    //     :
                    () {
                  context.pushNamed(
                    RouteConstants.secondActivateAutoFormScreen,
                  );
                  // context.pop();
                  // if (widget.data.autoPlan == NewDependantType.noUniqueEmail) {
                  //   context.pushNamed(
                  //     RouteConstants.uploadDependantImageScreen,
                  //   );
                  // } else {
                  //   context.pushNamed(
                  //     RouteConstants.sendActivationEmailScreen,
                  //     // extra: SendActivationEmailModel(
                  //     //   // dependantType: widget.data.dependantType,
                  //     // ),
                  //   );
                  // }
                },
              ),
              verticalSpacer(MediaQuery.of(context).padding.bottom + 48.h),
            ],
          ),
        ),
      ),
    );
  }
}

class ActivateAutoRow extends StatelessWidget {
  final String title1, title2, subtitle1, subtitle2;
  final Widget? subtitle1Body, subtitle2Body;
  const ActivateAutoRow({
    super.key,
    required this.title1,
    required this.title2,
    required this.subtitle1,
    required this.subtitle2,
    this.subtitle1Body,
    this.subtitle2Body,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              regularText(
                title1,
                fontSize: 12.sp,
                color: CustomColors.blackTextColor,
              ),
              subtitle1Body ??
                  semiBoldText(
                    subtitle1,
                    fontSize: 14.sp,
                    color: CustomColors.blackTextColor,
                  ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              regularText(
                title2,
                fontSize: 12.sp,
                color: CustomColors.blackTextColor,
              ),
              subtitle2Body ??
                  semiBoldText(
                    subtitle2,
                    fontSize: 14.sp,
                    color: CustomColors.blackTextColor,
                  ),
            ],
          ),
        ],
      ),
    );
  }
}
