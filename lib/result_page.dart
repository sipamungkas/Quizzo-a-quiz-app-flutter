import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizzo/main.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context).size;
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          // automaticallyImplyLeading: false,
          title: const Text('Hasil akhir'),
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: theme.colorScheme.primary,
          titleTextStyle: theme.textTheme.headlineMedium
              ?.merge(const TextStyle(color: Colors.white)),
          // leading: Button,
        ),
        body: Builder(builder: (context) {
          return Consumer<DataModel>(builder: (context, data, child) {
            return SafeArea(
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  width: mediaQuery.width >= 1400 ? 1400 : double.infinity,
                  child: Center(
                    // Center is a layout widget. It takes a single child and positions it
                    // in the middle of the parent.
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Selamat Ragil, Anda telah menyelesaikan quiz!',
                          style: Theme.of(context).textTheme.bodyMedium?.merge(
                                const TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        const Text('Your Score is:'),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          data.score,
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.merge(TextStyle(
                                  color: Theme.of(context).primaryColor)),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        SizedBox(
                          width:
                              mediaQuery.width >= 768 ? 200 : double.infinity,
                          child: FilledButton(
                              onPressed: () {
                                Navigator.pushNamedAndRemoveUntil(
                                    context, '/', (route) => false);
                              },
                              child: const Text('Mulai Ulang')),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          });
        }),
      ),
    );
  }
}
