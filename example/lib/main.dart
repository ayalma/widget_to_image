import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:widget_to_image/widget_to_image.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Uint8List? imageList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: (imageList != null)
            ? Image.memory(imageList!)
            : Text('no image yet'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var test = Test().build(context);
          final image = await test.captureImageAsUnit8List(
              pixelRatio: 3.0, size: Size(300, 9999999));
          setState(() {
            imageList = image;
          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
        child: SingleChildScrollView(
          child: Column(children: [
            Text('Test widget '),
            Text('Test widget '),
            Text('Test widget '),
            Text('Test widget '),
            Text('Test widget '),
            Text('Test widget '),
            Text('Test widget '),
            Text('Test widget '),
            Text('Test widget '),
            Text('Test widget '),
            Text('Test widget '),
            Text('Test widget '),
            Text('Test widget '),
            Text('Test widget '),
            Text('Test widget '),
            Text('Test widget '),
            Text('Test widget '),
            Text('Test widget '),
            Text('Test widget '),
            Text('Test widget '),
            Text('Test widget '),
            Text('Test widget '),
            Text('Test widget '),
            Text('Test widget '),
            Text('Test widget '),
            Text('Test widget '),
            Text('Test widget '),
            Text('Test widget '),
          ]),
        ),
      ),
    );
  }
}
