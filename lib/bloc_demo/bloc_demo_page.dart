import 'dart:async';

import 'package:flutter/material.dart';

class BLoCDemoPage extends StatefulWidget {
  @override
  _BLoCDemoPageState createState() => _BLoCDemoPageState();
}

class _BLoCDemoPageState extends State<BLoCDemoPage> {
  final _CountBLoC _bLoC = _CountBLoC();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BLoC"),
      ),
      body: Column(
        children: [
          Text("BLoC大多是利用Stream和StreamBuilder实现，更多的是一种设计模式的思路，好处就是分离UI和逻辑层"),
          StreamBuilder(
            initialData: 0,
            stream: _bLoC.countStream,
            builder: (context, snapshot) => Center(
              child: Text(
                "${snapshot.data}",
                style: TextStyle(fontSize: 30, color: Colors.redAccent),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _bLoC.add,
      ),
    );
  }

  @override
  void dispose() {
    _bLoC.dispose();
    super.dispose();
  }
}

class _CountBLoC {
  int _count = 0;
  StreamController<int> _streamController = StreamController<int>();
  Stream get countStream => _streamController.stream;

  void add() {
    _count++;
    _streamController.add(_count);
  }

  dispose() {
    _streamController?.close();
  }
}
