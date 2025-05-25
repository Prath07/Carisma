# Mobile Application Development Project for COMP3130
# Carisma
Carisma is a Flutter-based mobile application that allows users to capture and share interesting car sightings. Users can upload photos through their camera or gallery, add details, and post them to a shared feed. Each user has a profile section showing their own posts in a grid layout.

This project was developed as part of the COMP3130 – Mobile Application Development unit.

## Project Overview
Carisma enables users to:
- Sign up and log in with an email and password
- Take or upload a photo of a car
- Add contextual details (Make + Model of the car) and location data
- View a global feed of shared posts
- Access a personal profile showing uploaded posts

## Features

### Authentication
- Sign-up and sign-in functionality using Firebase Authentication
- Basic input validation and error handling

### Snap + Upload
- Users can upload photos using the device camera or select from the gallery
- Car details and current location are saved with each post
- Images and metadata are uploaded to Firebase Storage and Firestore

### Home Feed
- Shows a list of recent posts from all users
- Displays car photo, description, user info, and upload time

### User Profile
- Grid view of all photos uploaded by the currently signed-in user
- Data is pulled dynamically from Firestore based on the user's ID

## Testing

### Widget Tests
1. test/widgets/login_screen_test.dart — Tests LoginScreen widget UI and interactions
2. test/widgets/login_screen_test.dart — Tests LoginScreen widget UI and interactions
3. test/widgets/login_screen_test.dart — Tests LoginScreen widget UI and interactions

### Unit Tests
1. test/unit/auth_unit_test.dart — Tests Firebase authentication logic (sign-in, sign-out)
2. test/unit/auth_unit_test.dart — Tests Firebase authentication logic (sign-in, sign-out)

### Integration Test
A basic end-to-end test checks the snap-to-feed flow:
- Sign in
- Take/upload a photo
- Submit the post
- Verify it appears in the feed

To run tests:
flutter test

Technologies Used:

Flutter:	Mobile UI development
Firebase Auth:	User authentication
Firebase Firestore:	Storing post metadata
Firebase Storage:	Hosting uploaded images
Flutter Test	Unit and widget testing

Developer Notes:
The application is structured to support future enhancements such as:
- Post commenting
- Ability to follow users and more
- AI-based car model detection
- Gamification features (badges, points)
- Car event pages or community features
