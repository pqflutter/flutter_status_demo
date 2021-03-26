import 'package:flutter/material.dart';

class InheritedWidgetDemoPage extends StatefulWidget {
  @override
  _InheritedWidgetDemoPageState createState() =>
      _InheritedWidgetDemoPageState();
}

class _InheritedWidgetDemoPageState extends State<InheritedWidgetDemoPage> {
  String _text = "init";

  @override
  Widget build(BuildContext context) {
    return InheritedText(
      text: _text,
      child: Scaffold(
        appBar: AppBar(title: Text("Inherited Widget")),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Builder(builder: (context) {
              return Text(
                InheritedText.of(context)?.text ?? "null",
                style: TextStyle(color: Colors.blue),
              );
            }),
            _NextPage(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _text = "Hello";
            });
          },
        ),
      ),
    );
  }
}

class InheritedText extends InheritedWidget {
  final String text;

  InheritedText({this.text, Widget child}) : super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedText oldWidget) {
    return text != oldWidget.text;
  }

  static InheritedText of(BuildContext context) {
    // 此方法已被标记位过期方法，建议使用下面的方法
    // return context.inheritFromWidgetOfExactType(InheritedText);
    return context.dependOnInheritedWidgetOfExactType<InheritedText>() ?? null;
  }
}

class _NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(InheritedText.of(context)?.text ?? ""));
  }
}
