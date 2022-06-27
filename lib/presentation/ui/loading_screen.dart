import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ryspar/core/routes/named_routes.dart';
import 'package:ryspar/presentation/store/simulator_store.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late SimulatorStore simulatorStore;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      await simulatorStore.sendSimulator();
      if (simulatorStore.resultSimulator != null) {
        if (!mounted) return;
        Navigator.pushNamed(
          context,
          NamedRoutes.resultRoute,
          arguments: simulatorStore.resultSimulator!,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    simulatorStore = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (simulatorStore.error.isEmpty) ...[
              Text(
                'Aguarde um momento',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              const SizedBox(height: 8),
              Text(
                'Estamos simulando seu pedido de crédito Rispar...',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1,
                maxLines: 3,
              ),
            ] else
              Text(simulatorStore.error)
          ],
        ),
      ),
    );
  }
}
