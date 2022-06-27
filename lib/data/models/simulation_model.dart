import 'package:ryspar/domain/entity/simulation_entity.dart';

class SimulatorModel extends SimulationEntity {
  SimulatorModel({
    required super.amount,
    required super.email,
    required super.fullname,
    required super.ltv,
    required super.protectedToCollateral,
    required super.term,
  });

  factory SimulatorModel.fromEntity(SimulationEntity entity) {
    return SimulatorModel(
      amount: entity.amount,
      email: entity.email,
      fullname: entity.fullname,
      ltv: entity.ltv,
      protectedToCollateral: entity.protectedToCollateral,
      term: entity.term,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "fullname": super.fullname,
      "email": super.email,
      "ltv": super.ltv,
      "amount": super.amount,
      "term": super.term,
      "has_protected_collateral": super.protectedToCollateral,
    };
  }
}
