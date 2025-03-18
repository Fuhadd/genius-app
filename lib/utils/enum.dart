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

enum PolicyUser { owner, major, minor }

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

enum HospitalCategory {
  all,
  hospital,
  eyecare,
  dental,
  pharmacy,
}

enum PlanSummaryType {
  newPlanPurchase,
  changeCoverPeriod,
  planAdjustment,
}

enum HealthPlans {
  flexicare,
  flexicareMini,
  zencare,
  zencarePlus,
  primecare,
  primecarePlus,
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
