import 'package:week4/test/observer.dart';

class Counter {
  int _value = 0;
  final List<Observer> _observers = [];

  void addObserver(Observer observer) {
    _observers.add(observer);
  }

  void increment() {
    _value++;
    notify();
  }

  void notify() {
    for (var observer in _observers) {
      observer.update(_value);
    }
  }
}
