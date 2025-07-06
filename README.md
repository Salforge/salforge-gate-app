# Salforge Gate App

A proprietary Flutter application with Firebase backend implementing Role-Based Access Control (RBAC) system.

## 🏢 Salforge Product

This is a **proprietary product** developed by **Salforge**. All rights are reserved.

**⚠️ IMPORTANT NOTICE:**

- This software is **CLOSED SOURCE**
- **NO DISTRIBUTION** is permitted without explicit written authorization
- **CONFIDENTIAL** - For authorized personnel only
- Unauthorized access, use, or distribution is strictly prohibited

## 🚀 Project Overview

Salforge Gate App is built with Flutter and Firebase and provides a comprehensive foundation for building applications with user authentication, role-based access control, and modular architecture.

**Current Status**: 🚧 **In Development** - Core authentication and dashboard features are functional, with additional features in progress.

## 🏗️ Architecture

The application follows a **feature-based architecture** with clean separation of concerns:

```
lib/
├── core/                    # Core utilities and services
│   ├── services/           # Firebase services (Auth, Firestore)
│   ├── theme/              # App theming and styling
│   └── widgets/            # Reusable UI components
├── features/               # Feature modules
│   ├── auth/              # ✅ Authentication functionality
│   ├── dashboard/         # ✅ Main dashboard
│   ├── gate/              # 🚧 Gate management (in progress)
│   └── users/             # 🚧 User management (in progress)
├── models/                # 🚧 Data models (in progress)
├── routes/                # ✅ App routing configuration
├── firebase_options.dart  # ✅ Firebase configuration
└── main.dart              # ✅ App entry point
```

## 🛠️ Tech Stack

- **Frontend**: Flutter (Dart)
- **Backend**: Firebase
- **State Management**: Riverpod
- **Navigation**: GoRouter
- **Authentication**: Firebase Auth
- **Database**: Cloud Firestore
- **UI**: Material Design 3

## 📦 Dependencies

### Core Dependencies

- `flutter`: SDK framework
- `firebase_core`: ^3.15.1 - Firebase core functionality
- `firebase_auth`: ^5.6.2 - User authentication
- `cloud_firestore`: ^5.6.11 - NoSQL database
- `firebase_crashlytics`: ^4.3.9 - Crash reporting
- `flutter_riverpod`: ^2.6.1 - State management
- `go_router`: ^16.0.0 - Declarative routing

## 🚦 Getting Started

### Prerequisites

- Flutter SDK (>=3.3.0)
- Firebase project setup
- Android Studio / VS Code
- Git

### Installation

**⚠️ For Authorized Personnel Only**

