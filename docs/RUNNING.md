# How to Run the Leafcloud Mobile App

This guide will walk you through the steps to get the Leafcloud mobile app running on your local machine for development and testing.

## Prerequisites

Before you begin, ensure you have the following installed on your system:

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- A code editor like [Visual Studio Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio).
- An Android emulator, iOS simulator, or a physical device connected to your computer.

## 1. Install Dependencies

First, you need to fetch all the project dependencies defined in the `pubspec.yaml` file. Open your terminal, navigate to the root directory of the project, and run the following command:

```bash
flutter pub get
```

## 2. Run the App

Once the dependencies are installed, you can run the app on your connected device, emulator, or simulator.

Execute the following command in your terminal:

```bash
flutter run
```

This command will build the application and install it on your target device. The app will automatically launch once the build is complete.
