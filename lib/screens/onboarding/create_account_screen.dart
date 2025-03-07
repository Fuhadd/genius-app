import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/dialogs_and_popups/bottom_sheets/email_exists_bottom_sheet.dart';
import 'package:genius_app/utils/custom_text_styles.dart';
import 'package:genius_app/utils/enum.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/utils/string_utils.dart';
import 'package:genius_app/widgets/custom_button.dart';
import 'package:genius_app/widgets/custom_text_field.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class CreateAccountScreen extends StatefulHookConsumerWidget {
  final GlobalKey<FormBuilderState> formKey;
  final VoidCallback onNext;
  const CreateAccountScreen({
    super.key,
    required this.onNext,
    required this.formKey,
  });

  @override
  ConsumerState<CreateAccountScreen> createState() =>
      _CreateAccountScreenState();
}

class _CreateAccountScreenState extends ConsumerState<CreateAccountScreen> {
  AccountType? accountType;
  bool termsChecked = false;
  String? firstName;
  String? lastName;
  String? email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: FormBuilder(
                key: widget.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpacer(20),

                    boldText(
                      'CREATE YOUR ACCOUNT 👤',
                      fontSize: 12.sp,
                      color: CustomColors.green500Color,
                    ),
                    verticalSpacer(12.h),

                    semiBoldText(
                      'Join MyCover and enjoy financial security.',
                      fontSize: 20.sp,
                      color: CustomColors.green400Color,
                    ),
                    verticalSpacer(48.h),

                    customTextField(
                      'firstName',
                      'Legal First Name',
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(
                              errorText: 'First Name cannot be empty '),
                        ],
                      ),
                      onChanged: (value) {
                        setState(() {
                          firstName = value;
                        });
                      },
                    ),
                    verticalSpacer(30),
                    customTextField(
                      'lastName',
                      'Legal Last Name',
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(
                              errorText: 'Last Name cannot be empty '),
                        ],
                      ),
                      onChanged: (value) {
                        setState(() {
                          lastName = value;
                        });
                      },
                    ),
                    verticalSpacer(30),
                    customTextField(
                      'email',
                      'Email address',
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.email(
                              errorText: 'Provided email not valid '),
                          FormBuilderValidators.required(
                              errorText: 'Email field cannot be empty '),
                        ],
                      ),
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                    ),
                    verticalSpacer(24.h),
                    ShadCheckbox(
                      value: termsChecked,
                      color: CustomColors.green500Color,
                      onChanged: (v) => setState(() => termsChecked = v),
                      label: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "I acknowledge the ",
                              style: CustomTextStyles.medium(
                                fontSize: 14.sp,
                                color: CustomColors.grey700Color,
                              ),
                            ),
                            TextSpan(
                              text: "Terms & Conditions",
                              style: CustomTextStyles.semiBold(
                                fontSize: 14.sp,
                                color: CustomColors.green500Color,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // customTextField(
                    //   'password',
                    //   Icons.vpn_key,
                    //   Icons.remove_red_eye_outlined,
                    //   'Password',
                    //   obscureText: passwordObscured,
                    //   onSuffixTap: () {
                    //     setState(() {
                    //       passwordObscured = !passwordObscured;
                    //     });
                    //   },
                    //   onChanged: (value) {
                    //     // setState(() {
                    //     //   password = value!;
                    //     //   print(password);
                    //     // });
                    //   },
                    //   validator: FormBuilderValidators.compose([
                    //     FormBuilderValidators.minLength(6,
                    //         errorText: 'Good passwords are greater than 6 characters'),
                    //     FormBuilderValidators.required(
                    //         errorText: 'Password field cannot be empty '),
                    //   ]),
                    // ),
                    Spacer(),
                    CustomButton(
                      title: 'Continue',
                      onTap: (StringUtils.isNullOrEmpty(firstName) ||
                              StringUtils.isNullOrEmpty(lastName) ||
                              StringUtils.isNullOrEmpty(email) ||
                              !termsChecked)
                          ? null
                          : () {
                              FocusScope.of(context).unfocus();
                              bool? validate =
                                  widget.formKey.currentState?.validate();

                              if (validate == true) {
                                var firstName = widget.formKey.currentState
                                    ?.fields['firstName']?.value
                                    .toString()
                                    .trim();

                                var lastName = widget.formKey.currentState
                                    ?.fields['lastName']?.value
                                    .toString()
                                    .trim();

                                var password = widget.formKey.currentState
                                    ?.fields['password']?.value;

                                if (email?.toLowerCase() == 'test@email.com') {
                                  emailExistsBottomSheet(context);
                                } else {
                                  widget.onNext();
                                }

                                // print(email);
                                // print(password);
                              }

                              // context.pushNamed(
                              //   RouteConstants.phoneNumberScreen,
                              // );
                            },
                    ),
                    // verticalSpacer(MediaQuery.of(context).padding.bottom + 20),
                    verticalSpacer(10),
                    Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Got an account? ",
                              style: CustomTextStyles.semiBold(
                                fontSize: 16.sp,
                                color: CustomColors.greenTextColor,
                              ),
                            ),
                            TextSpan(
                              text: "Login",
                              style: CustomTextStyles.bold(
                                fontSize: 16.sp,
                                color: CustomColors.green500Color,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Spacer(),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          ConstantString.needHelpIcon,
                        ),
                        horizontalSpacer(10),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Need help? ",
                                style: CustomTextStyles.medium(
                                  fontSize: 12.sp,
                                  color: CustomColors.blackTextColor,
                                ),
                              ),
                              TextSpan(
                                text: "Contact Support",
                                style: CustomTextStyles.semiBold(
                                  fontSize: 12.sp,
                                  color: CustomColors.green500Color,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    verticalSpacer(MediaQuery.of(context).padding.bottom + 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
