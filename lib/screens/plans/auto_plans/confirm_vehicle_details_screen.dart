import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/constants/route_constants.dart';
import 'package:genius_app/dialogs_and_popups/bottom_sheets/vehicle_details_submitted_bottom_sheet.dart';
import 'package:genius_app/models/screen_prop_models/add_dependency_form_model.dart';
import 'package:genius_app/models/screen_prop_models/dependant_added_model.dart';
import 'package:genius_app/models/screen_prop_models/send_activation_email_model.dart';
import 'package:genius_app/screens/plans/health_plans/dependant_added_screen.dart';
import 'package:genius_app/screens/plans/health_plans/dependant_screen.dart';
import 'package:genius_app/utils/enum.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_button.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ConfirmVehicleDetailsScreen extends StatefulHookConsumerWidget {
  // final SendActivationEmailModel data;
  const ConfirmVehicleDetailsScreen({
    super.key,
    // required this.data,
  });

  @override
  ConsumerState<ConfirmVehicleDetailsScreen> createState() =>
      _SendActivationEmailScreenState();
}

class _SendActivationEmailScreenState
    extends ConsumerState<ConfirmVehicleDetailsScreen> {
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
              'Confirm Vehicle Details',
              fontSize: 20.sp,
              color: CustomColors.primaryGreenColor,
            ),
            verticalSpacer(8.h),
            mediumText(
              'Confirm the details of your vehicle',
              fontSize: 14.sp,
              color: CustomColors.primaryGreenColor,
            ),
            verticalSpacer(23.h),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        verticalSpacer(20.h),
                        Container(
                          decoration: BoxDecoration(
                            color: CustomColors.grey25Color,
                            borderRadius: BorderRadius.circular(8.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black
                                    .withOpacity(0.005), // Subtle shadow color
                                blurRadius: 2, // Softness of the shadow
                                spreadRadius: 1, // Slight expansion
                                offset: Offset(
                                    0, 1), // Vertical movement of the shadow
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                            ),
                            child: Column(
                              children: [
                                verticalSpacer(14.sp),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      ConstantString.autoIcon,
                                      height: 30,
                                    ),
                                  ],
                                ),
                                verticalSpacer(4.sp),
                                DependantDetailsContainer(
                                  title: 'Chassis Number',
                                  subtitle: 'GHJ80809232',
                                ),
                                DependantDetailsContainer(
                                  title: 'Engine Number',
                                  subtitle: 'GHJ80809232',
                                ),
                                DependantDetailsContainer(
                                  title: 'Plate Number',
                                  subtitle: 'GHJ80809232',
                                ),
                                DependantDetailsContainer(
                                  title: 'Vehicle Colour',
                                  subtitle: 'Silver',
                                ),
                                DependantDetailsContainer(
                                  title: 'Year of Manufacture',
                                  subtitle: '2025',
                                ),
                                DependantDetailsContainer(
                                  title: 'Email Address',
                                  subtitle: 'clarisse@gmail.com',
                                ),
                                DependantDetailsContainer(
                                  title: 'Gender',
                                  subtitle: 'Female',
                                ),
                                DependantDetailsContainer(
                                  title: 'Date of birth',
                                  subtitle: 'clarisse@gmail.com',
                                ),
                                DependantDetailsContainer(
                                  title: 'Address',
                                  subtitle: 'Safewell Estate Lekki',
                                ),
                                DependantDetailsContainer(
                                  title: 'Identification type',
                                  subtitle: 'NIN',
                                ),
                                DependantDetailsContainer(
                                  title: 'Vehicle license',
                                  subtitle: 'Female',
                                  subtitleBody: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SvgPicture.asset(
                                        ConstantString.pdfEyeIcon,
                                        height: 24,
                                      ),
                                      horizontalSpacer(6.w),
                                      semiBoldText(
                                        'Img_jpg1234',
                                        fontSize: 14.sp,
                                        color: CustomColors.orange900Color,
                                      ),
                                    ],
                                  ),
                                ),
                                DependantDetailsContainer(
                                  title: 'Proof of ownership',
                                  subtitle: 'Female',
                                  subtitleBody: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SvgPicture.asset(
                                        ConstantString.pdfEyeIcon,
                                        height: 24,
                                      ),
                                      horizontalSpacer(6.w),
                                      semiBoldText(
                                        'Img_jpg1234',
                                        fontSize: 14.sp,
                                        color: CustomColors.orange900Color,
                                      ),
                                    ],
                                  ),
                                ),
                                DependantDetailsContainer(
                                  title: 'NIN',
                                  subtitle: 'Female',
                                  subtitleBody: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SvgPicture.asset(
                                        ConstantString.pdfEyeIcon,
                                        height: 24,
                                      ),
                                      horizontalSpacer(6.w),
                                      semiBoldText(
                                        'Img_jpg1234',
                                        fontSize: 14.sp,
                                        color: CustomColors.orange900Color,
                                      ),
                                    ],
                                  ),
                                ),
                                verticalSpacer(30),
                              ],
                            ),
                          ),
                        ),
                        Spacer(),
                        CustomButton(
                            title: 'Submit to activate',
                            onTap: () {
                              showVehicleDetailsSubmittedBottomSheet(context);
                              // context.pushReplacementNamed(
                              //   RouteConstants.dependantAddedScreen,
                              //   extra: DependantAddedModel(
                              //     dependantType: widget.data.dependantType,
                              //   ),
                              // );
                            }),
                        verticalSpacer(30.h),
                        Spacer(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
