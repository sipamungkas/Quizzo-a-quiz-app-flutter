import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizzo/main.dart';

import 'package:quizzo/models/question.dart';
import 'package:quizzo/widgets/question_option.dart';

import 'widgets/drawer_mobile.dart';
import 'dart:developer';

class QuestionsPage extends StatefulWidget {
  const QuestionsPage({super.key});

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  int index = 0;
  List<Answer> answer = List.generate(
    questionList.length,
    (index) => Answer(number: index, optionIndex: -1, isKey: false),
  );
  int selectedOption = -1;
  bool isTrue = false;

  void updateIndex(number, selectedAnswer) {
    setState(() {
      index = number;
      isTrue = false;
      selectedOption = selectedAnswer;
    });
  }

  void updateAnswer(number, optionIndex, isKey) {
    setState(() {
      answer[index] =
          Answer(number: number, optionIndex: optionIndex, isKey: isKey);
    });
    log('answer: $answer');
  }

  void navigatoToResult(context) {
    var correctAnswer = answer.where((element) => element.isKey == true);
    final double result = correctAnswer.length / answer.length * 100;
    Provider.of<DataModel>(context, listen: false)
        .updateResult(result.toStringAsFixed(2));
    Navigator.pushNamed(context, '/result');
  }

  void updateSelectedOption(optionIndex, isTrue) {
    setState(() {
      selectedOption = optionIndex;
      isTrue = isTrue;
    });
    updateAnswer(index, selectedOption, isTrue);
  }

  void onPressed() {
    // updateAnswer(index, selectedOption, isTrue);
    if (index == questionList.length - 1) {
      navigatoToResult(context);
    } else {
      updateIndex(index + 1, -1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMobile(answer: answer, updateIndex: updateIndex),
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
                  if (questionList[index].image != '')
                    Card(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(
                          questionList[index].image!,
                          // fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  const SizedBox(
                    height: 16,
                  ),
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
                      child: Text(index == questionList.length - 1
                          ? 'Selesai'
                          : 'Selanjutnya'),
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
