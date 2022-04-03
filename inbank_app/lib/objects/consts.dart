import 'package:inbank_app/objects/person.dart';

class Constraints {

  static List amounts = ["2000 €","2500 €","3000 €","3500 €","4000 €","4500 €","5000 €","5500 €","6000 €","6500 €","7000 €","7500 €","8000 €","8500 €","9000 €","9500 €","10000 €"];
  static List periods= ["12 months","18 months","24 months","30 months","36 months","42 months","48 months","54 months","60 months"];

  static  Person person1 = Person(id: "49002010965", debt: true);
  static  Person person2 = Person(id: "49002010976", debt: false,credit: 100);
  static  Person person3 = Person(id: "49002010987", debt: false,credit: 300);
  static  Person person4 = Person(id: "49002010998", debt: false,credit: 1000);

  static List persons = [person1,person2,person3,person4];
}