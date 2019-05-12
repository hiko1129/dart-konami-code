import 'dart:html';
import 'package:rxdart/rxdart.dart';
import "package:collection/collection.dart";

void main() {
  const konamiKeyCodes = const <int>[
    KeyCode.UP,
    KeyCode.UP,
    KeyCode.DOWN,
    KeyCode.DOWN,
    KeyCode.LEFT,
    KeyCode.RIGHT,
    KeyCode.LEFT,
    KeyCode.RIGHT,
    KeyCode.B,
    KeyCode.A
  ];

  final result = querySelector('#output');
  final keyUp = Observable<KeyboardEvent>(document.onKeyUp);

  keyUp
      .map((event) => event.keyCode)
      .bufferCount(10, 1)
      .where((lastTenKeyCodes) =>
          IterableEquality<int>().equals(lastTenKeyCodes, konamiKeyCodes))
      .listen((_) => result.innerHtml = 'KONAMI!');
}
