import 'package:genius_app/utils/enum.dart';

class PlanSummaryScreenModel {
  final PlanSummaryType planSummaryType;
  final AutoPlans? selectedAutoPlan;

  PlanSummaryScreenModel({
    required this.planSummaryType,
    this.selectedAutoPlan,
  });
}
