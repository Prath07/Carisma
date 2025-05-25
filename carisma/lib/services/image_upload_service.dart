import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ImageUploadService {
  final ImagePicker _picker = ImagePicker();

  /// Prompts the user to choose between camera or gallery
  Future<XFile?> pickImage(BuildContext context) async {
    return await showModalBottomSheet<XFile?>(
      context: context,
      builder: (_) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text("Take a photo"),
              onTap: () async {
                final file = await _picker.pickImage(source: ImageSource.camera);
                Navigator.pop(context, file);
              },
            ),
            ListTile(
              leading: Icon(Icons.photo),
              title: Text("Choose from gallery"),
              onTap: () async {
                final file = await _picker.pickImage(source: ImageSource.gallery);
                Navigator.pop(context, file);
              },
            ),
          ],
        ),
      ),
    );
  }

  /// Uploads the image to Firebase Storage and saves info in Firestore
  Future<void> uploadImage(XFile imageFile, String userId, String carDetails) async {
    final fileName = path.basename(imageFile.path);
    final ref = FirebaseStorage.instance.ref().child('car_photos/$userId/$fileName');
    print('Uploading to path: car_photos/$userId/$fileName');

    await ref.putFile(File(imageFile.path));
    final url = await ref.getDownloadURL();

    await FirebaseFirestore.instance.collection('car_posts').add({
      'userId': userId,
      'imageUrl': url,
      'carDetails': carDetails,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }
}
