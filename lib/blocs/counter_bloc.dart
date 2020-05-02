import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';

class CounterBloc extends BlocBase {
  int _counter = 0;
  StreamController<int> _counterController = StreamController<int>();

  void incrementCounter() {
    _counter++;
    return _counterController.sink.add(_counter);
  }

  Stream<int> counterStream() {
    return _counterController.stream;
  }

  @override
  void dispose() {
    super.dispose();

    _counterController.close();
  }
}
