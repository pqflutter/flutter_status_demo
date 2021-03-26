import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class RxDartDemoPage extends StatefulWidget {
  @override
  _RxDartDemoPageState createState() => _RxDartDemoPageState();
}

class _RxDartDemoPageState extends State<RxDartDemoPage> {
  PublishSubject _subject;
  TextEditingController _editingController;
  Stream _keywordStream;

  @override
  void initState() {
    super.initState();
    _editingController = TextEditingController();
    _subject = PublishSubject();

    _keywordStream = _subject
        .debounceTime(Duration(milliseconds: 500))
        .map((event) => "搜索关键字: $event");

    _editingController.addListener(() {
      _subject.add(_editingController.text);
    });
  }

  @override
  void dispose() {
    _subject?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("RxDart")),
      body: Column(
        children: [
          TextField(
            controller: _editingController,
          ),
          SizedBox(height: 40),
          StreamBuilder(
            stream: _keywordStream,
            builder: (context, snapshot) {
              return Center(child: Text(snapshot.data ?? "请输入关键词"));
            },
          )
        ],
      ),
    );
  }
}
