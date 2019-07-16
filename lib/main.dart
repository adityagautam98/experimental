import 'package:flutter/material.dart';
void main(){

  runApp(MaterialApp(
    home: Experiment(),
  ));
}
class Experiment extends StatefulWidget {
  @override
  _ExperimentState createState() => _ExperimentState();
}

class _ExperimentState extends State<Experiment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Experiment"),
      ),
      body: Center(
        child: Card( // simply wrap everything in card to make it look like a card
          elevation: 10,// use elevation to control shadow effect
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Add everything here, Also use padding"),
          ),
        ),
      ),
    );
  }
}
