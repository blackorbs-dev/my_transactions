
## 🧾 My Transactions - Flutter App

This is a lightweight, responsive **Transaction Activity** UI built with Flutter and BLoC. It displays a list of mock transactions, allows dynamic filtering by status, and includes responsive layout and animations.

---


https://github.com/user-attachments/assets/7b88ad6e-117c-4c2c-92da-831ab27c3ffc


### ✨ Features

- 📋 Displays a list of 5 mock transactions
- 🔍 Filter by status: **All**, **Successful**, **Pending**, **Failed**
- 🧠 Uses **BLoC** for state management (events, states, business logic)
- 🎞️ Smooth **fade transition animation** between filtered items
- 📱💻 Responsive design for **mobile and web**
- 🚫 Fallback UI when no transactions match the filter

---

### 🗂️ Project Structure

```
lib/
├── bloc/
│   ├── bloc.dart       # Business logic for filtering
│   ├── event.dart      # Events for triggering state changes
│   └── state.dart      # Holds UI state (filtered list + filter)
│
├── models/
│   └── transaction.dart     # Enum and data class for transactions
│
├── screens/
│   └── filter_chips.dart    # Responsive filter layout
│   └── list_view.dart       # Animated list view
│   └── transactions.dart    # Main UI screen
│
└── main.dart                # App entry point
```

---

### 📦 Dependencies

Add these to `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_bloc: ^9.1.1
  animated_list_plus: ^0.5.2
```

---

### 🚀 Getting Started

```bash
git clone https://github.com/blackorbs-dev/my_transactions
cd my_transactions
flutter pub get
flutter run
```

---
