import 'package:a2zflutter/model/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'repository/user_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

   const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<User> getUser = UserRepository(Client()).getUser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FutureBuilder(
          future: getUser,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return  Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.blueAccent,
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(40),
                    child: Text(
                      "${snapshot.data}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30
                      ),
                    ),
                  ),
                ],
              ),
            );
          },

        ),
      ),
    );
  }
}
