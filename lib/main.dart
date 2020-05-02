import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:counter_with_stream/blocs/counter_bloc.dart';
import 'package:counter_with_stream/components/counter_text.dart';
import 'package:counter_with_stream/components/styled_counter_text.dart';
import 'package:flutter/material.dart';

import 'views/my_home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [
        Bloc((_) => CounterBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: PageView(
          children: <Widget>[
            MyHomePage(
              title: 'Page 1',
              counterText: CounterText(),
            ),
            MyHomePage(
              title: 'Page 2',
              counterText: StyledCounterText(),
            ),
          ],
        ),
      ),
    );
  }
}
