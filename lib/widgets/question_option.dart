import 'package:flutter/material.dart';
import 'package:quizzo/models/question.dart';
import 'package:quizzo/widgets/question_item.dart';

class QuestionOption extends StatefulWidget {
  final List<OptionItem> optionList;
  final Function updateSelectedOption;
  final int selectedIndex;

  const QuestionOption(
      {Key? key,
      required this.optionList,
      required this.updateSelectedOption,
      required this.selectedIndex})
      : super(key: key);

  @override
  State<QuestionOption> createState() => _QuestionOptionState();
}

class _QuestionOptionState extends State<QuestionOption> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.optionList
          .asMap()
          .entries
          .map(
            (entry) => Item(
              isSelected: entry.key == widget.selectedIndex,
              option: entry.value.option,
              onTap: () {
                widget.updateSelectedOption(entry.key);
              },
            ),
          )
          .toList(),
    );
  }
}
