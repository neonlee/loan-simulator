import 'package:dartz/dartz.dart';
import 'package:ryspar/core/exceptions/failure.dart';
import 'package:ryspar/domain/entity/result_simulator_entity.dart';
import 'package:ryspar/domain/entity/simulation_entity.dart';
import 'package:ryspar/domain/repository/simulator_repository.dart';

class SimulatorUsecase {
  final SimulatorRepository _simulatorRepository;
  SimulatorUsecase(this._simulatorRepository);

  Future<Either<Failure, ResultSimulatorEntity>> call(
    SimulationEntity simulationEntity,
  ) async {
    return await _simulatorRepository.postSimulator(
        simulationEntity: simulationEntity);
  }
}
