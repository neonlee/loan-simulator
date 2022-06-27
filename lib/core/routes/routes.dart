import 'package:flutter/material.dart';
import 'package:ryspar/core/routes/named_routes.dart';
import 'package:ryspar/domain/entity/result_simulator_entity.dart';
import 'package:ryspar/presentation/ui/insert_value_component.dart';
import 'package:ryspar/presentation/ui/loading_screen.dart';
import 'package:ryspar/presentation/ui/result_page.dart';
import 'package:ryspar/presentation/ui/select.dart';
import 'package:ryspar/presentation/ui/start_component.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routes() {
    return {
      NamedRoutes.homePage: (context) => const FirstPage(),
      NamedRoutes.amountRoute: (context) => const SecondPage(),
      NamedRoutes.loadingRoute: (context) => const LoadingScreen(),
      NamedRoutes.parcelRoute: (context) => const SelectParcel(),
      NamedRoutes.resultRoute: (context) => ResultPage(
            resultSimulatorEntity: ModalRoute.of(context)!.settings.arguments
                as ResultSimulatorEntity,
          ),
    };
  }
}
