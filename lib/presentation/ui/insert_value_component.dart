import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ryspar/core/constants/colors.dart';
import 'package:ryspar/core/routes/named_routes.dart';
import 'package:ryspar/presentation/component/button.dart';
import 'package:ryspar/presentation/store/simulator_store.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SimulatorStore simulatorStore = Provider.of(context);
    FocusNode focusNode = FocusNode();
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
            thumbShape: RoundSliderThumbShape(
              enabledThumbRadius: 0,
              pressedElevation: 0,
            ),
          ),
          child: Slider(
            value: 3,
            min: 1,
            max: 9,
            divisions: 3,
            onChanged: (double newValue) {},
            activeColor: CustomColors.green,
            inactiveColor: CustomColors.greyDark,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          focusNode.unfocus();
        },
        child: Form(
          key: simulatorStore.amountKey,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            const SizedBox(height: 32),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'De quanto ',
                                    style:
                                        Theme.of(context).textTheme.headline2,
                                  ),
                                  TextSpan(
                                    text: 'Você precisa?',
                                    style:
                                        Theme.of(context).textTheme.headline1,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Insira um valor entre',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                  TextSpan(
                                    text: ' R\$500,00 ',
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                  ),
                                  TextSpan(
                                    text: 'a',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                  TextSpan(
                                    text: ' R\$300.000,00 ',
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          focusNode: focusNode,
                          controller: simulatorStore.amountController,
                          validator: (value) {
                            if (value!.isNotEmpty && int.parse(value) > 499) {
                              return null;
                            } else {
                              return 'digite um numero maior que R\$499,99';
                            }
                          },
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                            color: CustomColors.green,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: InputDecoration(
                            focusColor: CustomColors.green,
                            prefixText: 'R\$',
                            prefixStyle: TextStyle(color: CustomColors.green),
                          ),
                        ),
                      ),
                      Button(
                        onPressed: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          if (simulatorStore.amountKey.currentState!
                              .validate()) {
                            Navigator.pushNamed(
                                context, NamedRoutes.parcelRoute);
                          }
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
