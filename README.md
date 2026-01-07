# Notes App - Flutter + Firebase Technical Assignment

A sleek and efficient Notes Application built with **Flutter** and **Firebase** as part of a technical assessment. The app demonstrates robust CRUD operations, user authentication, session persistence, and offline handling.

## 🚀 Features

### Core Functionalities
- **User Authentication**: Secure Email & Password Sign Up and Log In.
- **Session Persistence**: Users stay logged in even after the app is closed and restarted.
- **CRUD Operations**: Complete control over your notes — Create, View, Update, and Delete.
- **Ownership Security**: Each user can only access, edit, or delete their own notes.

### 🧠 Additional Requirements Implemented
- **Option A - Offline Handling**: The app gracefully handles internet connectivity issues. If the connection is lost, users are directed to a clean "No Internet" screen with a retry mechanism.
- **Option B - Search Notes**: Fast, client-side search functionality allows users to filter their notes by title in real-time.

---

## 🛠 Tech Stack

- **Framework**: [Flutter](https://flutter.dev/)
- **Backend Service**: [Firebase](https://firebase.google.com/)
  - **Firebase Auth**: For secure user management.
  - **Cloud Firestore**: For real-time, scalable NoSQL database storage.
- **State Management**: [GetX](https://pub.dev/packages/get) (also used for Routing and Dependency Injection).
- **Architecture**: MVC (Model-View-Controller) adapted for GetX.
- **UI Components**:
  - `google_fonts` for modern typography.
  - `shimmer` for loading states.
  - `toastification` for elegant snackbars and notifications.
  - `connectivity_plus` for tracking network status.

---

## 📂 Database Schema

The app uses a single Firestore collection named `notes`.

### **Collection: `notes`**

| Field | Type | Description |
| :--- | :--- | :--- |
| `id` | String | Unique document ID (also stored within the document). |
| `title` | String | The title of the note. |
| `content` | String | The main body/text of the note. |
| `createdAt` | Timestamp | The date and time when the note was created. |
| `updatedAt` | Timestamp | The date and time when the note was last modified. |
| `userId` | String | The Firebase UID of the owner (ensures data isolation). |
| `isDelete` | Boolean | Flag used for soft deletion. |

---

## ⚙️ Setup & Installation

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) installed on your machine.
- An Android Emulator or a real device with Developer Options enabled.

### Steps to Run Locally

1. **Clone the repository**:
   ```bash
   git clone https://github.com/vaghasiyasahil/Notes-App.git
   cd Notes-App
   ```

2. **Install Dependencies**:
   ```bash
   flutter pub get
   ```

3. **Firebase Configuration**:
   > [!NOTE]
   > For the purpose of this technical assignment and ease of testing, the `google-services.json` and `firebase_options.dart` files are intentionally included in this repository. This allows the reviewer to run the app immediately without additional setup.


4. **Run the App**:
   ```bash
   flutter run
   ```

---

## 🏗 Assumptions & Trade-offs

- **Soft Delete**: I implemented an `isDelete` flag in the schema. While Firestore allows for direct deletion, soft-deletion is a best practice for data recovery and offline sync scenarios.
- **Client-side Search**: For a simple notes app, client-side filtering (using GetX reactive variables) provides the best user experience with zero latency compared to server-side queries.
- **GetX**: Chosen for its simplicity and the speed it provides for developing small to medium-scale applications without boilerplate code.

---

## 🎨 UI Preview
The UI is designed to be clean and readable, following Material 3 guidelines. It features a responsive grid/list layout for notes, intuitive action buttons, and a polished search bar.

---

## ✅ Submission Checklist
- [x] Authentication (Sign up, Log in, Log out)
- [x] Secure CRUD operations (User-specific data)
- [x] Persisted Login State
- [x] Offline Handling (Option A)
- [x] Search Functionality (Option B)
- [x] Working APK generated
- [x] Public GitHub Repository with README.md

---
