import 'owner.dart';

class Pet {
  final String name;
  final int age;
  final String breed;
  final String imageUrl;
  final Owner owner;

  Pet({
    required this.name,
    required this.age,
    required this.breed,
    required this.imageUrl,
    required this.owner,
  });
}
