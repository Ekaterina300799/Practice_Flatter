//использование библиотеки flutter_bloc
//здесь не нужно самостоятельно закрывать потоки, библиотека сделает все за вас

import 'package:bloc_stream/color_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: BlocProvider(
        create: (_) => ColorBloc(Colors.purple),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //ignore: close_sinks
    ColorBloc _bloc = BlocProvider.of<ColorBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('flutter_bloc'),
        centerTitle: true,
      ),
      body: Center(
        child: BlocBuilder<ColorBloc, Color>(
          builder: (context, currentColor) => AnimatedContainer(
            duration: Duration(milliseconds: 500),
            color: currentColor,
            width: 300,
            height: 300,
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              _bloc.add(ColorEvent.event_purple);
            },
            backgroundColor: Colors.purple,
          ),
          SizedBox(
            width: 20,
          ),
          FloatingActionButton(
            onPressed: () {
              _bloc.add(ColorEvent.event_yellow);
            },
            backgroundColor: Colors.yellow,
          )
        ],
      ),
    );
  }
}
