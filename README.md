# Swift Checkin

A professional Flutter application built as a machine task submission, demonstrating clean UI implementation, navigation, and code quality using modern Flutter best practices.

---

## 🚀 Demo

> **Demo Video/Screenshots:**
> [Demo](assets/demo/demo.gif)

---

## ✨ Features (as per requirements)

1. **UI Implementation**
   - Faithfully replicates the provided Login, Home, and Popup UI designs using Flutter.
   - Uses appropriate widgets, theming, and styling for a polished look.
2. **Navigation**
   - Smooth navigation from Login to Home (on button tap/form submission).
   - Manual Check-in button on Home triggers the Popup dialog.
   - Uses named routes for clear navigation structure.
3. **Code Quality**
   - Follows Flutter best practices: separation of concerns, modular widgets, and maintainable code.
   - Clean, readable, and well-structured Dart code.

---

## 🛠 Setup Instructions

1. **Prerequisites**
   - Flutter SDK 3.32.5 or later
   - Android Studio / VS Code

2. **Clone the repository**
   ```bash
   git clone https://github.com/JuzuliMP/swift_checkin.git
   cd swift_checkin
   ```

3. **Install dependencies**
   ```bash
   flutter pub get
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

---

## 🧑‍💻 Brief Explanation of My Approach

- **Architecture:**
  - MVVM-inspired structure: clear separation between UI (View), business logic (Cubit/ViewModel), and data (Model, if needed).
  - All UI code is organized under `features/` by domain (auth, home, checkin), each with its own `presentation` layer.
- **State Management:**
  - Uses Cubit (from flutter_bloc) for predictable, testable state management.
- **Navigation:**
  - Named routes are defined in `core/routes/app_routes.dart` for maintainable navigation.
- **Theming:**
  - Custom light and dark themes in `core/theme/app_theme.dart` for a modern look.
  - Add DMSans font family to the project and used update app theme.
- **Code Quality:**
  - Modular widgets, clear folder structure, and consistent naming for maintainability.

---

## ➕ Additional Implementations (Beyond Requirements)

- **Form Validation:**
  - Simple empty validation for login and check-in forms.
- **Loading States:**
  - Simulated API loading indicators for better UX.
- **light theme:**
  - Although the app currently uses a dark theme, full implementation for the light theme has already been completed.
- **Error Handling:**
  - Clear error messages and disabled states during processing.
- **Additional functionalities:**
  - Implementation to start working hours when user login to the app.

---

## 📁 Folder Structure

```
lib/
├── core/
│   ├── routes/           # Named routes configuration
│   └── theme/            # Theme definitions
├── features/
│   ├── auth/             # Login UI & logic
│   ├── home/             # Home screen UI & logic
│   └── checkin/          # Check-in dialog UI & logic
└── main.dart             # App entry point
```
