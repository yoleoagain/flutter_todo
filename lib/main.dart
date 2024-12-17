import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_isoz/layouts/page_layout.dart';
import 'pages/login.dart';
// import 'package:flutter_app_isoz/firebase_options.dart'; // Import the firebase options
import 'pages/register.dart';
import 'pages/todo.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Add these lines
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
  };
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions
        .currentPlatform, // Use the default options for the current platform
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      theme: ThemeData(
          primarySwatch: Colors.green,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ))),
          inputDecorationTheme: InputDecorationTheme(
            // Define your common style here
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.blue, width: 2),
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            labelStyle: TextStyle(color: Colors.grey[700]),
            hintStyle: TextStyle(color: Colors.grey),
            errorStyle: TextStyle(color: Colors.red),
          )),
      initialRoute: '/',
      routes: {
        '/': (context) => PageContainer(child: RegisterPage()),
        '/login': (context) => PageContainer(child: LoginPage()),
        '/todos': (context) => PageContainer(child: TodoListPage()),
        // Add other routes as needed
      },
    );
  }
}
