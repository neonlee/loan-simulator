import 'package:ryspar/core/constants/named_urls.dart';
import 'package:ryspar/data/models/result_simulator_model.dart';
import 'package:ryspar/data/models/simulation_model.dart';
import 'package:ryspar/domain/entity/result_simulator_entity.dart';
import 'package:ryspar/domain/entity/simulation_entity.dart';
import 'package:ryspar/infra/http_client.dart';

class SimulatorRemoteDatasource {
  final HttpClient _httpClient;

  SimulatorRemoteDatasource(this._httpClient);

  Future<ResultSimulatorEntity> postSimulator(
      SimulationEntity simulationEntity) async {
    try {
      var response = await _httpClient.post(
        NamedUrls.postSimulator,
        data: SimulatorModel.fromEntity(simulationEntity).toJson(),
      );
      return ResultSimulatorModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
