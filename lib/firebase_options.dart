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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCxWcGUbCWjcZJJHTuIHbsITJRb2ZsoUlU',
    appId: '1:557507906247:web:1416141ba6770caf52cce2',
    messagingSenderId: '557507906247',
    projectId: 'fir-favoritemovies-de08e',
    authDomain: 'fir-favoritemovies-de08e.firebaseapp.com',
    storageBucket: 'fir-favoritemovies-de08e.appspot.com',
    measurementId: 'G-0R6TBNQ485',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAhFNfgJm2NdS5SRQPPPxII8Z99l4V66Kk',
    appId: '1:557507906247:android:9fe032cd275c852552cce2',
    messagingSenderId: '557507906247',
    projectId: 'fir-favoritemovies-de08e',
    storageBucket: 'fir-favoritemovies-de08e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDCui9AwJs7uLuqHNL7HzYYFYvUU4SVVRg',
    appId: '1:557507906247:ios:d745d27e1cedba0d52cce2',
    messagingSenderId: '557507906247',
    projectId: 'fir-favoritemovies-de08e',
    storageBucket: 'fir-favoritemovies-de08e.appspot.com',
    iosClientId: '557507906247-srpdjidctf4piq6j3creebhhm0kou9n7.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseFavoritesMovies',
  );
}