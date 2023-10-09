import 'package:flutter/material.dart';

class AsyncExample extends StatefulWidget {
  const AsyncExample({Key? key}) : super(key: key);

  @override
  State<AsyncExample> createState() => _AsyncExampleState();
}

class _AsyncExampleState extends State<AsyncExample> {
  @override
  void initState() {
    super.initState();
    printMessage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("App Bar Example")),
      body: SafeArea(
        child: Column(
          children: [Text("data")],
        ),
      ),
    );
  }

  printMessage() async {
    print("Data 1 executed!");
    await runTaskInFuture();
    print("Data 3 executed!");
  }

  runTaskInFuture() {
    Future.delayed(
      Duration(seconds: 4),
      () {
        print("Data 2 executed!");
      },
    );
  }
}
