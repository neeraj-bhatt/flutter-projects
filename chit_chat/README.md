# 💬 chit-chat : Flutter Chat App

A simple group chatting application built using **Flutter** and **Firebase**, where all users communicate in a single shared chatroom — like a classic group chat!

> 🚧 This is an early version of the app. Currently, all messages go into a **global chat** room. Support for private chats, groups, and user presence is planned.

---

## 📱 Features

- 🔥 Real-time messaging using **Firebase Firestore**
- 👤 User authentication with **Firebase Auth**
- 💬 Live group chat experience
- 🚀 Clean, minimal UI built with Flutter

---

## 🖼️ Screenshots

> *(Add some screenshots here later to show off the UI)*

---

## 🔧 Getting Started

### Prerequisites

- Firebase account & project: [Firebase Console](https://console.firebase.google.com/)
---

### 🚀 Firebase Setup

To run this project locally, you need to connect your own Firebase project:

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Create a new project
3. Add a new Android/iOS app to the project
4. Download the config files:
    - `google-services.json` → place in `android/app/`
    - `GoogleService-Info.plist` → place in `ios/Runner/`
5. Enable the following Firebase services:
    - Firebase Authentication (Email/Password)
    - Firestore Database

Don’t forget to run:
```bash
flutter pub get
flutterfire configure

