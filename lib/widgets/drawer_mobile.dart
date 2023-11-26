import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizzo/main.dart';
import 'package:quizzo/models/answer.dart';

class DrawerMobile extends StatelessWidget {
  final List<Answer> answer;
  final Function updateIndex;
  const DrawerMobile(
      {Key? key, required this.answer, required this.updateIndex})
      : super(key: key);

  void updatePage(context, index, selectedAnswer) {
    Navigator.pop(context);
    updateIndex(index, selectedAnswer);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                      Expanded(
                        child: GridView.count(
                          crossAxisCount: 4,
                          crossAxisSpacing: 8,
                          childAspectRatio: 16 / 9,
                          mainAxisSpacing: 8,
                          children: <Widget>[
                            ...answer
                                .map((e) => InkWell(
                                      onTap: () {
                                        updatePage(
                                            context, e.number, e.optionIndex);
                                      },
                                      child: Container(
                                          decoration: BoxDecoration(
                                              color: e.optionIndex != -1
                                                  ? Colors.green
                                                  : Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: Center(
                                            child: Text(
                                              (e.number + 1).toString(),
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                          )),
                                    ))
                                .toList()
                          ],
                        ),
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
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
