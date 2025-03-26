import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/constants/route_constants.dart';
import 'package:genius_app/models/screen_prop_models/buy_auto_plan_form_model.dart';
import 'package:genius_app/models/screen_prop_models/plan_summary_model.dart';
import 'package:genius_app/utils/custom_text_styles.dart';
import 'package:genius_app/utils/enum.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_button.dart';
import 'package:genius_app/widgets/custom_list_dropdown_field.dart';
import 'package:genius_app/widgets/custom_text_field.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class BuyAutoPlanFormScreen extends StatefulWidget {
  final BuyAutoPlanFormModel data;
  const BuyAutoPlanFormScreen({super.key, required this.data});

  @override
  State<BuyAutoPlanFormScreen> createState() => _BuyAutoPlanFormScreenState();
}

class _BuyAutoPlanFormScreenState extends State<BuyAutoPlanFormScreen> {
  String? phoneNumber;

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
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      semiBoldText(
                        widget.data.autoPlans.description,
                        // widget.data.dependantType.name,
                        fontSize: 20.sp,
                        color: CustomColors.primaryGreenColor,
                      ),
                      verticalSpacer(8.h),
                      mediumText(
                        'Provide details to calculate premium',
                        fontSize: 14.sp,
                        color: CustomColors.primaryGreenColor,
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: CustomColors.grey100Color,
                      ),
                      color: CustomColors.whiteColor,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 4.h, horizontal: 6.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            ConstantString.moneyIcon,
                          ),
                          widget.data.autoPlans == AutoPlans.comprehensiveAuto
                              ? semiBoldText(
                                  'From 5%',
                                  fontSize: 12.sp,
                                  color: CustomColors.orange900Color,
                                )
                              : RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "₦ ",
                                        style: CustomTextStyles.semiBold(
                                          fontSize: 12.sp,
                                          color: CustomColors.orange900Color,
                                        ),
                                      ),
                                      TextSpan(
                                        text: widget.data.autoPlans ==
                                                AutoPlans.miniComprehensive
                                            ? "25,000"
                                            : '15,000',
                                        style: CustomTextStyles.semiBold(
                                          fontSize: 12.sp,
                                          color: CustomColors.orange900Color,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                          mediumText(
                            widget.data.autoPlans == AutoPlans.comprehensiveAuto
                                ? '/ vehicle value'
                                : '/ vehicle annually',
                            fontSize: 10.sp,
                            color: CustomColors.grey500Color,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              verticalSpacer(40.h),
              Visibility(
                visible: widget.data.autoPlans == AutoPlans.comprehensiveAuto,
                child: CustomListDropdownField(
                  fieldName: "Select your cover period",
                  label: "Select your cover period",

                  labelWidget: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Cover period ",
                          style: CustomTextStyles.medium(
                            fontSize: 16.sp,
                            color: CustomColors.greenTextColor,
                          ),
                        ),
                        TextSpan(
                          text: "(Fixed for current purchase)",
                          style: CustomTextStyles.medium(
                            fontSize: 14.sp,
                            color: CustomColors.orange500Color,
                          ),
                        ),
                      ],
                    ),
                  ),
                  description: "Select your cover period",
                  items: coverPeriod,
                  // items: const [
                  //   "Accidental damage",
                  //   "Theft",
                  // ],
                  selectedItem: coverPeriodProvider,
                ),
              ),
              CustomListDropdownField(
                fieldName: "Select who owns the vehicle",
                label: "Who is the vehicle owner?",
                description: "Select who owns the vehicle",
                items: vehicleOwner,
                selectedItem: vehicleOwnerProvider,
              ),
              CustomListDropdownField(
                fieldName: "Select vehicle category",
                label: "What is the vehicle category?",
                description: "Select vehicle category",
                items: vehicleCategory,
                selectedItem: vehicleCategoryProvider,
              ),
              CustomListDropdownField(
                fieldName: "Select vehicle type",
                label: "What is the vehicle type?",
                description: "Select vehicle type",
                items: vehicletype,
                // items: const [
                //   "Accidental damage",
                //   "Theft",
                // ],
                selectedItem: vehicletypeProvider,
              ),
              Visibility(
                visible: widget.data.autoPlans == AutoPlans.comprehensiveAuto,
                child: CustomListDropdownField(
                  fieldName: "Select vehicle manufacturer",
                  label: "Who is the vehicle manufacturer?",
                  description: "Select vehicle manufacturer",
                  items: vehicleManufacturer,
                  selectedItem: vehicleManufacturerProvider,
                ),
              ),
              Visibility(
                visible: widget.data.autoPlans == AutoPlans.comprehensiveAuto,
                child: CustomListDropdownField(
                  fieldName: "Select vehicle model",
                  label: "What is the vehicle model?",
                  description: "Select vehicle model",
                  items: vehicleModel,
                  // items: const [
                  //   "Accidental damage",
                  //   "Theft",
                  // ],
                  selectedItem: vehicleModelProvider,
                ),
              ),
              Visibility(
                visible: widget.data.autoPlans == AutoPlans.comprehensiveAuto,
                child: customTextFieldWithText(
                  'vehicleWorth',
                  '0.00',
                  isCurrency: true,
                  title: 'What is the vehicle’s worth?',
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(
                          errorText: 'First Name field cannot be empty '),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible:
                    !(widget.data.autoPlans == AutoPlans.comprehensiveAuto),
                child: customTextFieldWithText(
                  'vehicleNumber',
                  '0',
                  title: 'Number of vehicles',
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(
                          errorText:
                              'Number of vehicles field cannot be empty '),
                    ],
                  ),
                ),
              ),
              verticalSpacer(24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SvgPicture.asset(
                    ConstantString.addCircle,
                  ),
                  horizontalSpacer(5),
                  semiBoldText(
                    'Add Another Vehicle',
                    fontSize: 14.sp,
                    color: CustomColors.green500Color,
                  )
                ],
              ),
              verticalSpacer(48.h),
              Container(
                height: 61.h,
                decoration: BoxDecoration(
                    color: CustomColors.lightOrangeColor,
                    border: Border.all(color: CustomColors.orange200Color),
                    borderRadius: BorderRadius.circular(8.r)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
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
                            text: '200,000',
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
                onTap: () {
                  context.pushNamed(
                    RouteConstants.planSummaryScreen,
                    extra: PlanSummaryScreenModel(
                      planSummaryType: PlanSummaryType.autoPlanSummary,
                      selectedAutoPlan: widget.data.autoPlans,
                    ),
                  );
                  // showDependantRemovedBottomSheet(context);
                },
                // onTap:
                //     // phoneNumber == null
                //     //     ? null
                //     //     :
                //     () {
                //   // context.pop();
                //   // if (widget.data.dependantType ==
                //   //     NewDependantType.noUniqueEmail) {
                //   //   context.pushNamed(
                //   //     RouteConstants.uploadDependantImageScreen,
                //   //   );
                //   // } else {
                //   //   context.pushNamed(
                //   //     RouteConstants.sendActivationEmailScreen,
                //   //     extra: SendActivationEmailModel(
                //   //       dependantType: widget.data.dependantType,
                //   //     ),
                //   //   );
                //   // }
                // },
              ),
              verticalSpacer(MediaQuery.of(context).padding.bottom + 48.h),
            ],
          ),
        ),
      ),
    );
  }
}

final coverPeriod = [
  'Monthly',
  'Annually',
];
final vehicleOwner = [
  'Vehicle is for me',
  'Vehicle is for someone else',
];
final vehicleCategory = [
  'Public',
  'Private',
];

final vehicletype = [
  'Saloon',
  'Bus',
  'Jeep',
];
final vehicleManufacturer = [
  'Totota',
  'Lexus',
  'Mercedes',
];

final vehicleModel = [
  'Avanti',
  'Rx 350',
];

final coverPeriodProvider = StateProvider.autoDispose<String?>((ref) => null);

final vehicleOwnerProvider = StateProvider.autoDispose<String?>((ref) => null);
final vehicleCategoryProvider =
    StateProvider.autoDispose<String?>((ref) => null);
final vehicletypeProvider = StateProvider.autoDispose<String?>((ref) => null);

final vehicleManufacturerProvider =
    StateProvider.autoDispose<String?>((ref) => null);

final vehicleModelProvider = StateProvider.autoDispose<String?>((ref) => null);
