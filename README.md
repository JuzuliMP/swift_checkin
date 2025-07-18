# Swift Checkin

A comprehensive Flutter application demonstrating UI implementation, navigation, and state management using Cubit with MVVM architecture.

## 📱 Features

### Login Screen
- Clean login interface with phone number input
- 4-digit passcode input with individual digit fields
- "Remember me" checkbox functionality
- "Forgot Passcode" link
- "Register" account creation link
- Form validation with error handling
- Loading states during authentication

### Home Screen
- User greeting with profile information
- Real-time working hours timer (HH:MM:SS format)
- Manual check-in button
- Bottom navigation with 4 tabs (Home, Activities, Jobs, Notifications)
- Responsive design with proper spacing

### Check-in Dialog
- Modal popup triggered from home screen
- Worker type selection with icon
- Project and Gates dropdown selectors
- Work type radio buttons (Budget/Issue)
- Form validation and submission
- Success feedback via SnackBar

## 🏗️ Architecture

### MVVM Pattern with Cubit State Management
This app follows MVVM (Model-View-ViewModel) pattern:

### Layer Responsibilities:
- **View**: UI widgets and user interaction (`presentation/pages/`, `presentation/widgets/`)
- **ViewModel**: Business logic and state management (`presentation/cubit/`)
- **Model**: Data and API calls (would be in `domain/` and `data/` layers)

### Benefits:
- Clear separation of concerns
- Improved testability
- Reactive UI updates
- Maintainable codebase

```
lib/
├── core/
│   ├── routes/
│   │   └── app_routes.dart           # Named routes configuration
│   └── theme/
│       └── app_theme.dart            # Light/Dark theme definitions
├── features/
│   ├── auth/
│   │   └── presentation/
│   │       ├── cubit/
│   │       │   ├── auth_cubit.dart   # Authentication state management
│   │       │   └── auth_state.dart   # Authentication states
│   │       ├── pages/
│   │       │   └── login_page.dart   # Login screen
│   │       └── widgets/
│   │           ├── login_form.dart   # Login form widget
│   │           └── passcode_field.dart # 4-digit passcode input
│   ├── home/
│   │   └── presentation/
│   │       ├── cubit/
│   │       │   ├── home_cubit.dart   # Home screen state management
│   │       │   └── home_state.dart   # Home screen states
│   │       ├── pages/
│   │       │   └── home_page.dart    # Home screen
│   │       └── widgets/
│   │           ├── home_header.dart  # Header with menu/download icons
│   │           ├── working_hours_card.dart # Timer display card
│   │           ├── manual_checkin_button.dart # Check-in button
│   │           └── bottom_navigation.dart # Bottom navigation bar
│   └── checkin/
│       └── presentation/
│           ├── cubit/
│           │   ├── checkin_cubit.dart # Check-in state management
│           │   └── checkin_state.dart # Check-in states
│           ├── pages/
│           │   └── checkin_dialog.dart # Check-in modal dialog
│           └── widgets/
│               ├── checkin_form.dart  # Check-in form
│               ├── worker_type_selector.dart # Worker type display
│               ├── dropdown_field.dart # Reusable dropdown
│               └── work_type_selector.dart # Radio button selector
└── main.dart                         # App entry point
```

## 🎨 Design Implementation

### Theme System
- **Dark Theme**: Matches the provided design screenshots
    - Background: `#1A1A1A`
    - Surface: `#2A2A2A`
    - Primary: `#E67E22` (Orange)
    - Text: White with proper contrast

- **Light Theme**: Complementary light version
    - Background: `#F5F5F5`
    - Surface: White
    - Primary: `#E67E22` (Orange)
    - Text: Dark with proper contrast

### Responsive Design
- Proper spacing and padding throughout
- Scalable text sizes
- Adaptive layouts for different screen sizes
- Material Design 3 principles

## 🔧 Technical Implementation

### State Management
- **Cubit** for predictable state management
- **Equatable** for state comparison
- Proper separation of business logic and UI

### Key Features
1. **Authentication Flow**
    - Phone number validation
    - 4-digit passcode input with auto-focus
    - Loading states during login
    - Error handling with user feedback

2. **Timer Functionality**
    - Real-time working hours counter
    - Proper time formatting (HH:MM:SS)
    - Timer lifecycle management

3. **Form Validation**
    - Empty field validation
    - Passcode length validation
    - User-friendly error messages

4. **Navigation**
    - Named routes implementation
    - Smooth transitions between screens
    - Modal dialog presentation

### Loading States
- 3-second simulated API calls
- Loading indicators on buttons
- Disabled states during processing
- User feedback via SnackBars

## 📦 Dependencies

```yaml
dependencies:
  flutter: sdk: flutter
  flutter_bloc: ^8.1.3    # State management with Cubit
  equatable: ^2.0.5       # Value equality for states
  cupertino_icons: ^1.0.2 # iOS-style icons

dev_dependencies:
  flutter_test: sdk: flutter
  flutter_lints: ^3.0.0   # Linting rules
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK 3.0 or later
- Dart 3.0 or later
- Android Studio / VS Code
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd flutter_takehome_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Building for Production

```bash
# Android
flutter build apk --release

# iOS
flutter build ios --release
```

## 🧪 Testing

### Running Tests
```bash
flutter test
```

### Test Coverage
- Unit tests for Cubit state management
- Widget tests for UI components
- Integration tests for user flows

## 📱 Usage Guide

### Login Process
1. Enter phone number
2. Input 4-digit passcode
3. Optionally check "Remember me"
4. Tap "Login" button
5. Navigate to home screen on success

### Home Screen
1. View current working hours
2. Tap "Manual Check-in" to start check-in process
3. Use bottom navigation to switch between tabs

### Check-in Process
1. Review worker type (pre-selected)
2. Select project from dropdown
3. Select gate from dropdown
4. Choose work type (Budget/Issue)
5. Tap "Check-in" button
6. View success message

## 🎯 Key Highlights

### Code Quality
- Clean, readable, and maintainable code
- Proper separation of concerns
- Consistent naming conventions
- Comprehensive error handling

### User Experience
- Smooth animations and transitions
- Responsive design across devices
- Intuitive navigation patterns
- Clear user feedback

### Performance
- Efficient state management
- Optimized widget rebuilds
- Proper resource management
- Memory leak prevention

## 🔮 Future Enhancements

### Potential Improvements
1. **Backend Integration**
    - API calls for authentication
    - Real-time data synchronization
    - User profile management

2. **Advanced Features**
    - Biometric authentication
    - Offline capabilities
    - Push notifications
    - Data analytics

3. **UI/UX Enhancements**
    - Custom animations
    - Advanced theming
    - Accessibility improvements
    - Micro-interactions

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## 📝 License

This project is created for a take-home assignment and is for demonstration purposes only.

---

**Developed with ❤️ using Flutter**

*For any questions or clarifications, please feel free to reach out.*
