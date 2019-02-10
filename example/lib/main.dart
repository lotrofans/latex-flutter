import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:latex/latex.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    if (!mounted) return;
  }

  Widget latexWidget;

  void loadWidget() async{
    if(latexWidget == null){
      latexWidget = await Latex.getLaTeXWidget("x = \\frac{-b \\pm \\sqrt{b^2-4ac}}{2a}");
      setState(() {
        
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    loadWidget();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: latexWidget == null? CupertinoActivityIndicator() : latexWidget

        ),
      ),
    );
  }
}
