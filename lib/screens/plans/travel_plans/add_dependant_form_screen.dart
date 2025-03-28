import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/constants/route_constants.dart';
import 'package:genius_app/models/screen_prop_models/add_dependency_form_model.dart';
import 'package:genius_app/models/screen_prop_models/send_activation_email_model.dart';
import 'package:genius_app/screens/onboarding/phone_number_screen.dart';
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
import 'package:shadcn_ui/shadcn_ui.dart';

class AddDependantFormScreen extends StatefulWidget {
  final AddDependencyFormModel data;
  const AddDependantFormScreen({super.key, required this.data});

  @override
  State<AddDependantFormScreen> createState() => _AddDependantFormScreenState();
}

class _AddDependantFormScreenState extends State<AddDependantFormScreen> {
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
              semiBoldText(
                'Add Dependant',
                // widget.data.dependantType.name,
                fontSize: 20.sp,
                color: CustomColors.primaryGreenColor,
              ),
              verticalSpacer(8.h),
              mediumText(
                'This dependant can manage their policy',
                fontSize: 14.sp,
                color: CustomColors.primaryGreenColor,
              ),
              verticalSpacer(43.h),
              customTextFieldWithText(
                'firstName',
                'Legal first name of dependant',
                title: 'First Name',
                validator: FormBuilderValidators.compose(
                  [
                    FormBuilderValidators.required(
                        errorText: 'First Name field cannot be empty '),
                  ],
                ),
              ),
              verticalSpacer(24.h),
              customTextFieldWithText(
                'lastName',
                'Legal last name of dependant',
                title: 'Last Name',
                validator: FormBuilderValidators.compose(
                  [
                    FormBuilderValidators.required(
                        errorText: 'Last Name field cannot be empty '),
                  ],
                ),
              ),
              verticalSpacer(24.h),
              widget.data.dependantType == NewDependantType.uniqueEmail
                  ? customTextFieldWithText(
                      'email',
                      'Enter dependant email address',
                      title: 'Email Address',
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.email(
                              errorText: 'Provided email not valid '),
                          FormBuilderValidators.required(
                              errorText:
                                  'Email Address field cannot be empty '),
                        ],
                      ),
                    )
                  : CustomMiniDatePicker(
                      label: "Enter date of incident",
                      description: "dd/mm/yyyy",
                      isTodayMax: true,
                      minDate: 12,
                      selectedDate: dateOfIncidentProvider,
                    ),

              verticalSpacer(24.h),
              widget.data.dependantType == NewDependantType.uniqueEmail
                  ? Padding(
                      padding: EdgeInsets.only(bottom: 24.h),
                      child: customTextFieldWithText(
                        'phoneNumber',
                        'Enter dependant phone number',
                        title: 'Phone Number',
                        validator: (value) {
                          return validatePhoneNumber(
                            value ?? "",
                            'phone number',
                          );
                        },
                        onChanged: (value) {
                          setState(() {
                            phoneNumber = value;
                          });
                        },
                      ),
                    )
                  : SizedBox.shrink(),
              // verticalSpacer(24.h),
              // CustomDropdownfield(
              //   options: fruits,
              //   title: 'Relationship',
              //   label: 'Select relationship to dependant',
              // ),
              // verticalSpacer(50.h),
              // DropdownSearch<String>(
              //   items: (filter, infiniteScrollProps) => [
              //     'Item 1',
              //     'Item 2',
              //     'Item 3',
              //     'Item 1',
              //     'Item 2',
              //     'Item 3'
              //   ],
              //   suffixProps: DropdownSuffixProps(
              //     dropdownButtonProps: DropdownButtonProps(
              //       iconClosed: Icon(Icons.keyboard_arrow_down),
              //       iconOpened: Icon(Icons.keyboard_arrow_up),
              //     ),
              //   ),
              //   decoratorProps: DropDownDecoratorProps(
              //     textAlign: TextAlign.start,
              //     decoration: InputDecoration(
              //       contentPadding:
              //           EdgeInsets.symmetric(vertical: 17, horizontal: 16),

              //       filled: true,
              //       fillColor: CustomColors.formBgColor,
              //       border: OutlineInputBorder(
              //         borderSide: BorderSide(color: Colors.transparent),
              //         borderRadius: BorderRadius.circular(12),
              //       ),
              //       enabledBorder: const OutlineInputBorder(
              //         borderSide: BorderSide(
              //           color: CustomColors.grey100Color,
              //         ),
              //         borderRadius: BorderRadius.all(
              //           Radius.circular(8),
              //         ),
              //       ),
              //       focusedBorder: const OutlineInputBorder(
              //         borderSide: BorderSide(
              //           color: CustomColors.green500Color,
              //         ),
              //         borderRadius: BorderRadius.all(
              //           Radius.circular(8),
              //         ),
              //       ),
              //       hintText: 'Please select...',
              //       // hintText: 'Please select...',
              //       hintStyle: CustomTextStyles.medium(
              //         fontSize: 16.sp,
              //         color: CustomColors.grey600Color,
              //       ),
              //       labelStyle: CustomTextStyles.medium(
              //         fontSize: 16.sp,
              //         color: CustomColors.grey600Color,
              //       ),
              //     ),
              //   ),
              //   popupProps: PopupProps.bottomSheet(
              //     itemBuilder: (context, item, isDisabled, isSelected) {
              //       return Padding(
              //         padding: const EdgeInsets.symmetric(vertical: 12.0),
              //         child: Text(
              //           item,
              //           style: TextStyle(
              //               fontWeight: FontWeight.bold, fontSize: 18),
              //           textAlign: TextAlign.center,
              //         ),
              //       );
              //     },
              //     constraints: BoxConstraints(maxHeight: 360),
              //     bottomSheetProps:
              //         BottomSheetProps(backgroundColor: Colors.blueGrey[50]),
              //     // showSearchBox: true,
              //     suggestedItemProps: SuggestedItemProps(
              //       showSuggestedItems: true,
              //       suggestedItems: (us) {
              //         return us.where((e) => e.contains("Mrs")).toList();
              //       },
              //     ),
              //   ),
              // ),

              CustomListDropdownField(
                fieldName: "Select relationship to dependant",
                label: "Relationship",
                description: "Select relationship to dependant",
                items: relationships,
                // items: const [
                //   "Accidental damage",
                //   "Theft",
                // ],
                selectedItem: relationshipTypeProvider,
              ),

              CustomListDropdownField(
                fieldName: "Select gender",
                label: "Gender",
                description: "Select gender",
                items: gender,
                // items: const [
                //   "Accidental damage",
                //   "Theft",
                // ],
                selectedItem: genderTypeProvider,
              ),
              verticalSpacer(48.h),
              CustomButton(
                title: 'Continue',
                onTap:
                    // phoneNumber == null
                    //     ? null
                    //     :
                    () {
                  // context.pop();
                  if (widget.data.dependantType ==
                      NewDependantType.noUniqueEmail) {
                    context.pushNamed(
                      RouteConstants.uploadDependantImageScreen,
                    );
                  } else {
                    context.pushNamed(
                      RouteConstants.sendActivationEmailScreen,
                      extra: SendActivationEmailModel(
                        dependantType: widget.data.dependantType,
                      ),
                    );
                  }
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

final relationships = [
  'Father',
  'Mother',
  'Brother',
  'Sister',
  'Child',
];

final gender = [
  'Male',
  'Female',
];

final relationshipTypeProvider =
    StateProvider.autoDispose<String?>((ref) => null);
final genderTypeProvider = StateProvider.autoDispose<String?>((ref) => null);

final fruits = {
  'apple': 'Apple',
  'banana': 'Banana',
  'blueberry': 'Blueberry',
  'grapes': 'Grapes',
  'pineapple': 'Pineapple',
  'apple': 'Apple',
  'banana': 'Banana',
  'blueberry': 'Blueberry',
  'grapes': 'Grapes',
  'pineapple': 'Pineapple',
  'apple': 'Apple',
  'banana': 'Banana',
  'blueberry': 'Blueberry',
  'grapes': 'Grapes',
  'pineapple': 'Pineapple',
  'apple': 'Apple',
  'banana': 'Banana',
  'blueberry': 'Blueberry',
  'grapes': 'Grapes',
  'pineapple': 'Pineapple',
};

final timezones = {
  'North America': {
    'est': 'Eastern Standard Time (EST)',
    'cst': 'Central Standard Time (CST)',
    'mst': 'Mountain Standard Time (MST)',
    'pst': 'Pacific Standard Time (PST)',
    'akst': 'Alaska Standard Time (AKST)',
    'hst': 'Hawaii Standard Time (HST)',
  },
  'Europe & Africa': {
    'gmt': 'Greenwich Mean Time (GMT)',
    'cet': 'Central European Time (CET)',
    'eet': 'Eastern European Time (EET)',
    'west': 'Western European Summer Time (WEST)',
    'cat': 'Central Africa Time (CAT)',
    'eat': 'Eastern Africa Time (EAT)',
  },
  'Asia': {
    'msk': 'Moscow Time (MSK)',
    'ist': 'India Standard Time (IST)',
    'cst_china': 'China Standard Time (CST)',
    'jst': 'Japan Standard Time (JST)',
    'kst': 'Korea Standard Time (KST)',
    'ist_indonasia': 'Indonesia Standard Time (IST)',
  },
  'Australia & Pacific': {
    'awst': 'Australian Western Standard Time (AWST)',
    'acst': 'Australian Central Standard Time (ACST)',
    'aest': 'Australian Eastern Standard Time (AEST)',
    'nzst': 'New Zealand Standard Time (NZST)',
    'fjt': 'Fiji Time (FJT)',
  },
  'South America': {
    'art': 'Argentina Time (ART)',
    'bot': 'Bolivia Time (BOT)',
    'brt': 'Brasilia Time (BRT)',
    'clt': 'Chile Standard Time (CLT)',
  },
};

List<Widget> getTimezonesWidgets(ShadThemeData theme) {
  final widgets = <Widget>[];
  for (final zone in timezones.entries) {
    widgets.add(
      Padding(
        padding: const EdgeInsets.fromLTRB(32, 6, 6, 6),
        child: Text(
          zone.key,
          style: theme.textTheme.muted.copyWith(
            fontWeight: FontWeight.w600,
            color: theme.colorScheme.popoverForeground,
          ),
          textAlign: TextAlign.start,
        ),
      ),
    );
    widgets.addAll(zone.value.entries
        .map((e) => ShadOption(value: e.key, child: Text(e.value))));
  }
  return widgets;
}

class SelectExample extends StatelessWidget {
  const SelectExample({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 280),
      child: ShadSelect<String>(
        placeholder: const Text('Select a timezone'),
        options: getTimezonesWidgets(theme),
        selectedOptionBuilder: (context, value) {
          final timezone = timezones.entries
              .firstWhere((element) => element.value.containsKey(value))
              .value[value];
          return Text(timezone!);
        },
      ),
    );
  }
}

final dateOfIncidentProvider =
    StateProvider.autoDispose<String?>((ref) => null);
