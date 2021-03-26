import 'package:flutter/cupertino.dart';

class MyRouter {
  static const String statePage = "/statePage";
  static const String inheritedWidgetPage = "/inheritedWidgetPage";
  static const String streamPage = "/streamPage";
  static const String rxDartPage = "/rxDartPage";
  static const String blocPage = "/blocPage";
  static const String scopedModelPage = "/scopedModelPage";
  static const String flutterReduxPage = "/flutterReduxPage";
  static const String providerPage = "/providerPage";

  static Future push(BuildContext context, String path) async {
    return await Navigator.pushNamed(context, path);
  }

}