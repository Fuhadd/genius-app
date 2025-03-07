// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:genius_app/constants/custom_colors.dart';
// import 'package:genius_app/constants/custom_string.dart';
// import 'package:genius_app/constants/route_constants.dart';
// import 'package:genius_app/utils/enum.dart';
// import 'package:genius_app/utils/spacers.dart';
// import 'package:genius_app/widgets/animated_list_selector.dart';
// import 'package:genius_app/widgets/custom_button.dart';
// import 'package:genius_app/widgets/custom_text_widget.dart';
// import 'package:go_router/go_router.dart';

// class SelectAccountType extends StatefulWidget {
//   const SelectAccountType({super.key});

//   @override
//   State<SelectAccountType> createState() => _SelectAccountTypeState();
// }

// class _SelectAccountTypeState extends State<SelectAccountType> {
//   AccountType? accountType;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20.0),
//         child: Column(
//           children: [
//             verticalSpacer(MediaQuery.of(context).padding.top + 20),
//             Center(
//               child: Image.asset(
//                 ConstantString.geniusLogoGreen,
//                 height: 43,
//               ),
//             ),
//             verticalSpacer(40.h),
//             boldText(
//               'Who are you signing up as?',
//               fontSize: 24.sp,
//               color: CustomColors.green400Color,
//               textAlign: TextAlign.center,
//               letterSpacing: 0,
//             ),
//             verticalSpacer(12.h),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 30.0),
//               child: mediumText(
//                 'Select the option that fits you best to get started.',
//                 fontSize: 16.sp,
//                 color: CustomColors.greenTextColor,
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             verticalSpacer(40.h),
//             ListOptionsContainer(
//               title: "I’m new here",
//               subTitle: "Ready to create an account & get covered.",
//               icon: ConstantString.newProfileDark,
//               selectedIcon: ConstantString.newProfileColor,
//               isSelected: accountType == AccountType.newAccount,
//               onTap: () => setState(() {
//                 accountType = AccountType.newAccount;
//               }),
//             ),
//             verticalSpacer(20),
//             ListOptionsContainer(
//               title: "I have an account",
//               subTitle: "I want to login to my dashboard.",
//               icon: ConstantString.existingProfileDark,
//               selectedIcon: ConstantString.existingProfileColor,
//               isSelected: accountType == AccountType.existingAccount,
//               onTap: () => setState(() {
//                 accountType = AccountType.existingAccount;
//               }),
//             ),
//             verticalSpacer(20),
//             ListOptionsContainer(
//               title: "I was gifted a plan",
//               subTitle: "I want to log in as a staff / dependant",
//               icon: ConstantString.companyProfileDark,
//               selectedIcon: ConstantString.companyProfileColor,
//               isSelected: accountType == AccountType.companyAccount,
//               onTap: () => setState(() {
//                 accountType = AccountType.companyAccount;
//               }),
//             ),

//             Spacer(),
//             CustomButton(
//                 title: 'Continue',
//                 onTap: accountType == null
//                     ? null
//                     : () {
//                         if (accountType == AccountType.newAccount) {
//                           context
//                               .pushNamed(RouteConstants.mainOnboardingScreen);
//                         } else if (accountType == AccountType.existingAccount) {
//                           context.pushNamed(RouteConstants.loginScreen);
//                         } else if (accountType == AccountType.companyAccount) {
//                           context.pushNamed(
//                               RouteConstants.businessStaffLoginScreen);
//                         }
//                       }),
//             Spacer(),
//             // verticalSpacer(MediaQuery.of(context).padding.bottom + 20),
//           ],
//         ),
//       ),
//     );
//   }
// }
