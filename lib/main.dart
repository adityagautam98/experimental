import 'package:feedaback/background.dart';
import 'package:feedaback/loginUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
const _emojis = ['😞','1','2','3','4','😃'];


void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyApp(),
    );
  }
}


class MyApp extends StatefulWidget {
  MyApp({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyApp extends State<MyApp> {
  double _value = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Background(),
          Login(),
        ],
      ),);}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: new LinearGradient(
                colors: [Colors.orangeAccent, Colors.white30],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight
            )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '${_emojis[_value.toInt()]}',
                style: Theme.of(context).textTheme.display1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(_emojis[0], softWrap: true),
                      Expanded(
                        child: Slider(

                          value: _value,
                          //label: _emojis[_value.toInt()],
                          min: 0.0,
                          max: 5.0,
                          divisions: 5,


                          onChangeStart: (double value) {
                            print('Start value is ' + value.toString());
                          },
                          onChangeEnd: (double value) {
                            print('Finish value is ' + value.toString());
                          },
                          onChanged: (double value) {
                            setState(() {
                              _value = value;
                            });
                          },
                          activeColor: Colors.white,
                          inactiveColor: Colors.black45,
                        ),
                      ),
                      Text(_emojis[5], softWrap: true)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

