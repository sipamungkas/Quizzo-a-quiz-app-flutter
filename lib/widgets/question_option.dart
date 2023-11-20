import 'package:flutter/material.dart';
import 'package:quizzo/models/question.dart';
import 'package:quizzo/widgets/question_item.dart';

class QuestionOption extends StatefulWidget {
  final List<OptionItem> optionList;

  const QuestionOption({Key? key, required this.optionList}) : super(key: key);

  @override
  State<QuestionOption> createState() => _QuestionOptionState();
}

class _QuestionOptionState extends State<QuestionOption> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.optionList
          .asMap()
          .entries
          .map(
            (entry) => Item(
              isSelected: entry.key == selectedIndex,
              option: entry.value.option,
              onTap: () {
                setState(() {
                  selectedIndex = entry.key;
                });
              },
            ),
          )
          .toList(),
    );
  }
}
