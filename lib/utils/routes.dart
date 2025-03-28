import 'package:genius_app/constants/route_constants.dart';
import 'package:genius_app/home.dart';
import 'package:genius_app/login.dart';
import 'package:genius_app/models/screen_prop_models/add_dependency_form_model.dart';
import 'package:genius_app/models/screen_prop_models/dependant_added_model.dart';
import 'package:genius_app/models/screen_prop_models/health_plans_model.dart';
import 'package:genius_app/models/screen_prop_models/plan_summary_model.dart';
import 'package:genius_app/models/screen_prop_models/send_activation_email_model.dart';
import 'package:genius_app/profile.dart';
import 'package:genius_app/screens/huiii/Fade_transition_screen.dart';
import 'package:genius_app/screens/huiii/bottom_nav_screen.dart';
import 'package:genius_app/screens/huiii/main_screen.dart';
import 'package:genius_app/screens/initialization/splash_screen.dart';
import 'package:genius_app/screens/onboarding/Login/business_staff_login_screen.dart';
import 'package:genius_app/screens/onboarding/Login/login_screen.dart';
import 'package:genius_app/screens/onboarding/account_verified_screen.dart';
import 'package:genius_app/screens/onboarding/forgot_password/forgot_password_screen.dart';
import 'package:genius_app/screens/onboarding/main_onboarding_screen.dart';
import 'package:genius_app/screens/onboarding/onboarding_page_view.dart';
import 'package:genius_app/screens/onboarding/plain_set_password_screen.dart';
import 'package:genius_app/screens/onboarding/plain_verify_otp_screen.dart';
import 'package:genius_app/screens/onboarding/second_onboarding_screen.dart';
import 'package:genius_app/screens/plans/health_plans/activate_plan/activate_plan_comfirm_policy_screen.dart.dart';
import 'package:genius_app/screens/plans/health_plans/activate_plan/activate_plan_screen.dart';
import 'package:genius_app/screens/plans/health_plans/add_dependant_form_screen.dart';
import 'package:genius_app/screens/plans/health_plans/add_dependant_screen.dart';
import 'package:genius_app/screens/plans/health_plans/auto_renewal_screen.dart';
import 'package:genius_app/screens/plans/health_plans/buy_dependant_slot_screen.dart';
import 'package:genius_app/screens/plans/health_plans/buy_plan/buy_plan_screen.dart';
import 'package:genius_app/screens/plans/health_plans/buy_plan/health_plan_overview_screen.dart';
import 'package:genius_app/screens/plans/health_plans/buy_plan/coverage_type_options_screen.dart';
import 'package:genius_app/screens/plans/health_plans/buy_plan/select_coverage_type_screen.dart';
import 'package:genius_app/screens/plans/health_plans/buy_plan/select_plan_screen.dart';
import 'package:genius_app/screens/plans/health_plans/buy_plan/upload__image_screen.dart';
import 'package:genius_app/screens/plans/health_plans/change_plans_screen.dart';
import 'package:genius_app/screens/plans/health_plans/compare_plans_table_screen.dart';
import 'package:genius_app/screens/plans/health_plans/deactivate_plan_screen.dart';
import 'package:genius_app/screens/plans/health_plans/dependant_added_screen.dart';
import 'package:genius_app/screens/plans/health_plans/dependant_screen.dart';
import 'package:genius_app/screens/plans/health_plans/edit_plan_screen.dart';
import 'package:genius_app/screens/plans/health_plans/edit_plan_summary_screen.dart';
import 'package:genius_app/screens/plans/health_plans/health_plans_screen.dart';
import 'package:genius_app/screens/plans/health_plans/hospital_details_screen.dart';
import 'package:genius_app/screens/plans/health_plans/manage_policies_screen.dart';
import 'package:genius_app/screens/plans/health_plans/payment_successful_screen.dart';
import 'package:genius_app/screens/plans/health_plans/plan_duration_screen.dart';
import 'package:genius_app/screens/plans/health_plans/plan_history_screen.dart';
import 'package:genius_app/screens/plans/health_plans/plan_summary_screen.dart';
import 'package:genius_app/screens/plans/health_plans/plan_usage_screen.dart';
import 'package:genius_app/screens/plans/health_plans/renew_plan_ahead_screen.dart';
import 'package:genius_app/screens/plans/health_plans/renewal_successful_screen.dart';
import 'package:genius_app/screens/plans/health_plans/send_activation_email_screen.dart';
import 'package:genius_app/screens/plans/health_plans/upload_dependant_image_screen.dart';
import 'package:genius_app/screens/plans/health_plans/visit_hospital_screen.dart';
import 'package:genius_app/screens/plans/my_plans_screen.dart';
import 'package:genius_app/screens/plans/travel_plans/buy_plan/select_plan_screen.dart';
import 'package:genius_app/stack.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  // initialLocation: RouteConstants.splash,
  // initialLocation: RouteConstants.dependantScreen,
  initialLocation: RouteConstants.bottomNavigationScreen,
  // initialLocation: RouteConstants.hospitalDetailsScreen,
  // initialLocation: RouteConstants.myPlansScreen,

  routes: <RouteBase>[
    GoRoute(
      name: RouteConstants.home,
      path: RouteConstants.home,
      builder: (context, state) {
        return const HomePage();
      },
      routes: [
        GoRoute(
          name: RouteConstants.stackLogin,
          path: RouteConstants.stackLogin,
          builder: (context, state) {
            return StackLogin();
          },
        ),
      ],
    ),
    GoRoute(
      name: RouteConstants.login,
      path: RouteConstants.login,
      builder: (context, state) {
        return const LoginPage();
      },
    ),
    GoRoute(
      name: RouteConstants.profile,
      path: RouteConstants.profile,
      builder: (context, state) {
        final String userName = state.extra as String;
        return ProfilePage(
          userName: userName,
        );
      },
    ),

    ////
    GoRoute(
      name: RouteConstants.splash,
      path: RouteConstants.splash,
      builder: (context, state) {
        return SplashScreen();
      },
    ),
    GoRoute(
      name: RouteConstants.onboardingPageView,
      path: RouteConstants.onboardingPageView,
      builder: (context, state) {
        return OnboardingPageViewScreen();
      },
    ),
    // GoRoute(
    //   name: RouteConstants.selectAccountType,
    //   path: RouteConstants.selectAccountType,
    //   builder: (context, state) {
    //     return SelectAccountType();
    //   },
    // ),
    GoRoute(
      name: RouteConstants.mainScreen,
      path: RouteConstants.mainScreen,
      builder: (context, state) {
        return MainScreen();
      },
    ),
    GoRoute(
      name: RouteConstants.bottomNavigationScreen,
      path: RouteConstants.bottomNavigationScreen,
      builder: (context, state) {
        return BottomNavigationScreen();
      },
    ),

    // GoRoute(
    //   name: RouteConstants.createAccountScreen,
    //   path: RouteConstants.createAccountScreen,
    //   builder: (context, state) {
    //     return CreateAccountScreen();
    //   },
    // ),
    // GoRoute(
    //   name: RouteConstants.phoneNumberScreen,
    //   path: RouteConstants.phoneNumberScreen,
    //   builder: (context, state) {
    //     return PhoneNumberScreen();
    //   },
    // ),

    GoRoute(
      name: RouteConstants.verifyOtpScreen,
      path: RouteConstants.verifyOtpScreen,
      builder: (context, state) {
        return PlainVerifyOtpScreen();
      },
    ),

    GoRoute(
      name: RouteConstants.setPasswordScreen,
      path: RouteConstants.setPasswordScreen,
      builder: (context, state) {
        return PlainSetPasswordScreen();
      },
    ),

    GoRoute(
      name: RouteConstants.accountVerifiedScreen,
      path: RouteConstants.accountVerifiedScreen,
      builder: (context, state) {
        return AccountVerifiedScreen();
      },
    ),
    // GoRoute(
    //   name: RouteConstants.insuranceTypeScreen,
    //   path: RouteConstants.insuranceTypeScreen,
    //   builder: (context, state) {
    //     return InsuranceTypeScreen();
    //   },
    // ),

    // GoRoute(
    //   name: RouteConstants.genderSelectScreen,
    //   path: RouteConstants.genderSelectScreen,
    //   builder: (context, state) {
    //     return GenderSelectScreen();
    //   },
    // ),

    // GoRoute(
    //   name: RouteConstants.workStatusScreen,
    //   path: RouteConstants.workStatusScreen,
    //   builder: (context, state) {
    //     return WorkStatusScreen();
    //   },
    // ),

    // GoRoute(
    //   name: RouteConstants.workTypeScreen,
    //   path: RouteConstants.workTypeScreen,
    //   builder: (context, state) {
    //     return WorkTypeScreen();
    //   },
    // ),
    // GoRoute(
    //   name: RouteConstants.familyStatusScreen,
    //   path: RouteConstants.familyStatusScreen,
    //   builder: (context, state) {
    //     return FamilyStatusScreen();
    //   },
    // ),
    // GoRoute(
    //   name: RouteConstants.routineScreen,
    //   path: RouteConstants.routineScreen,
    //   builder: (context, state) {
    //     return RoutineScreen();
    //   },
    // ),
    GoRoute(
      name: RouteConstants.loginScreen,
      path: RouteConstants.loginScreen,
      builder: (context, state) {
        return LoginScreen();
      },
    ),
    GoRoute(
      name: RouteConstants.forgotPasswordScreen,
      path: RouteConstants.forgotPasswordScreen,
      builder: (context, state) {
        return ForgotPasswordScreen();
      },
    ),

    GoRoute(
      name: RouteConstants.mainOnboardingScreen,
      path: RouteConstants.mainOnboardingScreen,
      builder: (context, state) {
        return MainOnboardingScreen();
      },
    ),

    GoRoute(
      name: RouteConstants.selectAccountType,
      path: RouteConstants.selectAccountType,
      pageBuilder: (context, state) {
        return FadePageTransition(
          child: const SelectAccountType(),
          name: state.name,
          arguments: state.extra,
        );
      },
    ),

    GoRoute(
      name: RouteConstants.secondOnboardingScreen,
      path: RouteConstants.secondOnboardingScreen,
      builder: (context, state) {
        return SecondOnboardingScreen();
      },
    ),

//     // 2. Update your GoRouter configuration to use the custom transition
// // Add this to your router configuration
//     GoRoute(
//       name: RouteConstants.secondOnboardingScreen,
//       path: '/second-onboarding',
//       pageBuilder: (context, state) {
//         return FadePageTransition(
//           child: const SecondOnboardingScreen(), // Make sure this widget exists
//           name: state.name,
//           arguments: state.extra,
//         );
//       },
//     ),

    GoRoute(
      name: RouteConstants.businessStaffLoginScreen,
      path: RouteConstants.businessStaffLoginScreen,
      builder: (context, state) {
        return BusinessStaffLoginScreen();
      },
    ),

    GoRoute(
      name: RouteConstants.myPlansScreen,
      path: RouteConstants.myPlansScreen,
      builder: (context, state) {
        return MyPlansScreen();
      },
    ),

    GoRoute(
      name: RouteConstants.healthPlansScreen,
      path: RouteConstants.healthPlansScreen,
      builder: (context, state) {
        final HealthPlansModel data = state.extra as HealthPlansModel;

        return HealthPlansScreen(data: data);
      },
    ),

    GoRoute(
      name: RouteConstants.managePoliciesScreen,
      path: RouteConstants.managePoliciesScreen,
      builder: (context, state) {
        return ManagePoliciesScreen();
      },
    ),

    GoRoute(
      name: RouteConstants.dependantScreen,
      path: RouteConstants.dependantScreen,
      builder: (context, state) {
        return DependantScreen();
      },
    ),

    GoRoute(
      name: RouteConstants.addDependantScreen,
      path: RouteConstants.addDependantScreen,
      builder: (context, state) {
        return AddDependantScreen();
      },
    ),

    GoRoute(
      name: RouteConstants.addDependantFormScreen,
      path: RouteConstants.addDependantFormScreen,
      builder: (context, state) {
        final AddDependencyFormModel data =
            state.extra as AddDependencyFormModel;

        return AddDependantFormScreen(data: data);
      },
    ),

    GoRoute(
      name: RouteConstants.sendActivationEmailScreen,
      path: RouteConstants.sendActivationEmailScreen,
      builder: (context, state) {
        final SendActivationEmailModel data =
            state.extra as SendActivationEmailModel;

        return SendActivationEmailScreen(data: data);
      },
    ),

    GoRoute(
      name: RouteConstants.dependantAddedScreen,
      path: RouteConstants.dependantAddedScreen,
      builder: (context, state) {
        final DependantAddedModel data = state.extra as DependantAddedModel;
        return DependantAddedScreen(data: data);
      },
    ),
    GoRoute(
      name: RouteConstants.uploadDependantImageScreen,
      path: RouteConstants.uploadDependantImageScreen,
      builder: (context, state) {
        return UploadDependantImageScreen();
      },
    ),

    GoRoute(
      name: RouteConstants.buyDependantSlotScreen,
      path: RouteConstants.buyDependantSlotScreen,
      builder: (context, state) {
        return BuyDependantSlotScreen();
      },
    ),

    GoRoute(
      name: RouteConstants.planSummaryScreen,
      path: RouteConstants.planSummaryScreen,
      builder: (context, state) {
        final PlanSummaryScreenModel data =
            state.extra as PlanSummaryScreenModel;
        return PlanSummaryScreen(data: data);
      },
    ),

    GoRoute(
      name: RouteConstants.paymentSuccessfulScreen,
      path: RouteConstants.paymentSuccessfulScreen,
      builder: (context, state) {
        final PlanSummaryScreenModel data =
            state.extra as PlanSummaryScreenModel;
        return PaymentSuccessfulScreen(
          data: data,
        );
      },
    ),
    GoRoute(
      name: RouteConstants.planUsageScreen,
      path: RouteConstants.planUsageScreen,
      builder: (context, state) {
        return PlanUsageScreen();
      },
    ),

    GoRoute(
      name: RouteConstants.editPlanScreen,
      path: RouteConstants.editPlanScreen,
      builder: (context, state) {
        return EditPlanScreen();
      },
    ),

    GoRoute(
      name: RouteConstants.planDurationScreen,
      path: RouteConstants.planDurationScreen,
      builder: (context, state) {
        return PlanDurationScreen();
      },
    ),

    GoRoute(
      name: RouteConstants.editPlanSummaryScreen,
      path: RouteConstants.editPlanSummaryScreen,
      builder: (context, state) {
        return EditPlanSummaryScreen();
      },
    ),
    GoRoute(
      name: RouteConstants.autoRenewalScreen,
      path: RouteConstants.autoRenewalScreen,
      builder: (context, state) {
        return AutoRenewalScreen();
      },
    ),

    GoRoute(
      name: RouteConstants.deactivatePlanScreen,
      path: RouteConstants.deactivatePlanScreen,
      builder: (context, state) {
        return DeactivatePlanScreen();
      },
    ),

    GoRoute(
      name: RouteConstants.planHistoryScreen,
      path: RouteConstants.planHistoryScreen,
      builder: (context, state) {
        return PlanHistoryScreen();
      },
    ),

    GoRoute(
      name: RouteConstants.renewPlanAheadScreen,
      path: RouteConstants.renewPlanAheadScreen,
      builder: (context, state) {
        return RenewPlanAheadScreen();
      },
    ),

    GoRoute(
      name: RouteConstants.renewalSuccessfulScreen,
      path: RouteConstants.renewalSuccessfulScreen,
      builder: (context, state) {
        return RenewalSuccessfulScreen();
      },
    ),
    GoRoute(
      name: RouteConstants.changePlansScreen,
      path: RouteConstants.changePlansScreen,
      builder: (context, state) {
        return ChangePlansScreen();
      },
    ),

    GoRoute(
      name: RouteConstants.comparePlansTableScreen,
      path: RouteConstants.comparePlansTableScreen,
      builder: (context, state) {
        return ComparePlansTableScreen();
      },
    ),

    GoRoute(
      name: RouteConstants.visitHospitalScreen,
      path: RouteConstants.visitHospitalScreen,
      builder: (context, state) {
        return VisitHospitalScreen();
      },
    ),

    GoRoute(
      name: RouteConstants.hospitalDetailsScreen,
      path: RouteConstants.hospitalDetailsScreen,
      builder: (context, state) {
        return HospitalDetailsScreen();
      },
    ),

    GoRoute(
      name: RouteConstants.selectHealthPlanScreen,
      path: RouteConstants.selectHealthPlanScreen,
      builder: (context, state) {
        return SelectHealthPlanScreen();
      },
    ),
    GoRoute(
      name: RouteConstants.buyPlanScreen,
      path: RouteConstants.buyPlanScreen,
      builder: (context, state) {
        return BuyPlanScreen();
      },
    ),
    GoRoute(
      name: RouteConstants.healthPlanOverviewScreen,
      path: RouteConstants.healthPlanOverviewScreen,
      builder: (context, state) {
        return HealthPlanOverviewScreen();
      },
    ),
    GoRoute(
      name: RouteConstants.selectCoverageTypeScreen,
      path: RouteConstants.selectCoverageTypeScreen,
      builder: (context, state) {
        return SelectCoverageTypeScreen();
      },
    ),
    GoRoute(
      name: RouteConstants.coverageTypeOptionsScreen,
      path: RouteConstants.coverageTypeOptionsScreen,
      builder: (context, state) {
        return CoverageTypeOptionsScreen();
      },
    ),
    GoRoute(
      name: RouteConstants.activatePlanScreen,
      path: RouteConstants.activatePlanScreen,
      builder: (context, state) {
        return ActivatePlanScreen();
      },
    ),
    GoRoute(
      name: RouteConstants.uploadImageScreen,
      path: RouteConstants.uploadImageScreen,
      builder: (context, state) {
        return UploadImageScreen();
      },
    ),
    GoRoute(
      name: RouteConstants.activatePlanConfirmPolicyScreen,
      path: RouteConstants.activatePlanConfirmPolicyScreen,
      builder: (context, state) {
        final SendActivationEmailModel data =
            state.extra as SendActivationEmailModel;

        return ActivatePlanConfirmPolicyScreen(data: data);
      },
    ),
     GoRoute(
      name: RouteConstants.selectTravelPlanScreen,
      path: RouteConstants.selectTravelPlanScreen,
      builder: (context, state) {

        return SelectTravelPlanScreen();
      },
    ),
  ],
);
