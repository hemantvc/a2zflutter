import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Header with Search and Button'),
        ),
        body: MyWidget(),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(16.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 50, // Replace with your desired item count
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text('Item $index'),
                // Add your list item widgets here
              );
            },
          ),
        ),
        Container(
          width: double.infinity,
          color: Colors.blue,
          child: TextButton(
            onPressed: () {
              // Handle button "OM" click here
            },
            child: Text(
              'OM',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
