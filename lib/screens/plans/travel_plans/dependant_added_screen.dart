import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/constants/route_constants.dart';
import 'package:genius_app/models/screen_prop_models/dependant_added_model.dart';
import 'package:genius_app/screens/onboarding/account_verified_screen.dart';
import 'package:genius_app/utils/custom_text_styles.dart';
import 'package:genius_app/utils/enum.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_button.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:go_router/go_router.dart';

class DependantAddedScreen extends StatefulWidget {
  final DependantAddedModel data;
  const DependantAddedScreen({super.key, required this.data});

  @override
  State<DependantAddedScreen> createState() => _DependantAddedScreenState();
}

class _DependantAddedScreenState extends State<DependantAddedScreen> {
  AccountType? accountType;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            verticalSpacer(MediaQuery.of(context).padding.top + 20),
            Center(
              child: Image.asset(
                ConstantString.geniusLogoGreen,
                height: 43,
              ),
            ),
            verticalSpacer(40.h),
            boldText(
              'Dependant Added',
              fontSize: 24.sp,
              color: CustomColors.green400Color,
              textAlign: TextAlign.center,
            ),
            verticalSpacer(12.h),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "We've sent an email to your dependant, ",
                      style: CustomTextStyles.medium(
                        color: CustomColors.grey600Color,
                        fontSize: 16.sp,
                      ),
                    ),
                    TextSpan(
                      text: "Clarisse Ukaegbu",
                      style: CustomTextStyles.medium(
                        color: CustomColors.green500Color,
                        fontSize: 16.sp,
                      ),
                    ),
                    TextSpan(
                      text: ", to activate their plan.",
                      style: CustomTextStyles.medium(
                        color: CustomColors.grey600Color,
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            verticalSpacer(57.h),
            // SvgPicture.asset(ConstantString.rotatingGraphics),
            Stack(
              clipBehavior: Clip.none,
              alignment: AlignmentDirectional.center,
              children: [
                Positioned(
                  bottom: -50,
                  child: SvgPicture.asset(ConstantString.treeRoot),
                ),
                RotatingSvg(),
                SvgPicture.asset(ConstantString.checkmark),
              ],
            ),
            Spacer(),
            CustomButton(
                title: 'Add next dependant',
                onTap: () {
                  context.pop();
                  context.pop();
                  context.pop();
                  if (widget.data.dependantType ==
                      NewDependantType.noUniqueEmail) {
                    context.pop();
                  }
                }),
            verticalSpacer(16.h),
            GestureDetector(
              onTap: () {
                context.pop();
                context.pop();
                context.pop();
                context.pop();
                if (widget.data.dependantType ==
                    NewDependantType.noUniqueEmail) {
                  context.pop();
                }
              },
              child: boldText(
                'Do this another time',
                fontSize: 16.sp,
                color: CustomColors.green500Color,
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
