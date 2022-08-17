import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import 'classes/class_person.dart';

void main() {
  late Person person;

  setUp(() {
    person = Person();
  });

  group('Testing if the data of the class person is correct', () {
    test('Testing if the age is correct', () {
      expect(person.age, equals(17));
    });

    test('If the name is correct', () {
      expect(person.name, equals('Júlia'));
    });
  });

  group('Testing if the methods of the class are working', () {
    test('If method years to retire is working (method yearsToRetirement)', () {
      person.yearsToRetirement();
      expect(person.retirementTime, equals(33));
    });

    test('If the person is going to retire someday(method isGoingToRetire)', () {
      person.isGoingToRetire();
      expect(person.isGoing, equals(true));
    });
  });
}
