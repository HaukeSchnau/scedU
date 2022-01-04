import 'dart:math';

String getBasicGreeting() {
  final now = DateTime.now();
  if (now.hour >= 18) return "Guten Abend";
  if (now.hour > 5 && now.hour < 12) return "Guten Morgen";
  const generalGreetings = ["Moin", "Hey", "Hi", "Hallo"];
  return generalGreetings[Random().nextInt(generalGreetings.length)];
}

String getGreeting({String? name}) {
  if (name != null) return "${getBasicGreeting()}, $name!";
  return getBasicGreeting() + "!";
}
