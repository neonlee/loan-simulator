import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ryspar/core/routes/named_routes.dart';
import 'package:ryspar/core/routes/routes.dart';
import 'package:ryspar/core/ui/theme_data.dart';
import 'package:ryspar/data/datasource/remote_datasource.dart';
import 'package:ryspar/data/repository/simulator_repository_impl.dart';
import 'package:ryspar/domain/repository/simulator_repository.dart';
import 'package:ryspar/domain/usecase/simulator_usecase.dart';
import 'package:ryspar/infra/http_client.dart';
import 'package:ryspar/presentation/store/simulator_store.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      builder: (context, widget) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: CustomThemeData.themeData(),
          initialRoute: NamedRoutes.homePage,
          routes: Routes.routes(),
        );
      },
      providers: [
        Provider(create: (_) => HttpClient()),
        Provider(
            create: (context) => SimulatorRemoteDatasource(context.read())),
        Provider<SimulatorRepository>(
          create: (context) => SimulatorRepositoyImpl(context.read()),
        ),
        Provider<SimulatorUsecase>(
          create: (context) => SimulatorUsecase(context.read()),
        ),
        ChangeNotifierProvider(
          create: (context) => SimulatorStore(context.read()),
        ),
      ],
    );
  }
}
