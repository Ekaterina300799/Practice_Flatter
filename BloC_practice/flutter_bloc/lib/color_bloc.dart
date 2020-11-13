// класс, содержащий наш BloC with flutter_bloc
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum ColorEvent { event_purple, event_yellow }

class ColorBloc extends Bloc<ColorEvent, Color> {
  Color _color = Colors.purple;
  ColorBloc(Color initialState) : super(Colors.purple);

  @override
  Stream<Color> mapEventToState(ColorEvent event) async*{
    _color = (event == ColorEvent.event_purple) ? Colors.purple : Colors.yellow;
    yield _color;
  }

}
