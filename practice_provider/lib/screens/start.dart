import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool state = false;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ColorProvider>.value(
      value: ColorProvider(),
      child: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.indigo,
            title: Consumer<ColorProvider>(
              builder: (context, value, child) {
                return Text(
                  'Color',
                  style: TextStyle(
                    color: value._changeColor(),
                  ),
                );
              },
            )),
        body: SafeArea(
          child: Container(child: _buildMainColumn()),
        ),
      ),
    );
  }

  Widget _buildMainColumn() => ListView(
        children: [
          _animatedW(),
        ],
      );

  Widget _animatedW() => Container(
    padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer<ColorProvider>(builder: (context, value, child) {
              return AnimatedContainer(
                width: 200,
                height: 200,
                color: value._changeColor(),
                duration: Duration(seconds: 1),
              );
            }),
            Switch(
                value: state,
                onChanged: (bool s) {
                  setState(() {
                    state = s;
                  });
                }),
          ],
        ),
      );
}

class ColorProvider extends ChangeNotifier {
  Color _changeColor() {
    return Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
        .withOpacity(1.0);
    //notifyListeners();
  }
}
