class ResultSimulatorEntity {
  String? id;
  String? fullname;
  String? email;
  int? ltv;
  double? contractValue;
  double? netValue;
  double? installmentValue;
  double? lastInstallmentValue;
  double? iofFee;
  double? originationFee;
  int? term;
  int? collateral;
  double? collateralInBrl;
  double? collateralUnitPrice;
  String? firstDueDate;
  String? lastDueDate;
  double? interestRate;
  double? monthlyRate;
  double? annualRate;

  ResultSimulatorEntity({
    this.id,
    this.fullname,
    this.email,
    this.ltv,
    this.contractValue,
    this.netValue,
    this.installmentValue,
    this.lastInstallmentValue,
    this.iofFee,
    this.originationFee,
    this.term,
    this.collateral,
    this.collateralInBrl,
    this.collateralUnitPrice,
    this.firstDueDate,
    this.lastDueDate,
    this.interestRate,
    this.monthlyRate,
    this.annualRate,
  });
}
