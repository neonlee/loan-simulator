import 'package:flutter/material.dart';
import 'package:ryspar/domain/entity/result_simulator_entity.dart';
import 'package:ryspar/domain/entity/simulation_entity.dart';
import 'package:ryspar/domain/usecase/simulator_usecase.dart';

class SimulatorStore extends ChangeNotifier {
  final SimulatorUsecase _simulatorUsecase;
  final formKey = GlobalKey<FormState>();
  final amountKey = GlobalKey<FormState>();
  SimulatorStore(this._simulatorUsecase);

  int currentPage = 0;
  int ltv = 20;
  int term = 3;

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  bool protectedToCollateral = false;

  String error = '';

  ResultSimulatorEntity? resultSimulator;

  void pageChange(int page) {
    currentPage = page;
  }

  Future<void> sendSimulator() async {
    SimulationEntity simulationEntity = SimulationEntity(
      amount: double.parse(amountController.text),
      email: emailController.text,
      fullname: nameController.text,
      ltv: ltv,
      term: term,
      protectedToCollateral: protectedToCollateral,
    );
    var response = await _simulatorUsecase(simulationEntity);
    response.fold(
      (l) => error = l.message!,
      (r) => resultSimulator = r,
    );
  }

  onChangedLtv(double newValue) {
    ltv = newValue.toInt();
    notifyListeners();
  }

  onChangedTerm(double newValue) {
    term = newValue.toInt();
    notifyListeners();
  }

  void clearVariables() {
    currentPage = 0;
    ltv = 20;
    term = 3;
    protectedToCollateral = false;
    error = '';
    emailController.clear();
    nameController.clear();
    amountController.clear();
    resultSimulator = null;
    notifyListeners();
  }
}
