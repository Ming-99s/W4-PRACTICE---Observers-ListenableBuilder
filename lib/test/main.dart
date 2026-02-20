

import 'package:week4/test/concreateObserver2.dart';
import 'package:week4/test/concreteObserver.dart';
import 'package:week4/test/subject.dart';

void main() {
  Counter counter = Counter();

  // Create observers
  Display display = Display();
  Logger logger = Logger();

  // Subscribe all
  counter.addObserver(display);
  counter.addObserver(logger);

  // Change state
  counter.increment();
  counter.increment();
  counter.increment();
}
