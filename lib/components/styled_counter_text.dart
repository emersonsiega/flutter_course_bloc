import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:counter_with_stream/blocs/counter_bloc.dart';
import 'package:flutter/material.dart';

class StyledCounterText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: BlocProvider.getBloc<CounterBloc>().counterStream(),
      initialData: 0,
      builder: (context, AsyncSnapshot snapshot) {
        return Text(
          '${snapshot.data}',
          style: Theme.of(context).textTheme.display1.copyWith(
                color: Colors.yellow,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                backgroundColor: Colors.black45,
              ),
        );
      },
    );
  }
}
