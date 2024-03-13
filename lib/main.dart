import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}




class _MyHomePageState extends State<MyHomePage> {

  createData() {
    DocumentReference documentReference =
    FirebaseFirestore.instance.collection('Pslist').doc(roll);

    Map<String, dynamic> studenet = {
      "name": name,
      "id": id
    };

    documentReference.set(studenet).whenComplete(() {
      print("$name created");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MY app bar'),
      ),
      body: Center(

        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Enter name'),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: "Enter id",
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      )),
                  onChanged: (String id) {
                    getid(id);
                  },
                ),

              Text('Enter ID'),
              TextFormField(

              ),
              ElevatedButton(onPressed: () {}, child: Text('Submit'))
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        }
      ),
    );
  }

  void getid(String id) {
    this.id = id;
  }

  void getid(String name){
    this.name = name;
  }

}
