import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:path/path.dart' as path;
import 'services/image_upload_service.dart';

class UploadPage extends StatefulWidget {
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  File? _image;
  final picker = ImagePicker();
  final TextEditingController _makeController = TextEditingController();
  final TextEditingController _modelController = TextEditingController();

  bool _uploading = false;

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _uploadImage() async {
  if (_image == null || _makeController.text.isEmpty || _modelController.text.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Please fill all fields and select an image')),
    );
    return;
  }

  setState(() => _uploading = true);

  try {
    final fileName = path.basename(_image!.path);
    final storageRef = FirebaseStorage.instance.ref('car_images/$fileName');
    await storageRef.putFile(_image!);
    final imageUrl = await storageRef.getDownloadURL();

    final currentUser = FirebaseAuth.instance.currentUser;

    await FirebaseFirestore.instance.collection('cars').add({
      'make': _makeController.text,
      'model': _modelController.text,
      'image_url': imageUrl,
      'uploaded_by': currentUser?.email ?? 'anonymous',
      'timestamp': FieldValue.serverTimestamp(),
    });

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Upload successful')),
      );
    }

    await Future.delayed(Duration(milliseconds: 500)); // optional pause

    if (context.mounted) {
      Navigator.pop(context); // 👈 go back to the previous screen (e.g., home)
    }
  } catch (e) {
    print('Upload failed: $e');
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Upload failed')),
      );
    }
  } finally {
    if (mounted) {
      setState(() => _uploading = false);
    }
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Upload a Car')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _image != null
                ? Image.file(_image!, height: 200)
                : Container(height: 200, color: Colors.grey[200], child: Center(child: Text('No image selected'))),
            TextField(
              controller: _makeController,
              decoration: InputDecoration(labelText: 'Make'),
            ),
            TextField(
              controller: _modelController,
              decoration: InputDecoration(labelText: 'Model'),
            ),
            SizedBox(height: 20),
            _uploading
                ? CircularProgressIndicator()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        onPressed: _pickImage,
                        icon: Icon(Icons.camera_alt),
                        label: Text('Capture'),
                      ),
                      ElevatedButton.icon(
                        onPressed: _uploadImage,
                        icon: Icon(Icons.upload),
                        label: Text('Upload'),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
