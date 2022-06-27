import 'package:ryspar/domain/entity/result_simulator_entity.dart';

class ResultSimulatorModel extends ResultSimulatorEntity {
  ResultSimulatorModel({
    super.id,
    super.fullname,
    super.email,
    super.ltv,
    super.contractValue,
    super.netValue,
    super.installmentValue,
    super.lastInstallmentValue,
    super.iofFee,
    super.originationFee,
    super.term,
    super.collateral,
    super.collateralInBrl,
    super.collateralUnitPrice,
    super.firstDueDate,
    super.lastDueDate,
    super.interestRate,
    super.monthlyRate,
    super.annualRate,
  });

  ResultSimulatorModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullname = json['fullname'];
    email = json['email'];
    ltv = json['ltv'];
    contractValue = json['contract_value'];
    netValue = json['net_value'];
    installmentValue = json['installment_value'];
    lastInstallmentValue = json['last_installment_value'];
    iofFee = json['iof_fee'];
    originationFee = json['origination_fee'];
    term = json['term'];
    collateral = json['collateral'];
    collateralInBrl = json['collateral_in_brl'];
    collateralUnitPrice = json['collateral_unit_price'];
    firstDueDate = json['first_due_date'];
    lastDueDate = json['last_due_date'];
    interestRate = json['interest_rate'];
    monthlyRate = json['monthly_rate'];
    annualRate = json['annual_rate'];
  }
}
