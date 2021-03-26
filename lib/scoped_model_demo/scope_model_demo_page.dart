import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart' as sc;

class ScopeModelDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Scope model")),
      body: SafeArea(
        child: Container(
          child: sc.ScopedModel<_CountModel>(
            model: _CountModel(),
            child: sc.ScopedModelDescendant<_CountModel>(
              builder: (context, child, model) {
                return Column(
                  children: [
                    Expanded(child: Center(child: Text(model.count.toString()))),
                    Center(child: FlatButton(
                      onPressed: model.add,
                      color: Colors.blue,
                      child: Icon(Icons.add),
                    ),),
                  ],
                );
              },
            )
          ),
        ),
      ),
    );
  }
}

class _CountModel extends sc.Model {
  static _CountModel of(BuildContext context) =>
      sc.ScopedModel.of<_CountModel>(context);

  int _count = 0;

  int get count => _count;

  void add() {
    _count++;
    notifyListeners();
  }
}
