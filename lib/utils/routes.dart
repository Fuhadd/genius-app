import 'package:genius_app/constants/route_constants.dart';
import 'package:genius_app/home.dart';
import 'package:genius_app/login.dart';
import 'package:genius_app/models/screen_prop_models/activate_auto_form_model.dart';
import 'package:genius_app/models/screen_prop_models/add_dependency_form_model.dart';
import 'package:genius_app/models/screen_prop_models/auto_plan_details_model.dart';
import 'package:genius_app/models/screen_prop_models/auto_plans_model.dart';
import 'package:genius_app/models/screen_prop_models/buy_auto_plan_form_model.dart';
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
import 'package:genius_app/screens/plans/auto_plans/activate_auto_form_screen.dart';
import 'package:genius_app/screens/plans/auto_plans/auto_plan_details_screen.dart';
import 'package:genius_app/screens/plans/auto_plans/auto_plans_screen.dart';
import 'package:genius_app/screens/plans/auto_plans/auto_purchase_successful_screen.dart';
import 'package:genius_app/screens/plans/auto_plans/buy_auto_plan_form.dart';
import 'package:genius_app/screens/plans/auto_plans/confirm_vehicle_details_screen.dart';
import 'package:genius_app/screens/plans/auto_plans/manage_vehicles_screen.dart';
import 'package:genius_app/screens/plans/auto_plans/second_activate_auto_form_screen.dart';
import 'package:genius_app/screens/plans/auto_plans/select_plans_screen.dart';
import 'package:genius_app/screens/plans/auto_plans/vehicle_details_screen.dart';
import 'package:genius_app/screens/plans/buy_plans_screen.dart';
import 'package:genius_app/screens/plans/health_plans/add_dependant_form_screen.dart';
import 'package:genius_app/screens/plans/health_plans/add_dependant_screen.dart';
import 'package:genius_app/screens/plans/health_plans/auto_renewal_screen.dart';
import 'package:genius_app/screens/plans/health_plans/buy_dependant_slot_screen.dart';
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
import 'package:genius_app/stack.dart';
import 'package:genius_app/utils/enum.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  // initialLocation: RouteConstants.splash,
  // initialLocation: RouteConstants.dependantScreen,
  initialLocation: RouteConstants.bottomNavigationScreen,
  // initialLocation: RouteConstants.vehicleDetailsScreen,
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

    GoRoute(
      name: RouteConstants.buyPlansScreen,
      path: RouteConstants.buyPlansScreen,
      builder: (context, state) {
        return BuyPlansScreen();
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
      name: RouteConstants.autoPlansScreen,
      path: RouteConstants.autoPlansScreen,
      builder: (context, state) {
        final AutoPlansModel data = state.extra as AutoPlansModel;

        return AutoPlansScreen(data: data);
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
        return PaymentSuccessfulScreen();
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
      name: RouteConstants.selectAutoPlanScreen,
      path: RouteConstants.selectAutoPlanScreen,
      builder: (context, state) {
        return SelectAutoPlanScreen();
      },
    ),

    GoRoute(
      name: RouteConstants.autoPlanDetailsScreen,
      path: RouteConstants.autoPlanDetailsScreen,
      builder: (context, state) {
        final AutoPlanDetailsModel data = (state.extra ??
                AutoPlanDetailsModel(selectedPlan: AutoPlans.comprehensiveAuto))
            as AutoPlanDetailsModel;
        return AutoPlanDetailsScreen(data: data);
      },
    ),

    GoRoute(
      name: RouteConstants.buyAutoPlanFormScreen,
      path: RouteConstants.buyAutoPlanFormScreen,
      builder: (context, state) {
        final BuyAutoPlanFormModel data = (state.extra ??
                BuyAutoPlanFormModel(autoPlans: AutoPlans.comprehensiveAuto))
            as BuyAutoPlanFormModel;
        return BuyAutoPlanFormScreen(data: data);
      },
    ),

    GoRoute(
      name: RouteConstants.activateAutoFormScreen,
      path: RouteConstants.activateAutoFormScreen,
      builder: (context, state) {
        final ActivateAutoFormModel data = (state.extra ??
                ActivateAutoFormModel(autoPlan: AutoPlans.comprehensiveAuto))
            as ActivateAutoFormModel;
        return ActivateAutoFormScreen(data: data);
      },
    ),

    GoRoute(
      name: RouteConstants.secondActivateAutoFormScreen,
      path: RouteConstants.secondActivateAutoFormScreen,
      builder: (context, state) {
        final ActivateAutoFormModel data = (state.extra ??
                ActivateAutoFormModel(autoPlan: AutoPlans.comprehensiveAuto))
            as ActivateAutoFormModel;
        return SecondActivateAutoFormScreen(data: data);
      },
    ),

    GoRoute(
      name: RouteConstants.autoPurchaseSuccessfulScreen,
      path: RouteConstants.autoPurchaseSuccessfulScreen,
      builder: (context, state) {
        return AutoPurchaseSuccessfulScreen();
      },
    ),

    GoRoute(
      name: RouteConstants.manageVehiclesScreen,
      path: RouteConstants.manageVehiclesScreen,
      builder: (context, state) {
        return ManageVehiclesScreen();
      },
    ),

    GoRoute(
      name: RouteConstants.confirmVehicleDetailsScreen,
      path: RouteConstants.confirmVehicleDetailsScreen,
      builder: (context, state) {
        return ConfirmVehicleDetailsScreen();
      },
    ),

    GoRoute(
      name: RouteConstants.vehicleDetailsScreen,
      path: RouteConstants.vehicleDetailsScreen,
      builder: (context, state) {
        return VehicleDetailsScreen();
      },
    ),
  ],
);
