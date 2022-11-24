import 'package:wax_milling_cnc_supervisor/models/machine.dart';

enum ActiveFilter {all, activeOnly, inactiveOnly}

extension ActiveFilterX on ActiveFilter {
  bool apply(Machine machine) {
    switch (this) {
      case ActiveFilter.all:
        return true;
      case ActiveFilter.activeOnly:
        return machine.isActive;
      case ActiveFilter.inactiveOnly:
        return !machine.isActive;
    }
  }
}

enum WorkingFilter {all, workingOnly, notWorkingOnly}

extension WorkingFilterX on WorkingFilter {
  bool apply(Machine machine) {
    switch (this) {
      case WorkingFilter.all:
        return true;
      case WorkingFilter.workingOnly:
        return machine.isWorking;
      case WorkingFilter.notWorkingOnly:
        return !machine.isWorking;
    }
  }
}

enum ToolConditionFilter {all, unwornOnly, wornOnly}

extension ToolConditionFilterX on ToolConditionFilter {
  bool apply(Machine machine) {
    switch (this) {
      case ToolConditionFilter.all:
        return true;
      case ToolConditionFilter.unwornOnly:
        return machine.toolCondition == WornType.unworn;
      case ToolConditionFilter.wornOnly:
        return machine.toolCondition == WornType.worn;
    }
  }
}