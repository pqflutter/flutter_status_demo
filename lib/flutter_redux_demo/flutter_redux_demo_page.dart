import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

/// 1、创建State
class ReduxCountState {
  int _count;

  int get count => _count;

  ReduxCountState(this._count);
}

/// 2、创建Action
enum ReduxAction { increment }

/// 3、创建Reducer
ReduxCountState reducer(ReduxCountState state, dynamic action) {
  switch (action) {
    case ReduxAction.increment:
      return ReduxCountState(state.count + 1);
    default:
      return state;
  }
}

/// 拦截器，拦截器介于Action和Reducer之间，如果我们要对一些事件进行拦截，就可以在这里处理
/// 举个例子：当我们更新用户信息的时候（假设有头像，名称），需要去刷新，当我们只更新
/// 名称的时候，由于头像没更新，我不希望头像也倍刷新一次，此时就可以根据action，进行拦截不响应处理
class ReduxCountMiddleware implements MiddlewareClass<ReduxCountState> {
  @override
  call(Store<ReduxCountState> store, action, next) {
    /// 只更新偶数，奇数不处理
    if (store.state.count % 2 != 0) {
      next(action);
      print("xxxxxxxxx 我是拦截器，偶数通过");
    } else {
      next(action);
      next(action);
      print("xxxxxxxxx 我是拦截器，过滤奇数");
    }
  }
}

class FlutterReduxDemoPage extends StatefulWidget {
  @override
  _FlutterReduxDemoPageState createState() => _FlutterReduxDemoPageState();
}

class _FlutterReduxDemoPageState extends State<FlutterReduxDemoPage> {
  /// 4、创建Store
  final store = Store<ReduxCountState>(
    reducer,
    /// 拦截奇数
    middleware: [ReduxCountMiddleware()],
    initialState: ReduxCountState(0),
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider<ReduxCountState>(
      store: store,
      child: Scaffold(
          appBar: AppBar(
            title: Text("redux"),
          ),
          body: Center(
            /// 5、关联Widget
            child: StoreConnector<ReduxCountState, String>(
              converter: (store) => store.state.count.toString(),
              builder: (context, val) => Text(
                val,
                style: TextStyle(fontSize: 30, color: Colors.red),
              ),
            ),
          ),
        /// 6、触发
        floatingActionButton: StoreConnector<ReduxCountState, VoidCallback>(
          converter: (store) {
            return () => store.dispatch(ReduxAction.increment);
          },
          builder: (context, callback) {
            return FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: callback,
            );
          },
        ),
        ),
    );
  }
}

