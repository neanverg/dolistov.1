import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<String> _todo = [];
  List<String> get todo => _todo;
  set todo(List<String> value) {
    _todo = value;
  }

  void addToTodo(String value) {
    _todo.add(value);
  }

  void removeFromTodo(String value) {
    _todo.remove(value);
  }

  void removeAtIndexFromTodo(int index) {
    _todo.removeAt(index);
  }

  void updateTodoAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _todo[index] = updateFn(_todo[index]);
  }

  void insertAtIndexInTodo(int index, String value) {
    _todo.insert(index, value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
