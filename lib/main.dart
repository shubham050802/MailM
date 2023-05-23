import 'package:flutter/material.dart';
import 'package:mailm/pages/home.dart';
import 'package:mailm/pages/message.dart';

void main() {
  runApp(MaterialApp(routes: {
    '/': (context) => Home(),
    '/message': (context) => Message(),
  }));
}
