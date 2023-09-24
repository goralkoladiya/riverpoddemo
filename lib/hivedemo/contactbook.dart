import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:riverpoddemo/hivedemo/Contact.dart';
import 'package:riverpoddemo/hivedemo/Getcontacts.dart';

class contactbook extends StatefulWidget {
  const contactbook({Key? key}) : super(key: key);

  @override
  State<contactbook> createState() => _contactbookState();
}

class _contactbookState extends State<contactbook> {
  TextEditingController namec=TextEditingController();
  TextEditingController phonec=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(controller: namec),
          TextField(controller: phonec,),
          ElevatedButton(onPressed: () {
            String name=namec.text;
            String phone=phonec.text;
            var box = Hive.box('contactbook');
            Contact c=Contact(name,phone,"");
            box.add(c);
            box.
          }, child: Text("Add")),
          ElevatedButton(onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => getcontacts(),));
          }, child: Text("Getdata"))
        ],
      ),
    );
  }
}
