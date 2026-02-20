import 'package:week4/test/observer.dart';

class Display implements Observer {
  @override
  void update(int newValue) {
    print("Counter changed to: $newValue");
  }
}
