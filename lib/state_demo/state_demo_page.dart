import 'package:flutter/material.dart';

class StateDemoPage extends StatefulWidget {
  @override
  _StateDemoPageState createState() => _StateDemoPageState();
}

class _StateDemoPageState extends State<StateDemoPage> {

  int _count;

  @override
  void initState() {
    super.initState();
    _count = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("State Demo")
      ),
      body: Center(child: Text("$_count")),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => setState(() => ++_count),
      ),
    );
  }
}
