import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:quizzo/main.dart';
import 'package:quizzo/questions_page.dart';

class ChooseClass extends StatefulWidget {
  const ChooseClass({super.key});

  @override
  State<ChooseClass> createState() => _ChooseClassState();
}

class _ChooseClassState extends State<ChooseClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<DataModel>(
        builder: (context, data, child) {
          return SafeArea(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Hi ${data.name}',
                      style: Theme.of(context).textTheme.headlineMedium?.merge(
                            const TextStyle(fontWeight: FontWeight.w500),
                          ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Text(
                      'Please Select Your grade!',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.merge(const TextStyle(fontFamily: 'Poppins')),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                          onPressed: () {
                            data.updateGrade('10');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (builder) {
                                  return const QuestionsPage();
                                },
                              ),
                            );
                          },
                          child: const Text('Grade  10')),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                          onPressed: () {
                            data.updateGrade('11');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (builder) {
                                  return const QuestionsPage();
                                },
                              ),
                            );
                          },
                          child: const Text('Grade  11')),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                          onPressed: () {
                            data.updateGrade('12');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (builder) {
                                  return const QuestionsPage();
                                },
                              ),
                            );
                          },
                          child: const Text('Grade  12')),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
