import 'package:dartz/dartz.dart';
import 'package:ryspar/core/exceptions/failure.dart';
import 'package:ryspar/data/datasource/remote_datasource.dart';
import 'package:ryspar/domain/entity/result_simulator_entity.dart';
import 'package:ryspar/domain/entity/simulation_entity.dart';
import 'package:ryspar/domain/repository/simulator_repository.dart';

class SimulatorRepositoyImpl extends SimulatorRepository {
  final SimulatorRemoteDatasource simulatorDatasource;
  SimulatorRepositoyImpl(this.simulatorDatasource);
  @override
  Future<Either<Failure, ResultSimulatorEntity>> postSimulator(
      {required SimulationEntity simulationEntity}) async {
    try {
      return Right(await simulatorDatasource.postSimulator(simulationEntity));
    } catch (e) {
      return Left(Failure(
        message: 'ocorreu um erro ao criar sua simulação de empréstimo',
      ));
    }
  }
}
