import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ryspar/core/constants/colors.dart';
import 'package:ryspar/core/routes/named_routes.dart';
import 'package:ryspar/domain/entity/result_simulator_entity.dart';
import 'package:intl/intl.dart';
import 'package:ryspar/presentation/store/simulator_store.dart';

class ResultPage extends StatefulWidget {
  final ResultSimulatorEntity resultSimulatorEntity;
  const ResultPage({
    Key? key,
    required this.resultSimulatorEntity,
  }) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    SimulatorStore simulatorStore = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            simulatorStore.clearVariables();
            Navigator.pushNamedAndRemoveUntil(
                context, NamedRoutes.homePage, (route) => false);
          },
        ),
        title: SliderTheme(
          data: const SliderThemeData(
            thumbColor: Colors.transparent,
            disabledThumbColor: Colors.transparent,
            trackHeight: 1,
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0),
          ),
          child: Slider(
            value: 9,
            min: 1,
            max: 9,
            divisions: 3,
            onChanged: (double newValue) {},
            activeColor: CustomColors.green,
            inactiveColor: CustomColors.green,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              simulatorStore.clearVariables();

              Navigator.pushNamedAndRemoveUntil(
                  context, NamedRoutes.homePage, (route) => false);
            },
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                Expanded(
                  child: Text(
                    'Resultado da simulação',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('valor escolhido'),
                              Text(
                                'R\$${widget.resultSimulatorEntity.netValue!.toStringAsFixed(2)}',
                                style: Theme.of(context).textTheme.headline4,
                              )
                            ],
                          ),
                          divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Garantia'),
                              Text(
                                'R\$${widget.resultSimulatorEntity.collateral!.toStringAsFixed(2)}',
                                style: Theme.of(context).textTheme.headline4,
                              )
                            ],
                          ),
                          divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Taxa de juros'),
                              Text(
                                '${widget.resultSimulatorEntity.interestRate} % a.m',
                                style: Theme.of(context).textTheme.headline4,
                              )
                            ],
                          ),
                          divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Percentual de garantia'),
                              Text(
                                '${widget.resultSimulatorEntity.ltv}%',
                                style: Theme.of(context).textTheme.headline4,
                              )
                            ],
                          ),
                          divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Primeiro vencimento'),
                              Text(
                                DateFormat('dd/MM/yyyy').format(
                                  DateTime.parse(
                                    widget.resultSimulatorEntity.firstDueDate!,
                                  ),
                                ),
                                style: Theme.of(context).textTheme.headline4,
                              )
                            ],
                          ),
                          divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('IOF'),
                              Text(
                                'R\$${widget.resultSimulatorEntity.iofFee!.toStringAsFixed(2)}',
                                style: Theme.of(context).textTheme.headline4,
                              )
                            ],
                          ),
                          divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Tarifa da plataforma'),
                              Text(
                                'R\$${widget.resultSimulatorEntity.contractValue!.toStringAsFixed(2)}',
                                style: Theme.of(context).textTheme.headline4,
                              )
                            ],
                          ),
                          divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Total financiado'),
                              Text(
                                'R\$${widget.resultSimulatorEntity.contractValue!.toStringAsFixed(2)}',
                                style: Theme.of(context).textTheme.headline4,
                              )
                            ],
                          ),
                          divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('CET mensal'),
                              Text(
                                '${widget.resultSimulatorEntity.monthlyRate!.toStringAsFixed(2)}%',
                                style: Theme.of(context).textTheme.headline4,
                              )
                            ],
                          ),
                          divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('CET aunal'),
                              Text(
                                '${widget.resultSimulatorEntity.annualRate!.toStringAsFixed(2)}%',
                                style: Theme.of(context).textTheme.headline4,
                              )
                            ],
                          ),
                          divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Cotação do BTC'),
                              Text(
                                'R\$${widget.resultSimulatorEntity.collateralUnitPrice!.toStringAsFixed(2)}',
                                style: Theme.of(context).textTheme.headline4,
                              )
                            ],
                          ),
                          divider(),
                        ],
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: ElevatedButton(
                    onPressed: () {
                      simulatorStore.clearVariables();

                      Navigator.pushNamedAndRemoveUntil(
                          context, NamedRoutes.homePage, (route) => false);
                    },
                    child: const Text('Nova simulação'),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget divider() {
    return Container(
      padding: const EdgeInsets.only(top: 8),
      child: Divider(
        color: Colors.grey.shade200,
        thickness: 2,
      ),
    );
  }
}
