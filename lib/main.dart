import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpoddemo/Demo.dart';
/*
ProviderScope` is a widget that stores the state of all the providers that we create
 */
void main() {
  // wrap the entire app with a ProviderScope so that widgets
  // will be able to read providers
  runApp(ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Expanded(child: Demo1()),
            Expanded(child: Demo2()),
            Expanded(child: Demo3()),
          ],
        ),
      ),
    );
  }
}