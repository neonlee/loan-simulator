import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ryspar/core/constants/colors.dart';
import 'package:ryspar/core/routes/named_routes.dart';
import 'package:ryspar/presentation/store/simulator_store.dart';

class SelectParcel extends StatefulWidget {
  const SelectParcel({
    Key? key,
  }) : super(key: key);

  @override
  State<SelectParcel> createState() => _SelectParcelState();
}

class _SelectParcelState extends State<SelectParcel> {
  @override
  Widget build(BuildContext context) {
    SimulatorStore simulatorStore = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
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
            value: 6,
            min: 1,
            max: 9,
            divisions: 3,
            onChanged: (double newValue) {},
            activeColor: CustomColors.green,
            inactiveColor: CustomColors.greyDark,
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Valor escolhido',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'R\$${simulatorStore.amountController.text}',
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(fontSize: 32),
                  ),
                  const SizedBox(height: 32),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Escolha a ',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        TextSpan(
                          text: 'quantidade de parcelas',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Slider(
                        value: simulatorStore.term.toDouble(),
                        min: 3,
                        max: 12,
                        divisions: 3,
                        onChanged: simulatorStore.onChangedTerm,
                        activeColor: CustomColors.green,
                        inactiveColor: CustomColors.greyDark,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('3'),
                            Text('6'),
                            Text('9'),
                            Text('12'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Escolha o ',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        TextSpan(
                          text: 'percentual de garantias',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Slider(
                          value: simulatorStore.ltv.toDouble(),
                          min: 20,
                          max: 50,
                          divisions: 2,
                          onChanged: simulatorStore.onChangedLtv,
                          activeColor: CustomColors.green,
                          inactiveColor: CustomColors.greyDark,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('20%'),
                              Text('35%'),
                              Text('50%'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'Garantia protegida',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Bitcoin caiu? Fique tranquilo! Na garantia protegida, você não recebe chamada de margem e não é liquidado.',
                          maxLines: 6,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Expanded(
                      child: Column(
                    children: [
                      Container(
                        alignment: Alignment.bottomCenter,
                        child: TextButton(
                          onPressed: () {
                            simulatorStore.protectedToCollateral = false;
                            Navigator.pushNamed(
                                context, NamedRoutes.loadingRoute);
                          },
                          child: const Text(
                            'Continuar sem garantia',
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          simulatorStore.protectedToCollateral = true;
                          Navigator.pushNamed(
                              context, NamedRoutes.loadingRoute);
                        },
                        child: const Text('Adicionar garantia'),
                      )
                    ],
                  ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
