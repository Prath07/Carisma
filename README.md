# Mobile Application Development Project for COMP3130
# Carisma
Carisma is a dynamic mobile app that allows car enthusiasts to capture, share, and discover photos and videos of unique cars spotted in everyday life. Whether it’s a rare classic, an exotic sports car, or a customised masterpiece, Carisma gives users an easy and interactive platform to document the vehicles they encounter. The app fosters a passionate community of car lovers, encouraging users to share their car sightings, interact with fellow enthusiasts, and explore the wide world of automotive culture, all from the convenience of their phones. 

Designed for users aged 13 and older, Carisma enables anyone to create an account by registering with their email and choosing a username. Once signed up, users can upload their car sightings, tagging them with relevant details and sharing them with followers or a specific group of car lovers. Carisma also allows users to like and comment, promoting engagement and building a sense of community. Whether discovering rare vehicles or connecting with likeminded enthusiasts, Carisma is the perfect app for anyone eager to immerse themselves in the world of cars.

This project was developed as part of the COMP3130 – Mobile Application Development unit.

## Project Overview
Carisma enables users to:
- Sign up and log in with an email and password
- Take or upload a photo of a car
- Add contextual details (Make + Model of the car) and location data
- View a global feed of shared posts
- Access a personal profile showing uploaded posts

## Devices Used to Test
- Various andriod devices

## Compatible Devices:
- Andriod Devices

## Incompatible Devices
- Web based browsers such as Chrome and Edge (Image files not compatible but the rest of the system works as expected)
- IOS

## Differences from D1
- Small UI changes in regards to the text and some color differences
- The "snap" page has had a UI/UX change after further evaluation on the initial design
- Profile page does not contain the username but the email (to be fixed in future iterations)


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
1. test/widget_test_home.dart — Tests the HomeScreen widget layout and feed behavior.
2. test/widget_test_login.dart — Verifies LoginScreen input handling, button states, and password toggle logic.
3. test/widget_test_profile.dart — Ensures the ProfileScreen renders user info and image grid correctly using a mock user.

### Unit Tests
1. test/unit_test_email_validator.dart — Validates email format logic with various correct/incorrect inputs.
2. test/unit_test_location_format.dart — Checks correct formatting of location strings (lat/lon) for post data.
3. test/unit_test_upload_validation.dart — Tests image and field validation logic before allowing uploads.

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
