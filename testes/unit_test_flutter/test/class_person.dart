class Person {
  String name = 'Júlia';
  int age = 17;
  bool work = true;
  int yearsToRetire = 50;
  int retirement = 0;
  bool isGoing = false;

  yearsToRetirement() {
    retirement = yearsToRetire - age;
  }

  isGoingToRetire() {
    if (work == true) {
      isGoing = true;
    } else {
      isGoing = false;
    }
  }
}
