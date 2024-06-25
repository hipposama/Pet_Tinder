import 'package:flutter/material.dart';
import '../models/owner.dart';
import 'chat_screen.dart';

class OwnerProfileScreen extends StatelessWidget {
  final Owner owner;

  OwnerProfileScreen({Key? key, required this.owner}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${owner.name}\'s Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('lib/assets/${owner.imageUrl}'),
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
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatScreen()),
                );
              },
              child: Text('Chat with ${owner.name}'),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white, // Set background color to white
    );
  }
}
