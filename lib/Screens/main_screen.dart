import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern_learning_app/Screens/second_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

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
              onPressed: () {},
              child: Text("Increment Counter"),
            ),
            ElevatedButton(
              child: Text("Navigate to Second Screen"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
