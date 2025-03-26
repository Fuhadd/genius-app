enum AccountType {
  newAccount,
  existingAccount,
  companyAccount,
}

enum InsuranceType {
  gadget,
  travel,
  health,
  vehicle,
}

enum Gender {
  male,
  female,
}

enum PolicyUser { owner, major, minor, others }

enum WorkStatus {
  businessStaff,
  entrepreneur,
  freelancer,
  student,
  others,
}

enum VerificationMode {
  sms,
  whatsapp,
}

enum VehicleDetailsTab { vehicle, owner, claims, inspection }

enum HospitalCategory {
  all,
  hospital,
  eyecare,
  dental,
  pharmacy,
}

enum PlanSummaryType { changeCoverPeriod, planAdjustment, autoPlanSummary }

enum HealthPlans {
  flexicare,
  flexicareMini,
  zencare,
  zencarePlus,
  primecare,
  primecarePlus,
}

enum AutoPlans {
  comprehensiveAuto,
  miniComprehensive,
  thirdParty,
}

extension AutoPlansName on AutoPlans {
  String get description {
    switch (this) {
      case AutoPlans.comprehensiveAuto:
        return 'Comprehensive Auto';
      case AutoPlans.miniComprehensive:
        return 'Mini Comprehensive';
      case AutoPlans.thirdParty:
        return 'Third Party';
    }
  }
}

enum MakePaymentOptions {
  renewal,
  autoPurchase,
}

enum LoginMode {
  email,
  phone,
}

// enum PaymentMethod {
//   transfer,
//   ussd,
// }

enum RemoveDependantType {
  instant,
  awaiting,
}

enum NewDependantType {
  uniqueEmail,
  noUniqueEmail,
}

enum PaymentMethod {
  wallet,
  online,
}

enum DeactivatePlanReason {
  switching,
  dontWant,
  cantClaim,
}

// extension PaymentMethodName on PaymentMethod {
//   String get getName {
//     switch (this) {
//       case PaymentMethod.transfer:
//         return 'bank transfer';
//       case PaymentMethod.ussd:
//         return 'ussd';
//       default:
//         return "";
//     }
//   }
// }
