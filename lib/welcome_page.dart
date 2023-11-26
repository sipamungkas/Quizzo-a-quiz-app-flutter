import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizzo/main.dart';
import 'package:quizzo/choose_class.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // final nameController = TextEditingController();
  String name = '';
  // @override
  // void dispose() {
  //   nameController.dispose();
  //   super.dispose();
  // }

  void updateName(newName) {
    setState(() {
      name = newName;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      // appBar: AppBar(
      //   // TRY THIS: Try changing the color here to a specific color (to
      //   // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
      //   // change color while the other colors stay the same.
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   // Here we take the value from the MyHomePage object that was created by
      //   // the App.build method, and use it to set our appbar title.
      //   title: Text(widget.title),
      // ),
      body: Consumer<DataModel>(builder: (context, data, child) {
        final mediaQuery = MediaQuery.of(context).size;
        return SafeArea(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Center(
              // Center is a layout widget. It takes a single child and positions it
              // in the middle of the parent.
              child: SizedBox(
                width: mediaQuery.width > 728 ? 360 : double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Welcome to Quizzo!',
                      style: Theme.of(context).textTheme.headlineLarge?.merge(
                          TextStyle(color: Theme.of(context).primaryColor)),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Before we start our quiz, please input your name below!',
                      style: Theme.of(context).textTheme.bodyMedium?.merge(
                            const TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    TextField(
                      onChanged: (text) {
                        updateName(text);
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Name',
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: name == ''
                            ? null
                            : () {
                                data.updateName(name);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ChooseClass()));
                              },
                        child: const Text('Next'),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
