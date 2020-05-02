import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/subjects.dart';

class CounterBloc extends BlocBase {
  int _counter = 0;
  // Basicamente existem 3 tipos de Streams
  // PublishSubject - Parecido com o StreamController
  // BehaviorSubject - Salva o último valor enviado à stream e já envia esse valor ao adicionar um novo listener.
  // ReplaySubject - Parecido com o BehaviorSubject, porém ao invés de salvar somente o último valor, salva o histórico
  //                de todos os eventos ocorridos e já inicia o listener com todos os valores enviados anteriormente à stream.
  final _counterController = BehaviorSubject<int>();

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
