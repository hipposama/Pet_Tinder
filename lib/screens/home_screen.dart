import 'package:flutter/material.dart';
import 'pet_detail_screen.dart';
import 'profile_screen.dart';
import 'chat_screen.dart';
import '../models/pet.dart';
import '../models/owner.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final Owner currentUser = Owner(
    name: 'Current User',
    age: 25,
    contact: 'currentuser@example.com',
    imageUrl: 'lib/assets/currentuser.jpg',
  );

  final List<Pet> pets = [
    Pet(
      name: 'Bella',
      age: 2,
      breed: 'Scottish fold',
      imageUrl: 'lib/assets/bella.jpg',
      owner: Owner(
        name: 'John Doe',
        age: 30,
        contact: 'johndoe@example.com',
        imageUrl: 'lib/assets/johndoe.jpg',
      ),
    ),
    Pet(
      name: 'Fran',
      age: 3,
      breed: 'American Shorthair',
      imageUrl: 'lib/assets/fran.jpg',
      owner: Owner(
        name: 'Jane Smith',
        age: 28,
        contact: 'janesmith@example.com',
        imageUrl: 'lib/assets/janesmith.jpg',
      ),
    ),
    // Add more pets here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pet Tinder'),
      ),
      body: ListView.builder(
        itemCount: pets.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        PetDetailScreen(pet: pets[index], pets: pets)),
              );
            },
            child: Card(
              margin: EdgeInsets.all(16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              elevation: 4.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(16.0)),
                    child: Image.asset(
                      pets[index].imageUrl,
                      width: double.infinity,
                      height: 300.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pets[index].name,
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8.0),
                        Text('${pets[index].age} years old'),
                        SizedBox(height: 8.0),
                        Text(pets[index].breed),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
        ],
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProfileScreen(
                      owner: currentUser, pets: pets, isOwnProfile: true)),
            );
          } else if (index == 2) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ChatScreen()));
          }
        },
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
