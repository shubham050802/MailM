import 'package:flutter/material.dart';
import 'package:mailm/services/csvreader.dart';

class Message extends StatefulWidget {
  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  List message = [];
  late int index;
  String s = "";
  Reader reader = Reader();
  @override
  void initState() {
    super.initState();
    reader.loadCSV().then((value) {
      setState(() {
        message = value;
        s = message[index][1];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    index = ModalRoute.of(context)?.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        title: Text('Message'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Text(s),
          ],
        ),
      ),
    );
  }
}
