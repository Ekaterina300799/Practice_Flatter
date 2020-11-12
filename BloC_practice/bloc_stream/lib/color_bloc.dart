// класс, содержащий наш BloC

import 'dart:async';

import 'package:flutter/material.dart';

enum ColorEvent { event_purple, event_yellow }

class ColorBloc {
  Color _color = Colors.purple;

//поток для событий
  final _inputEventController = StreamController<ColorEvent>(); //создаем обертку
  StreamSink<ColorEvent> get inputEventSink => _inputEventController.sink;

//выходной поток
  final _outputStateController = StreamController<Color>();
  Stream<Color> get outputStateStream => _outputStateController.stream;

//метод, который преобразует событие в новое состояние
  void _mapEventtoState(ColorEvent event) {
    if (event == ColorEvent.event_purple)
      _color = Colors.purple;
    else if (event == ColorEvent.event_yellow)
      _color = Colors.yellow;
    else
      throw Exception('Wrong');

    _outputStateController.sink.add(_color);
  }

  ColorBloc(){
    _inputEventController.stream.listen(_mapEventtoState);
  }


  void dispose(){
    _inputEventController.close();
    _outputStateController.close();
  }
}
