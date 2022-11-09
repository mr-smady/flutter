import 'package:flutter/material.dart';

class LayoutExample extends StatelessWidget {
  const LayoutExample({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: 200,
                color: Colors.lightBlue,
                child: const Center(
                  child: Text('this is a test'),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                height: 200,
                color: Colors.lightGreen,
                child: const Center(
                  child: Text('this is a test'),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                height: 200,
                color: Colors.yellow,
                child: const Center(
                  child: Text('this is a test'),
                ),
              ),
            ),
          ],
        ),
      );
}
