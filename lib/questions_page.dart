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
            child: Column(
              children: [
                Text(
                  'Daftar Soal',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Consumer<DataModel>(builder: (context, data, child) {
                  return Text('Kelas ${data.grade}');
                }),
                const SizedBox(
                  height: 16,
                ),
                Expanded(
                  child: Builder(builder: (context) {
                    return GridView.count(
                      crossAxisCount: 4,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      children: [],
                    );
                  }),
                ),
              ],
            ),
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
