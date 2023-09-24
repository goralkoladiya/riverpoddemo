import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:riverpoddemo/hivedemo/Contact.dart';

class getcontacts extends StatefulWidget {
  const getcontacts({Key? key}) : super(key: key);

  @override
  State<getcontacts> createState() => _getcontactsState();
}

class _getcontactsState extends State<getcontacts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: Hive.openBox('contactbook'),
        builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.done)
            {
              var box=snapshot.data;
              print(box);
              if(snapshot.hasData)
                {
                  return ListView.builder(itemBuilder: (context, index) {
                    Contact c=box.getAt(index);
                    return ListTile(title: Text("${c.name}"),subtitle: Text("${c.phone}"),
                      trailing: IconButton(
                      onPressed: () {
                        c.delete();
                        setState(() {

                        });
                      },icon: Icon(Icons.delete),
                    ),);
                  },itemCount: box!.length,);
                }
              else
                {
                  return Center(child: CircularProgressIndicator(),);
                }
            }
          else
          {
            return Center(child: CircularProgressIndicator(),);
          }
        },
      ),
    );
  }
}
