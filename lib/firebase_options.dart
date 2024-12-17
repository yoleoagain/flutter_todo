// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        return linux;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDb_ecnK9mvqfGo2i8yd7IUpqtCFZNMzAw',
    appId: '1:774270292841:web:e231dd00f1ecf9a2e3e3f8',
    messagingSenderId: '774270292841',
    projectId: 'isoz-todo-59741-4a891',
    authDomain: 'isoz-todo-59741-4a891.firebaseapp.com',
    storageBucket: 'isoz-todo-59741-4a891.appspot.com',
    measurementId: 'G-X26F9MRBHQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA8BRZdlmOzUdlceIMYVRSSOrK7g9KVay0',
    appId: '1:774270292841:android:a4df9c400bd10bace3e3f8',
    messagingSenderId: '774270292841',
    projectId: 'isoz-todo-59741-4a891',
    storageBucket: 'isoz-todo-59741-4a891.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBxcC8fLSZJmZtZqFtIClleTC3wOcb4B9Q',
    appId: '1:774270292841:ios:bfd5cc910821b058e3e3f8',
    messagingSenderId: '774270292841',
    projectId: 'isoz-todo-59741-4a891',
    storageBucket: 'isoz-todo-59741-4a891.appspot.com',
    iosBundleId: 'com.example.flutterAppIsoz',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBxcC8fLSZJmZtZqFtIClleTC3wOcb4B9Q',
    appId: '1:774270292841:ios:bfd5cc910821b058e3e3f8',
    messagingSenderId: '774270292841',
    projectId: 'isoz-todo-59741-4a891',
    storageBucket: 'isoz-todo-59741-4a891.appspot.com',
    iosBundleId: 'com.example.flutterAppIsoz',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDb_ecnK9mvqfGo2i8yd7IUpqtCFZNMzAw',
    appId: '1:774270292841:web:d6f8e18e0d08df6be3e3f8',
    messagingSenderId: '774270292841',
    projectId: 'isoz-todo-59741-4a891',
    authDomain: 'isoz-todo-59741-4a891.firebaseapp.com',
    storageBucket: 'isoz-todo-59741-4a891.appspot.com',
    measurementId: 'G-1Z45DJ67BD',
  );

  static const FirebaseOptions linux = FirebaseOptions(
    apiKey: 'AIzaSyDb_ecnK9mvqfGo2i8yd7IUpqtCFZNMzAw',
    appId: '1:774270292841:web:eb5944cb6eb4bdc9e3e3f8',
    messagingSenderId: '774270292841',
    projectId: 'isoz-todo-59741-4a891',
    authDomain: 'isoz-todo-59741-4a891.firebaseapp.com',
    storageBucket: 'isoz-todo-59741-4a891.appspot.com',
    measurementId: 'G-24BC6VQNYJ',
  );
}