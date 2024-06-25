import 'package:flutter/material.dart';
import '../models/pet.dart';
import 'profile_screen.dart';

class PetDetailScreen extends StatelessWidget {
  final Pet pet;
  final List<Pet> pets;

  PetDetailScreen({Key? key, required this.pet, required this.pets})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pet.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 300.0,
              child: Image.asset(
                pet.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              pet.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text('Age: ${pet.age} years old'),
            SizedBox(height: 8.0),
            Text('Breed: ${pet.breed}'),
            SizedBox(height: 16.0),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ProfileScreen(owner: pet.owner, pets: pets)),
                );
              },
              child: Text(
                'Owner: ${pet.owner.name}',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
