import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizzo/main.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: const Text('Hasil akhir'),
        centerTitle: true,
        // leading: Button,
      ),
      body: Builder(builder: (context) {
        return Consumer<DataModel>(builder: (context, data, child) {
          return SafeArea(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Center(
                // Center is a layout widget. It takes a single child and positions it
                // in the middle of the parent.
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Congratulations Ragil!',
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
                      style: Theme.of(context).textTheme.headlineLarge?.merge(
                          TextStyle(color: Theme.of(context).primaryColor)),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
      }),
    );
  }
}
