import 'package:flutter/material.dart';
import '../models/owner.dart';
import '../models/pet.dart';
import 'chat_screen.dart';
import 'pet_detail_screen.dart';

class ProfileScreen extends StatelessWidget {
  final Owner owner;
  final bool isOwnProfile;
  final List<Pet> pets;

  ProfileScreen(
      {Key? key,
      required this.owner,
      required this.pets,
      this.isOwnProfile = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Pet> ownerPets =
        pets.where((pet) => pet.owner.name == owner.name).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(isOwnProfile ? 'My Profile' : '${owner.name}\'s Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(owner.imageUrl),
              radius: 50,
            ),
            SizedBox(height: 16.0),
            Text(
              '${owner.name}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text('Age: ${owner.age}'),
            SizedBox(height: 8.0),
            Text('Contact: ${owner.contact}'),
            if (!isOwnProfile) SizedBox(height: 16.0),
            if (!isOwnProfile)
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChatScreen()),
                  );
                },
                child: Text('Chat with ${owner.name}'),
              ),
            SizedBox(height: 16.0),
            Text(
              'Pets:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Expanded(
              child: ownerPets.isEmpty
                  ? Center(
                      child: Text('None',
                          style: TextStyle(fontSize: 18, color: Colors.grey)))
                  : ListView.builder(
                      itemCount: ownerPets.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                AssetImage(ownerPets[index].imageUrl),
                          ),
                          title: Text(ownerPets[index].name),
                          subtitle: Text(ownerPets[index].breed),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PetDetailScreen(
                                      pet: ownerPets[index], pets: pets)),
                            );
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
