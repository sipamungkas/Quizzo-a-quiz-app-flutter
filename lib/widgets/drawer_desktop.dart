import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizzo/main.dart';
import 'package:quizzo/models/answer.dart';

class DrawerDesktop extends StatelessWidget {
  final List<Answer> answer;
  final Function updateIndex;
  const DrawerDesktop(
      {Key? key, required this.answer, required this.updateIndex})
      : super(key: key);

  void updatePage(context, index, selectedAnswer) {
    updateIndex(index, selectedAnswer);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DataModel>(builder: (context, data, child) {
      return Padding(
        padding: const EdgeInsets.only(right: 16, left: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
            Divider(
              height: 20,
              thickness: 1,
              endIndent: 0,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Daftar Soal',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(
              height: 16,
            ),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 4,
              crossAxisSpacing: 8,
              childAspectRatio: 16 / 9,
              mainAxisSpacing: 8,
              children: <Widget>[
                ...answer
                    .map((e) => InkWell(
                          onTap: () {
                            updateIndex(e.number, e.optionIndex);
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  color: e.optionIndex != -1
                                      ? Colors.green
                                      : Colors.red,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                child: Text(
                                  (e.number + 1).toString(),
                                  style: const TextStyle(color: Colors.white),
                                ),
                              )),
                        ))
                    .toList()
              ],
            ),
          ],
        ),
      );
    });
  }
}
