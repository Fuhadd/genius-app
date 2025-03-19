import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/constants/route_constants.dart';
import 'package:genius_app/models/screen_prop_models/plan_summary_model.dart';
import 'package:genius_app/utils/custom_text_styles.dart';
import 'package:genius_app/utils/enum.dart';
import 'package:genius_app/utils/nigeria_states.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_button.dart';
import 'package:genius_app/widgets/custom_date_picker.dart';
import 'package:genius_app/widgets/custom_list_dropdown_field.dart';
import 'package:genius_app/widgets/custom_text_field.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final selectedStateOfResidence =
    StateProvider.autoDispose<String?>((ref) => null);
final selectedLga = StateProvider.autoDispose<String?>((ref) => null);
final selectedDate = StateProvider.autoDispose<String?>((ref) => null);
final selectedGender = StateProvider.autoDispose<String?>((ref) => null);

//final selectedDate = StateProvider.autoDispose<String?>((ref) => null);
class ActivatePlanScreen extends ConsumerStatefulWidget {
  const ActivatePlanScreen({super.key});

  @override
  ConsumerState<ActivatePlanScreen> createState() => _ActivatePlanScreenState();
}

int selectedIndex = 0;
String? nin, houseAddress;

class _ActivatePlanScreenState extends ConsumerState<ActivatePlanScreen> {
  @override
  void initState() {
    super.initState();
    selectedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.bgWhiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
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
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      semiBoldText(
                        'Activate FlexiCare Plan',
                        fontSize: 20.sp,
                        color: CustomColors.primaryGreenColor,
                      ),
                      verticalSpacer(8.h),
                      mediumText(
                        'Enter details as it appears on your legal documents',
                        fontSize: 14.sp,
                        color: CustomColors.primaryGreenColor,
                      ),
                    ],
                  ),
                ],
              ),
              verticalSpacer(43.h),
              Form(
                child: Column(
                  children: [
                    CustomListDropdownField(
                      fieldName: "Select Gender",
                      label: "Gender",
                      description: "Select Gender",
                      items: const [
                        "Male",
                        "Female",
                      ],
                      selectedItem: selectedGender,
                    ),
                    CustomMiniDatePicker(
                      label: 'Date of birth',
                      description: 'DD/MM/YYYY',
                      isTodayMax: false,
                      selectedDate: selectedDate,
                    ),
                    verticalSpacer(24.h),
                    customTextFieldWithText(
                        'National Identity Number (NIN)', 'Enter NIN',
                        title: 'National Identity Number (NIN)',
                        enabledBorderColor: CustomColors.grey100Color,
                        onChanged: (v) {
                      setState(() {
                        nin = v;
                      });
                    },
                        validator: FormBuilderValidators.required(
                            errorText: 'NIN is required',
                            checkNullOrEmpty: true)),
                    verticalSpacer(24.h),
                    CustomListDropdownField(
                      fieldName: "State of residence",
                      label: "State of residence",
                      description: "Select state",
                      items: NigeriaStates.getStates(),
                      selectedItem: selectedStateOfResidence,
                    ),
                    verticalSpacer(24.h),
                    ref.watch(selectedStateOfResidence) == null
                        ? SizedBox.shrink()
                        : CustomListDropdownField(
                            fieldName: "L.G.A of residence",
                            label: "L.G.A of residence",
                            description: "Select L.G.A",
                            items: NigeriaStates.getLgasByState(
                                    ref.watch(selectedStateOfResidence) ??
                                        "Adamawa") ??
                                [],
                            selectedItem: selectedLga,
                          ),
                    customTextFieldWithText(
                      '',
                      'Enter House Address',
                      title: 'House Address',
                      enabledBorderColor: CustomColors.grey100Color,
                      onChanged: (v) {
                        setState(() {
                          houseAddress = v;
                        });
                      },
                    ),
                  ],
                ),
              ),
              verticalSpacer(48.h),
              CustomButton(
                title: 'Continue',
                onTap: (ref.watch(selectedGender) == null ||
                            ref.watch(selectedDate) == null) ||
                        ref.watch(selectedStateOfResidence) == null ||
                        ref.watch(selectedLga) == null ||
                        nin == null ||
                        houseAddress == null
                    ? null
                    : () {
                        context.pushNamed(
                          extra: PlanSummaryScreenModel(
                              planSummaryType: PlanSummaryType.newPlanPurchase),
                          RouteConstants.uploadImageScreen,
                        );
                      },
              ),
              verticalSpacer(MediaQuery.of(context).padding.bottom + 20),
            ],
          ),
        ),
      ),
    );
  }
}

class CoverageTypeITemWidget extends StatelessWidget {
  const CoverageTypeITemWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.color,
  });

  final String icon, text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 156.h,
      width: 156.w,
      decoration: BoxDecoration(
        color: CustomColors.whiteColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: CustomColors.grey50Color,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            ConstantString.familyAvatars,
            color: color,
          ),
          verticalSpacer(10.h),
          semiBoldText(
            text,
            fontSize: 14.sp,
            color: CustomColors.grey500Color,
          )
        ],
      ),
    );
  }
}

class HelperText extends StatelessWidget {
  const HelperText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 156.h,
      width: 156.w,
      decoration: BoxDecoration(
        color: CustomColors.green50Color,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: CustomColors.green500Color,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          mediumText(
            text,
            textAlign: TextAlign.center,
            fontSize: 14.sp,
            color: CustomColors.green500Color,
          )
        ],
      ),
    );
  }
}
