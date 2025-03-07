import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/constants/route_constants.dart';
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

class SendActivationEmailScreen extends StatefulHookConsumerWidget {
  final SendActivationEmailModel data;
  const SendActivationEmailScreen({
    super.key,
    required this.data,
  });

  @override
  ConsumerState<SendActivationEmailScreen> createState() =>
      _SendActivationEmailScreenState();
}

class _SendActivationEmailScreenState
    extends ConsumerState<SendActivationEmailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.bgWhiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
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
                    'Send activation email',
                    fontSize: 20.sp,
                    color: CustomColors.primaryGreenColor,
                  ),
                  verticalSpacer(8.h),
                  mediumText(
                    'Confirm details & send email to enable activation.',
                    fontSize: 14.sp,
                    color: CustomColors.primaryGreenColor,
                  ),
                  verticalSpacer(43.h),
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
                          offset:
                              Offset(0, 1), // Vertical movement of the shadow
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
                                ConstantString.scanUserIcon,
                              ),
                            ],
                          ),
                          verticalSpacer(4.sp),
                          DependantDetailsContainer(
                            title: 'Type',
                            subtitle: 'Major',
                          ),
                          DependantDetailsContainer(
                            title: 'Full Name',
                            subtitle: 'Clarisse Ukaegbu',
                          ),
                          DependantDetailsContainer(
                            title: 'Email Address',
                            subtitle: 'clarisse@gmail.com',
                          ),
                          DependantDetailsContainer(
                            title: 'Relationship',
                            subtitle: 'Sister',
                          ),
                          DependantDetailsContainer(
                            title: 'Gender',
                            subtitle: 'Female',
                          ),
                          widget.data.dependantType ==
                                  NewDependantType.noUniqueEmail
                              ? DependantDetailsContainer(
                                  title: 'Image',
                                  subtitle: 'Female',
                                  subtitleBody: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        height: 24.h,
                                        width: 24.h,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4.r),
                                          image: DecorationImage(
                                            image: AssetImage(
                                                ConstantString.humanImage),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      horizontalSpacer(6.w),
                                      semiBoldText(
                                        'Img_jpg1234',
                                        fontSize: 14.sp,
                                        color: CustomColors.orange900Color,
                                      ),
                                    ],
                                  ),
                                )
                              : SizedBox.shrink(),
                          verticalSpacer(30),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  CustomButton(
                      title: widget.data.dependantType ==
                              NewDependantType.noUniqueEmail
                          ? "Generate HMO I.D"
                          : 'Send activation email',
                      onTap: () {
                        context.pushReplacementNamed(
                          RouteConstants.dependantAddedScreen,
                          extra: DependantAddedModel(
                            dependantType: widget.data.dependantType,
                          ),
                        );
                      }),
                  Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
