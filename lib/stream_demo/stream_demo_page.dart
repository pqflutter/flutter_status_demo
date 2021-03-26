import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class StreamDemoPage extends StatelessWidget {
  final StreamController<int> _controller;

  StreamDemoPage({Key key})
      : _controller = StreamController<int>(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stream")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("StatelessWidget 利用 Stream 完成UI刷新"),
          StreamBuilder(
            initialData: 0,
            stream: _controller.stream,
            builder: (context, snapshot) {
              return Center(
                child: Text("${snapshot.data}"),
              );
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 导入math package
          // import 'dart:math';
          _controller.add(Random.secure().nextInt(1000));
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
