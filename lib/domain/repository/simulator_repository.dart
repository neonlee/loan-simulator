import 'package:dartz/dartz.dart';
import 'package:ryspar/core/exceptions/failure.dart';
import 'package:ryspar/domain/entity/result_simulator_entity.dart';
import 'package:ryspar/domain/entity/simulation_entity.dart';

abstract class SimulatorRepository {
  Future<Either<Failure, ResultSimulatorEntity>> postSimulator(
      {required SimulationEntity simulationEntity});
}
