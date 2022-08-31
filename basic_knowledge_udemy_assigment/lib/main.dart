import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int stateNumber = 0;
  addNumberAction() {
    setState(() {
      stateNumber++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Basic Knowledge Assignment',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Basic Knowledge Assignment'),
        ),
        body: Center(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextControlWidget(
                  inputClickButton: addNumberAction,
                ),
                TextWidget(
                  inputNumber: stateNumber,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TextControlWidget extends StatelessWidget {
  final Function()? inputClickButton;
  const TextControlWidget({
    Key? key,
    this.inputClickButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: inputClickButton,
      child: const Text('Add number below!'),
    );
  }
}

class TextWidget extends StatelessWidget {
  final int inputNumber;
  const TextWidget({
    Key? key,
    required this.inputNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(inputNumber.toString());
  }
}
