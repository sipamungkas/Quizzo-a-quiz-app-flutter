import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizzo/main.dart';

class DrawerMobile extends StatelessWidget {
  const DrawerMobile({
    super.key,
  });

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
    );
  }
}
