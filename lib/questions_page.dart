import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizzo/main.dart';

import 'package:quizzo/models/question.dart';
import 'package:quizzo/widgets/question_option.dart';

class QuestionsPage extends StatefulWidget {
  const QuestionsPage({super.key});

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  int index = 0;

  void updateIndex(context, number) {
    setState(() {
      index = number;
    });
    Scaffold.of(context).closeDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Consumer<DataModel>(builder: (context, data, child) {
              return Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'Hi ${data.name}',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Saat ini kamu sedang mengerjakan soal untuk kelas',
                          style: Theme.of(context).textTheme.bodyMedium,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        Text('Kelas ${data.grade}'),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Builder(builder: (context) {
                      return OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                              color: Theme.of(context).colorScheme.primary),
                        ),
                        child: Text(
                          'close',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      );
                    }),
                  )
                ],
              );
            }),
          ),
        ),
      ),
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: Text('Soal Nomor ${(index + 1).toString()}'),
        centerTitle: true,
        // leading: Button,
      ),
      body: Consumer<DataModel>(builder: (context, data, child) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(questionList[index].question),
                  const SizedBox(
                    height: 24,
                  ),
                  QuestionOption(optionList: questionList[index].optionList),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FilledButton(
                        onPressed: index == 0
                            ? null
                            : () {
                                updateIndex(context, index - 1);
                              },
                        child: const Text('Sebelumnya'),
                      ),
                      FilledButton(
                        onPressed: () {
                          updateIndex(context, index + 1);
                        },
                        child: Text(index == 1 ? 'Selesai' : 'Selanjutnya'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
