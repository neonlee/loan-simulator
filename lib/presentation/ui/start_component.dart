import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ryspar/core/routes/named_routes.dart';
import 'package:ryspar/presentation/component/button.dart';
import 'package:ryspar/presentation/store/simulator_store.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SimulatorStore simulatorStore = Provider.of(context);
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: simulatorStore.formKey,
          child: GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/bitcoin.png',
                                fit: BoxFit.cover,
                                alignment: Alignment.center,
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Simule ',
                                      style:
                                          Theme.of(context).textTheme.headline1,
                                    ),
                                    TextSpan(
                                      text: 'agora',
                                      style:
                                          Theme.of(context).textTheme.headline2,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Crédito rápido, fácil e seguro! :)',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              const SizedBox(height: 48),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Qual seu ',
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                    TextSpan(
                                      text: 'nome completo?',
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                    ),
                                  ],
                                ),
                              ),
                              TextFormField(
                                controller: simulatorStore.nameController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Digite seu nome completo';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                    hintText: 'Nome completo'),
                              ),
                              const SizedBox(height: 32),
                              RichText(
                                textAlign: TextAlign.start,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'E seu ',
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                    TextSpan(
                                      text: 'e-email?',
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                    ),
                                  ],
                                ),
                              ),
                              TextFormField(
                                controller: simulatorStore.emailController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Digite seu email';
                                  } else if (!value.contains(RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))) {
                                    return 'Digite um email válido';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                    hintText: 'seuemail@email.com'),
                              ),
                            ],
                          ),
                        ),
                        Button(
                          onPressed: () {
                            if (simulatorStore.formKey.currentState!
                                .validate()) {
                              Navigator.pushNamed(
                                  context, NamedRoutes.amountRoute);
                            }
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
