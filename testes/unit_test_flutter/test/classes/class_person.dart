class Person {
  String name = 'Júlia';
  int age = 17;
  bool work = true;
  int yearsToRetire = 50;
  int retirementTime = 0;
  bool isGoing = false;

  yearsToRetirement() {
    retirementTime = yearsToRetire - age;
  }

  isGoingToRetire() {
    if (work == true) {
      isGoing = true;
    } else {
      isGoing = false;
    }
  }
}
