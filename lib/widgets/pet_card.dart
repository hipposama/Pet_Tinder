import 'package:flutter/material.dart';
import '../models/pet.dart';
import '../screens/pet_detail_screen.dart';
import '../screens/owner_profile_screen.dart';

class PetCard extends StatelessWidget {
  final Pet pet;

  PetCard({Key? key, required this.pet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PetDetailScreen(
                    pet: pet,
                    pets: [],
                  )),
        );
      },
      child: Card(
        color: Colors.white, // Ensure the card background is white
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200.0,
              child: Image.asset(
                pet.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pet.name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text('${pet.age} years old'),
                  Text(pet.breed),
                  SizedBox(height: 8.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                OwnerProfileScreen(owner: pet.owner)),
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
          ],
        ),
      ),
    );
  }
}
