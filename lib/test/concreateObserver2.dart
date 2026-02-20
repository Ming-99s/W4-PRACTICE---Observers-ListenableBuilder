import 'package:week4/test/observer.dart';

class Logger implements Observer {
  @override
  void update(int newValue) {
    print("Logger: Value changed to $newValue");
  }
}
