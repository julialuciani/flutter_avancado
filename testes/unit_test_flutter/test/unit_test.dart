
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import 'change_counter.dart';

void main() {
  late ChangeCounter changeCounter;

  setUp(() {
    changeCounter = ChangeCounter();
  });

  group('Testing the class ChangeCounter',(){
    test('Testing initial value of change counter', (){
    expect(changeCounter.counter, equals(0));
  }, skip: true);
  test('Testing increment of change counter', () {
    changeCounter.increment();
    expect(changeCounter.counter, equals(1));
    
  });

  test('Testing decrement of ChangeCounter', () {
    changeCounter.decrement();
    expect(changeCounter.counter, equals(-1));
  });
  });
}
