import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  final bool isSelected;
  final String option;
  final Function onTap;

  const Item(
      {Key? key,
      required this.isSelected,
      required this.option,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            onTap();
          },
          child: Card(
            color: Colors.white,
            elevation: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(option),
                  if (isSelected)
                    const Icon(
                      Icons.check,
                      color: Colors.green,
                      size: 16,
                    ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        )
      ],
    );
  }
}