1. **Access the repository** (authorized team members only)

   ```bash
   cd salforge_gate_app
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Run the application**
   ```bash
   flutter run
   ```

## 📱 Features

### ✅ Implemented Features

#### 🔐 Authentication

- ✅ User registration and login pages
- ✅ Firebase Auth integration
- ✅ Session management with Riverpod
- ✅ Password reset functionality
- ✅ Email validation
- ✅ Error handling with user-friendly messages

#### 📊 Dashboard

- ✅ User-specific dashboard
- ✅ Welcome section with user info
- ✅ Quick action buttons
- ✅ Stats overview cards
- ✅ Recent activity section

#### 🎨 UI/UX

- ✅ Material Design 3 theming
- ✅ Dark mode compatibility
- ✅ Custom color schemes
- ✅ Custom button components
- ✅ Consistent styling

#### 🗺️ Navigation

- ✅ GoRouter implementation
- ✅ Route protection (auth guards)
- ✅ Error page handling

### 🚧 In Progress / Planned Features

#### 👥 Role-Based Access Control (RBAC)

- 🚧 User role assignment
- 🚧 Permission-based access control
- 🚧 Role hierarchy management
- 🚧 Feature access restriction

#### 🚪 Gate Management

- 🚧 Access control system
- 🚧 Gate status monitoring
- 🚧 Permission-based gate operations
- 🚧 Activity logging

#### 👤 User Management

- 🚧 User profile management
- 🚧 Role assignment interface
- 🚧 User activity tracking
- 🚧 Admin user controls

#### 📊 Analytics

- 🚧 User analytics
- 🚧 Access reports

## 🔧 Configuration

### Firebase Configuration

The Firebase configuration is managed through `firebase_options.dart` and includes:

- **Project ID**: `salforge-gate-app`
- **Android App ID**: `1:813099475976:android:d182c89bc02468b8ea1dbd`
- **iOS App ID**: `1:813099475976:ios:a7cb68c6f772d509ea1dbd`

### Theme Configuration

- Material Design 3 support
- Dark mode compatibility
- Custom color schemes (`AppColors`)
- Responsive design principles

## 🧪 Development

### Project Structure Guidelines

- **Features**: Each feature is self-contained with its own controllers, pages, and widgets
- **Core**: Shared utilities, services, and components
- **Models**: Data structures and business logic
- **Routes**: Centralized navigation configuration

### State Management

The app uses Riverpod for state management with the following patterns:

- **Providers**: For dependency injection
- **StateNotifiers**: For complex state management (AuthController)
- **FutureProviders**: For async operations (authStateProvider)

### Code Organization

- Follow Flutter/Dart conventions
- Use meaningful file and class names
- Implement proper error handling
- Add documentation for complex functions

## 🚀 Deployment

### Android

```bash
flutter build apk --release
```

### iOS

```bash
flutter build ios --release
```

### Firebase Hosting (Web)

```bash
flutter build web
firebase deploy
```

## ⚠️ Known Issues

1. **Placeholder Routes**:

   - Gates, Users, Profile, and Settings pages show "Coming Soon" messages
   - These will be implemented in future iterations

2. **Incomplete Services**:
   - Firestore service is currently a stub
   - User model is not yet implemented
   - RBAC system is planned but not yet implemented

## 🧪 Testing

Currently, the project has:

- ✅ Basic widget tests setup
- 🚧 Unit tests for services (planned)
- 🚧 Integration tests (planned)

## 📊 Performance Monitoring

The app includes Firebase Crashlytics for:

- Crash reporting
- Performance monitoring
- User analytics
- Error tracking

## 🤝 Contributing

**This is a closed-source project.** Contributions are restricted to authorized Salforge team members only.

For authorized contributors:

1. Create a feature branch (`git checkout -b feature/amazing-feature`)
2. Commit your changes (`git commit -m 'Add amazing feature'`)
3. Push to the branch (`git push origin feature/amazing-feature`)
4. Open a Pull Request for internal review

## 📄 License

**PROPRIETARY SOFTWARE - ALL RIGHTS RESERVED**

This software is the exclusive property of **Salforge**. No license is granted for use, modification, or distribution. All rights are reserved.

**Copyright © 2025 Salforge. All rights reserved.**

- **NO REDISTRIBUTION** permitted
- **NO MODIFICATION** permitted without authorization
- **NO COMMERCIAL USE** permitted without license
- **CONFIDENTIAL** and proprietary information

## 🆘 Support

**For Authorized Personnel Only**

Support is available exclusively to authorized Salforge team members:

- Internal team communication channels
- Direct contact with development team
- Internal documentation and resources

**External Support:** Not available for this proprietary software.

## 📈 Roadmap

### Phase 1: Core Features (Current)

- [x] Authentication system
- [x] Dashboard UI
- [x] Basic routing
- [x] Firebase integration
- [ ] Bug fixes and optimization

### Phase 2: User Management

- [ ] User profiles
- [ ] RBAC implementation
- [ ] Admin interfaces
- [ ] User permissions

### Phase 3: Gate Management

- [ ] Gate control system
- [ ] Access logs
- [ ] Real-time monitoring
- [ ] Gate permissions

### Phase 4: Advanced Features

- [ ] Analytics dashboard
- [ ] Real-time notifications
- [ ] Advanced reporting
- [ ] Multi-language support

---

**Version**: 1.0.0
**Flutter Version**: >=3.3.0
**Last Updated**: December 2024
**Status**: 🚧 In Development
