import 'package:flutter/material.dart';
import 'package:flutter_status_demo/provider_demo/provider_demo_page.dart';
import 'package:flutter_status_demo/router.dart';
import 'package:flutter_status_demo/rx_dart_demo/rx_dart_demo_page.dart';
import 'package:flutter_status_demo/scoped_model_demo/scope_model_demo_page.dart';
import 'package:flutter_status_demo/state_demo/state_demo_page.dart';
import 'package:flutter_status_demo/stream_demo/stream_demo_page.dart';
import 'bloc_demo/bloc_demo_page.dart';
import 'flutter_redux_demo/flutter_redux_demo_page.dart';
import 'inherited_widget_demo/inherited_widget_demo_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: "/root",
      routes: {
        "/root": (_) => HomePage(title: 'Flutter Animate Demo Home Page'),
        MyRouter.statePage: (_) => StateDemoPage(),
        MyRouter.streamPage: (_) => StreamDemoPage(),
        MyRouter.rxDartPage: (_) => RxDartDemoPage(),
        MyRouter.blocPage: (_) => BLoCDemoPage(),
        MyRouter.scopedModelPage: (_) => ScopeModelDemoPage(),
        MyRouter.providerPage: (_) => ProviderDemoPage(),
        MyRouter.inheritedWidgetPage: (_) => InheritedWidgetDemoPage(),
        MyRouter.flutterReduxPage: (_) => FlutterReduxDemoPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  final String title;

  HomePage({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? ""),
      ),
      body: ListView(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _item(context, "State", MyRouter.statePage),
          _item(context, "InheritedWidget ", MyRouter.inheritedWidgetPage),
          _item(context, "Stream", MyRouter.streamPage),
          _item(context, "RxDart", MyRouter.rxDartPage),
          _item(context, "BLoC", MyRouter.blocPage),
          _item(context, "scoped_model", MyRouter.scopedModelPage),
          _item(context, "flutter_redux", MyRouter.flutterReduxPage),
          _item(context, "Provider", MyRouter.providerPage),
        ],
      ),
    );
  }

  _item(BuildContext context, String title, String router) {
    return OutlineButton(
        child: Text(title),
        onPressed: () =>  MyRouter.push(context, router),);
  }
}
