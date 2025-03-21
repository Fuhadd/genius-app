import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/constants/route_constants.dart';
import 'package:genius_app/models/screen_prop_models/health_plans_model.dart';
import 'package:genius_app/screens/homepage/widgets/health_product_grid_container.dart';
import 'package:genius_app/screens/homepage/widgets/other_product_container.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:go_router/go_router.dart';

class BuyPlanScreen extends StatefulWidget {
  const BuyPlanScreen({super.key});

  @override
  State<BuyPlanScreen> createState() => _BuyPlanScreenState();
}

class _BuyPlanScreenState extends State<BuyPlanScreen> {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                boldText(
                  'Buy New Plan',
                  fontSize: 24.sp,
                  color: CustomColors.primaryGreenColor,
                ),
                SvgPicture.asset(
                  ConstantString.buyPlanIllustration,
                ),
              ],
            ),
            verticalSpacer(28.h),
            SizedBox(
              height: 500.h,
              child: GridView(
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 156.w,
                  mainAxisExtent: 156.h,
                  crossAxisSpacing: 23.w,
                  mainAxisSpacing: 23.h,
                ),
                children: [
                  GestureDetector(
                    onTap: () {
                      context.pushNamed(
                        RouteConstants.selectHealthPlanScreen,
                        extra: HealthPlansModel(isExpired: false),
                      );
                    },
                    child: HealthProductGridContainer(
                      title: 'Health Cover',
                      icon: ConstantString.healthCoverIcon,
                    ),
                  ),
                  HealthProductGridContainer(
                    title: 'Auto Cover',
                    icon: ConstantString.autoCoverIcon,
                  ),
                  HealthProductGridContainer(
                    title: 'Gadget Cover',
                    icon: ConstantString.gadgetCoverIcon,
                  ),
                  HealthProductGridContainer(
                    title: 'Travel Cover',
                    icon: ConstantString.travelCoverIcon,
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
