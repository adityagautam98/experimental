import 'dart:async';
import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';



const _emojis = ['😞','1','2','3','4','😃'];
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Form';

    return MaterialApp(
      title: appTitle,
debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(

          title: Text(appTitle),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm>
    with TickerProviderStateMixin {
  double _value = 0;
  int _state = 0;
  MediaQueryData data;
  Animation _animation;
  AnimationController _controller;
  GlobalKey _globalKey = GlobalKey();
  double _width = double.maxFinite;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    data = MediaQuery.of(context);
    // Build a Form widget using the _formKey created above.
    return ListView(
      children: <Widget>[
        Container(
          height: data.size.height * .3,
          child: Stack(
            children: <Widget>[
              Container(
                color: Colors.orangeAccent,
                height: data.size.height * .2,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(data.size.width*.5- data.size.height*.1,data.size.height*.1 ,0 ,0 ),
                child:
                AvatarGlow(
                  startDelay: Duration(milliseconds: 1000),
                  glowColor: Colors.redAccent,
                  endRadius: 90.0,
                  duration: Duration(milliseconds: 2000),
                  repeat: true,
                  showTwoGlows: true,
                  repeatPauseDuration: Duration(milliseconds: 100),
                  child: Material(
                    elevation: 8.0,
                    shape: CircleBorder(),
                    child: CircleAvatar(
                        backgroundColor:Colors.grey[100] ,
                        child: Image.asset("images/lg.png",
                          height: 100.0,
                          scale: 1.0,
                          fit: BoxFit.cover,),
                        radius: 40.0,



                    ),
                  ),
                )
)
            ],
          ),
        ),
        Form(
          key: _formKey,
          child: Container(
            height: data.size.height * .5,
            child: ListView(children: <Widget>[
              SizedBox(
                width: 700.0,
                height: 50.0,
                child: Card(
                  elevation: 8.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 14.0),
                    child: TextFormField(
                      autofocus: false,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'enter your email',
                        hintMaxLines: 1,
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 700.0,
                height: 200.0,
                child: Card(
                  elevation: 8.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 14.0),
                    child: TextFormField(
                      autofocus: false,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'please give your suggestions',
                        hintMaxLines: 5,
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Align(
                  alignment: Alignment.center,
                  child: PhysicalModel(
                    elevation: 8,
                    shadowColor: Colors.orangeAccent,
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      key: _globalKey,
                      height: 48,
                      width: _width,
                      child: RaisedButton(
                        animationDuration: Duration(milliseconds: 1000),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        padding: EdgeInsets.all(0),
                        child: setUpButtonChild(),
                        onPressed: () {
                          setState(() {
                            if (_state == 0) {
                              animateButton();
                            }
                          });
                        },
                        elevation: 4,
                        color: Colors.orangeAccent,
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
        Container(
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
                        Text(_emojis[5], softWrap: true,)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

      ],
    );
  }

  ///
  ///
  ///
  setUpButtonChild() {
    if (_state == 0) {
      return Text(
        "Click Here",
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      );
    } else if (_state == 1) {
      return SizedBox(
        height: 36,
        width: 36,
        child: CircularProgressIndicator(
          value: null,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    } else {
      return Icon(Icons.check, color: Colors.white);
    }
  }

  void animateButton() {
    double initialWidth = _globalKey.currentContext.size.width;

    _controller =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this);

    _animation = Tween(begin: 0.0, end: 1).animate(_controller)
      ..addListener(() {
        setState(() {
          _width = initialWidth - ((initialWidth - 48) * _animation.value);
        });
      });
    _controller.forward();

    setState(() {
      _state = 1;
    });

    Timer(Duration(milliseconds: 3300), () {
      setState(() {
        _state = 2;
      });
    });
  }
}
