import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizzo/main.dart';

import 'package:quizzo/models/question.dart';
import 'package:quizzo/widgets/question_option.dart';

import 'widgets/drawer_mobile.dart';

class QuestionsPage extends StatefulWidget {
  const QuestionsPage({super.key});

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  int index = 0;
  List<Map> answer = List.filled(2, {});
  int selectedOption = -1;

  void updateIndex(number) {
    setState(() {
      index = number;
    });
  }

  void updateAnswer(number, optionIndex) {
    setState(() {
      answer[index] = {'number': number, 'optionIndex': optionIndex};
      selectedOption = -1;
    });
  }

  void navigatoToResult(context) {
    Provider.of<DataModel>(context, listen: false)
        .updateResult(answer.length.toString());
    Navigator.pushNamed(context, '/result');
  }

  void updateSelectedOption(optionIndex) {
    setState(() {
      selectedOption = optionIndex;
    });
  }

  void onPressed() {
    updateAnswer(1, selectedOption);
    if (index == 1) {
      navigatoToResult(context);
    } else {
      updateIndex(index + 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerMobile(),
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
                  QuestionOption(
                    optionList: questionList[index].optionList,
                    selectedIndex: selectedOption,
                    updateSelectedOption: updateSelectedOption,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: selectedOption != -1 ? onPressed : null,
                      child: Text(index == 1 ? 'Selesai' : 'Selanjutnya'),
                    ),
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
