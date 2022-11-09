import 'package:flutter/material.dart';

class ButtonExamples extends StatefulWidget {
  const ButtonExamples({super.key});

  @override
  State<StatefulWidget> createState() => _ButtonExamplesState();
}

class _ButtonExamplesState extends State<ButtonExamples> {
  static const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

  String? _value = list[0];
  int? _selected = 0;

  Future<void> _showMyDialog(
      {required BuildContext context, required String message}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(actions: [
          PopupMenuButton<int>(
            initialValue: _selected,
            itemBuilder: (context) => const [
              PopupMenuItem<int>(
                value: 0,
                child: Text('Item 0'),
              ),
              PopupMenuItem<int>(
                value: 1,
                child: Text('Item 1'),
              ),
              PopupMenuItem<int>(
                value: 2,
                child: Text('Item 2'),
              ),
            ],
            onSelected: (value) {
              setState(() {
                _selected = value;
              });
            },
          ),
        ]),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                child: const Text('TextButton'),
                onPressed: () {
                  _showMyDialog(context: context, message: 'TextButton');
                },
              ),
              ElevatedButton(
                child: const Text('ElevatedButton'),
                onPressed: () {
                  _showMyDialog(context: context, message: 'ElevatedButton');
                },
              ),
              OutlinedButton(
                child: const Text('OutlinedButton'),
                onPressed: () {
                  _showMyDialog(context: context, message: 'OutlinedButton');
                },
              ),
              IconButton(
                icon: const Icon(Icons.android),
                onPressed: () {
                  _showMyDialog(context: context, message: 'IconButton');
                },
              ),
              DropdownButton<String>(
                value: _value,
                items: list
                    .map<DropdownMenuItem<String>>(
                        (value) => DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _value = value;
                  });
                },
              )
            ],
          ),
        ),
      );
}
