import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern_learning_app/BloC/counter_bloc.dart';
import 'package:flutter_bloc_pattern_learning_app/BloC/counter_event.dart';
import 'package:flutter_bloc_pattern_learning_app/Screens/second_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final _bloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BloC Pattern - Flutter"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _bloc.counterEventSink.add(IncrementCounter()),
              child: Text("Increment Counter"),
            ),
            ElevatedButton(
              child: Text("Navigate to Second Screen"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondScreen(
                      // this is the basic implementation of bloC where we are doing things manually, with flutter_bloc package we don't need to pass it through constructor, we can access the bloc varaible in BlocBuilder.
                      bloc: _bloc,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
