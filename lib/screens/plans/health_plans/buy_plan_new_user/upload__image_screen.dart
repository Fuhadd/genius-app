import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/constants/route_constants.dart';
import 'package:genius_app/models/screen_prop_models/send_activation_email_model.dart';
import 'package:genius_app/utils/enum.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_button.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class UploadImageScreen extends StatefulWidget {
  const UploadImageScreen({
    super.key,
  });

  @override
  State<UploadImageScreen> createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen>
    with SingleTickerProviderStateMixin {
  VerificationMode selectedVerificationMode = VerificationMode.sms;
  String? phoneNumber;
  late TabController _tabController;
  File? selectedImage;
  File? uploadedImage;

  @override
  void initState() {
    _tabController = TabController(
      length: 2,
      vsync: this,
    );

    super.initState();
  }

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
              'Activate FlexiCare Plan',
              fontSize: 20.sp,
              color: CustomColors.primaryGreenColor,
            ),
            verticalSpacer(8.h),
            mediumText(
              'Upload or take a clear image of yourself.',
              fontSize: 14.sp,
              color: CustomColors.primaryGreenColor,
            ),
            verticalSpacer(43.h),
            Container(
              height: 46.h,
              constraints: const BoxConstraints(maxWidth: 400, minHeight: 48),
              decoration: BoxDecoration(
                color: CustomColors.formBgColor,
                borderRadius: BorderRadius.circular(60),
              ),
              child: TabBar(
                controller: _tabController,
                overlayColor: WidgetStateProperty.all(Colors.transparent),
                dividerHeight: 0,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  // You can adjust the indicator color as needed.
                  color: Colors.white,
                ),
                labelPadding: EdgeInsets.zero,
                padding: EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 4,
                ),
                onTap: (int mode) {
                  print(mode);
                  setState(() {
                    selectedVerificationMode = mode == 0
                        ? VerificationMode.sms
                        : VerificationMode.whatsapp;
                    // phoneNumber = null;
                  });
                },
                tabs: [
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        selectedVerificationMode == VerificationMode.sms
                            ? semiBoldText(
                                'Upload image',
                                fontSize: 14.sp,
                                color: selectedVerificationMode ==
                                        VerificationMode.sms
                                    ? CustomColors.blackTextColor
                                    : CustomColors.grey500Color,
                              )
                            : mediumText(
                                'Upload image',
                                fontSize: 14.sp,
                                color: CustomColors.grey500Color,
                              ),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        selectedVerificationMode == VerificationMode.whatsapp
                            ? semiBoldText(
                                'Use camera',
                                fontSize: 14.sp,
                                color: selectedVerificationMode ==
                                        VerificationMode.whatsapp
                                    ? CustomColors.blackTextColor
                                    : CustomColors.grey500Color,
                              )
                            : mediumText(
                                'Use camera',
                                fontSize: 14.sp,
                                color: CustomColors.grey500Color,
                              ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Content for the SMS tab.
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        verticalSpacer(32.h),
                        // DottedBorder(
                        //   color: CustomColors.gray200Color,
                        //   dashPattern: const [10, 10],
                        //   borderType: BorderType.RRect,
                        //   radius: const Radius.circular(5),
                        //   padding: EdgeInsets.zero,
                        //   child: ClipRRect(
                        //     borderRadius: BorderRadiusDirectional.circular(5),
                        //     child: Container(
                        //       width: double.infinity,
                        //       // height: 46,
                        //       decoration: BoxDecoration(
                        //         color: CustomColors.whiteColor,
                        //         borderRadius: BorderRadius.circular(5),
                        //       ),
                        //       child: Padding(
                        //           padding: const EdgeInsets.symmetric(
                        //             horizontal: 10.0,
                        //             vertical: 10,
                        //           ),
                        //           child: Column(
                        //             children: [
                        //               ManagePolicyWidget(
                        //                 title: 'Chidinma Ukaegbu',
                        //                 subtitle: 'Policy I.D: 160003/0',
                        //                 icon: ConstantString.roundProfileIcon,
                        //                 policyUser: PolicyUser.owner,
                        //               ),
                        //               verticalSpacer(16.h),
                        //               ManagePolicyWidget(
                        //                 title: 'Clarisse Ukaegbu',
                        //                 subtitle: 'Policy I.D: 160003/0',
                        //                 icon: ConstantString.roundProfileIcon,
                        //                 policyUser: PolicyUser.major,
                        //               ),
                        //               verticalSpacer(16.h),
                        //             ],
                        //           )),
                        //     ),
                        //   ),
                        // ),

                        GestureDetector(
                          onTap: () async {
                            selectedImage =
                                await selectImage(ImageSource.gallery);
                            if (selectedImage != null) {
                              setState(() {});
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
                              dashPattern: const [10, 10],
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(8),
                              padding: EdgeInsets.all(
                                  1), // Try adding a small padding
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
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 14.w,
                                    vertical: 14.h,
                                  ),
                                  child: Container(
                                    height: 145.h,
                                    decoration: BoxDecoration(
                                      color: CustomColors.whiteColor,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: selectedImage != null
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Image.file(
                                              selectedImage!,
                                              fit: BoxFit.cover,
                                              alignment: Alignment.topCenter,
                                            ),
                                          )
                                        : Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 34.h),
                                            child: Column(
                                              children: [
                                                SvgPicture.asset(
                                                  ConstantString.uploadIcon,
                                                ),
                                                verticalSpacer(8.h),
                                                mediumText(
                                                  'Click to upload',
                                                  fontSize: 14.sp,
                                                  color:
                                                      CustomColors.grey600Color,
                                                ),
                                              ],
                                            ),
                                          ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        verticalSpacer(24.h),
                        selectedImage != null
                            ? GestureDetector(
                                onTap: () async {
                                  selectedImage =
                                      await selectImage(ImageSource.gallery);

                                  if (selectedImage != null) {
                                    setState(() {});
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(200),
                                    color: CustomColors.whiteColor,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 12.h, horizontal: 20.w),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        semiBoldText(
                                          'Change Image',
                                          fontSize: 14.sp,
                                          color: CustomColors.green400Color,
                                        ),
                                        horizontalSpacer(10.w),
                                        SvgPicture.asset(
                                          ConstantString.changeImageIcon,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  color: CustomColors.lightOrangeColor,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(12),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            ConstantString.hintIcon,
                                          ),
                                          semiBoldText(
                                            'Hint',
                                            fontSize: 14.sp,
                                            color: CustomColors.orange900Color,
                                          ),
                                        ],
                                      ),
                                      verticalSpacer(4.h),
                                      mediumText(
                                        'Take photo in good lighting and ensure your face takes up to 75% of the screen.',
                                        fontSize: 12.sp,
                                        color: CustomColors.orange900Color,
                                      )
                                    ],
                                  ),
                                ),
                              ),

                        // CustomButton(
                        //   title: 'Add Dependant Slot',
                        //   onTap: () {},
                        // ),
                        verticalSpacer(
                            MediaQuery.of(context).padding.bottom + 20),
                      ],
                    ),
                  ),
                  // Content for the WhatsApp tab.
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        verticalSpacer(32.h),
                        // DottedBorder(
                        //   color: CustomColors.gray200Color,
                        //   dashPattern: const [10, 10],
                        //   borderType: BorderType.RRect,
                        //   radius: const Radius.circular(5),
                        //   padding: EdgeInsets.zero,
                        //   child: ClipRRect(
                        //     borderRadius: BorderRadiusDirectional.circular(5),
                        //     child: Container(
                        //       width: double.infinity,
                        //       // height: 46,
                        //       decoration: BoxDecoration(
                        //         color: CustomColors.whiteColor,
                        //         borderRadius: BorderRadius.circular(5),
                        //       ),
                        //       child: Padding(
                        //           padding: const EdgeInsets.symmetric(
                        //             horizontal: 10.0,
                        //             vertical: 10,
                        //           ),
                        //           child: Column(
                        //             children: [
                        //               ManagePolicyWidget(
                        //                 title: 'Chidinma Ukaegbu',
                        //                 subtitle: 'Policy I.D: 160003/0',
                        //                 icon: ConstantString.roundProfileIcon,
                        //                 policyUser: PolicyUser.owner,
                        //               ),
                        //               verticalSpacer(16.h),
                        //               ManagePolicyWidget(
                        //                 title: 'Clarisse Ukaegbu',
                        //                 subtitle: 'Policy I.D: 160003/0',
                        //                 icon: ConstantString.roundProfileIcon,
                        //                 policyUser: PolicyUser.major,
                        //               ),
                        //               verticalSpacer(16.h),
                        //             ],
                        //           )),
                        //     ),
                        //   ),
                        // ),

                        GestureDetector(
                          onTap: () async {
                            selectedImage =
                                await selectImage(ImageSource.camera);
                            if (selectedImage != null) {}
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
                              dashPattern: const [10, 10],
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(8),
                              padding: EdgeInsets.all(
                                  1), // Try adding a small padding
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
                                child: uploadedImage != null
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.file(
                                          uploadedImage!,
                                          fit: BoxFit.cover,
                                          alignment: Alignment.topCenter,
                                        ),
                                      )
                                    : Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 14.w,
                                          vertical: 14.h,
                                        ),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: CustomColors.whiteColor,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 34.h),
                                            child: Column(
                                              children: [
                                                SvgPicture.asset(
                                                  ConstantString.uploadIcon,
                                                ),
                                                verticalSpacer(8.h),
                                                mediumText(
                                                  'Click to upload',
                                                  fontSize: 14.sp,
                                                  color:
                                                      CustomColors.grey600Color,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                              ),
                            ),
                          ),
                        ),

                        verticalSpacer(24.h),
                        uploadedImage != null
                            ? GestureDetector(
                                onTap: () async {
                                  uploadedImage =
                                      await selectImage(ImageSource.camera);

                                  if (uploadedImage != null) {
                                    setState(() {});
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(200),
                                    color: CustomColors.whiteColor,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 12.h, horizontal: 20.w),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        semiBoldText(
                                          'Change Image',
                                          fontSize: 14.sp,
                                          color: CustomColors.green400Color,
                                        ),
                                        horizontalSpacer(10.w),
                                        SvgPicture.asset(
                                          ConstantString.changeImageIcon,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  color: CustomColors.lightOrangeColor,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(12),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            ConstantString.hintIcon,
                                          ),
                                          semiBoldText(
                                            'Hint',
                                            fontSize: 14.sp,
                                            color: CustomColors.orange900Color,
                                          ),
                                        ],
                                      ),
                                      verticalSpacer(4.h),
                                      mediumText(
                                        'Take photo in good lighting and ensure your face takes up to 75% of the screen.',
                                        fontSize: 12.sp,
                                        color: CustomColors.orange900Color,
                                      )
                                    ],
                                  ),
                                ),
                              ),

                        // CustomButton(
                        //   title: 'Add Dependant Slot',
                        //   onTap: () {},
                        // ),
                        verticalSpacer(
                            MediaQuery.of(context).padding.bottom + 20),
                        verticalSpacer(
                            MediaQuery.of(context).padding.bottom + 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            CustomButton(
              title: 'Continue',
              onTap: (selectedImage == null && uploadedImage == null)
                  ? null
                  : () {
                      context.pushNamed(
                        RouteConstants.activatePlanConfirmPolicyScreen,
                        extra: SendActivationEmailModel(
                          dependantType: NewDependantType.noUniqueEmail,
                        ),
                      );
                    },
            ),
            verticalSpacer(MediaQuery.of(context).padding.bottom + 40.h)
          ],
        ),
      ),
    );
  }
}

Future<File?> selectImage(ImageSource source) async {
  ImagePicker imagePicker = ImagePicker();
  XFile? pickedFile = await imagePicker.pickImage(
      source: source, imageQuality: 50, maxHeight: 612, maxWidth: 816);

  if (pickedFile != null) {
    File file = File(pickedFile.path);
    return file;
  }
  return null;
}
