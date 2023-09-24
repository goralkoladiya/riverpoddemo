import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpoddemo/hivedemo/Contact.dart';

import 'contactbook.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  Hive.registerAdapter(ContactAdapter());
  await Hive.openBox('score');
  await Hive.openBox('mydata');
  await Hive.openBox('contactbook');
  runApp(MaterialApp(
    home: contactbook(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int levelno=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var box = Hive.box('Score');
    levelno = box.get('levelno',defaultValue: 10);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text("LevelNo=$levelno"),
          ElevatedButton(onPressed: () {
            setState(() {
              levelno++;
            });
            var box = Hive.box('score');
            box.put('levelno', levelno);
          }, child: Text("Add")),
          ElevatedButton(onPressed: () {
            var box = Hive.box('score');
            levelno = box.get('levelno');
            print('Name: $levelno');
          }, child: Text("Get data")),
          TextField(
            onChanged: (value) {
              var box = Hive.box('mydata');
              box.put('name', value);
            },
          )
        ],
      ),
    );
  }
}
