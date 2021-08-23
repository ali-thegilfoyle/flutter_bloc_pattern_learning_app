import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern_learning_app/BloC/counter_bloc.dart';

class SecondScreen extends StatelessWidget {
  SecondScreen({
    Key? key,
    required this.bloc,
  }) : super(key: key);

  // this is the basic implementation of bloC where we are doing things manually, with flutter_bloc package we don't need to pass it through constructor, we can access the bloc varaible in BlocBuilder.
  final CounterBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen - BloC Pattern"),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: bloc.counter,
        initialData: 0,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            child: Center(
              child: Text("Counter Value: ${snapshot.data}"),
            ),
          );
        },
      ),
    );
  }
}
