import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _CountProvider(),
      child: Scaffold(
        appBar: AppBar(title: Text("Provider")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Builder(
              builder: (context) {
                return Text(
                  Provider.of<_CountProvider>(context).count.toString(),
                  style: TextStyle(fontSize: 30, color: Colors.orangeAccent),
                );
              },
            ),
            Consumer<_CountProvider>(
              builder: (context, provider, child) {
                return Center(
                  child: Text(
                    provider.count.toString(),
                    style: TextStyle(fontSize: 30, color: Colors.orangeAccent),
                  ),
                );
              },
            )
          ],
        ),
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
            onPressed: () {
              Provider.of<_CountProvider>(context, listen: false)?.add();
            },
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}

class _CountProvider extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void add() {
    _count++;
    notifyListeners();
  }
}
