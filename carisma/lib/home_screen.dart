import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'upload_page.dart';  // Adjust the path if needed

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carisma Feed'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('Welcome to Carisma! 🚗'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.upload),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  UploadPage()),
          );
        },
      ),
    );
  }
}
