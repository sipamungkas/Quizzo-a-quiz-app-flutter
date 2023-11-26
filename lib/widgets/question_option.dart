import 'package:flutter/material.dart';
import 'package:quizzo/models/question.dart';
import 'package:quizzo/widgets/question_item.dart';

class QuestionOption extends StatefulWidget {
  final List<OptionItem> optionList;
  final Function updateSelectedOption;
  final int selectedIndex;
  final int count;

  const QuestionOption(
      {Key? key,
      required this.optionList,
      required this.updateSelectedOption,
      required this.selectedIndex,
      required this.count})
      : super(key: key);

  @override
  State<QuestionOption> createState() => _QuestionOptionState();
}

class _QuestionOptionState extends State<QuestionOption> {
  @override
  Widget build(BuildContext context) {
    return widget.count == 1
        ? ColumnQuestion(widget: widget)
        : GridQuestion(widget: widget);
  }
}

class ColumnQuestion extends StatelessWidget {
  const ColumnQuestion({
    super.key,
    required this.widget,
  });

  final QuestionOption widget;

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
                widget.updateSelectedOption(entry.key, entry.value.isKey);
              },
            ),
          )
          .toList(),
    );
  }
}

class GridQuestion extends StatelessWidget {
  const GridQuestion({
    super.key,
    required this.widget,
  });

  final QuestionOption widget;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: widget.count,
      children: widget.optionList
          .asMap()
          .entries
          .map(
            (entry) => Item(
              isSelected: entry.key == widget.selectedIndex,
              option: entry.value.option,
              onTap: () {
                widget.updateSelectedOption(entry.key, entry.value.isKey);
              },
            ),
          )
          .toList(),
    );
  }
}
