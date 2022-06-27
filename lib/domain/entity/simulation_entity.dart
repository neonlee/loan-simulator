class SimulationEntity {
  final String fullname;
  final String email;
  final int ltv;
  final double amount;
  final int term;
  final bool protectedToCollateral;
  SimulationEntity({
    required this.amount,
    required this.email,
    required this.fullname,
    required this.ltv,
    required this.protectedToCollateral,
    required this.term,
  });
}
