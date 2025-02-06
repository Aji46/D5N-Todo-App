// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
    apiKey: 'AIzaSyCzAm8ELUX8zKmoTV4I_jmWROmKu_cQ3g8',
    appId: '1:975794870059:web:bb2ae385de4e61242ed76e',
    messagingSenderId: '975794870059',
    projectId: 'd5n-mechin-task',
    authDomain: 'd5n-mechin-task.firebaseapp.com',
    storageBucket: 'd5n-mechin-task.firebasestorage.app',
    measurementId: 'G-YRE70DWP3W',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCpb1St5Qw4oFMYi2_N6eECcAdTFmB4GyE',
    appId: '1:975794870059:android:c6919fdefa0b5f6f2ed76e',
    messagingSenderId: '975794870059',
    projectId: 'd5n-mechin-task',
    storageBucket: 'd5n-mechin-task.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAyxywWQit2pmWIGt97y4cO4z2-FH37Z38',
    appId: '1:975794870059:ios:7de794b24ef748b52ed76e',
    messagingSenderId: '975794870059',
    projectId: 'd5n-mechin-task',
    storageBucket: 'd5n-mechin-task.firebasestorage.app',
    iosBundleId: 'com.example.d5n',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAyxywWQit2pmWIGt97y4cO4z2-FH37Z38',
    appId: '1:975794870059:ios:7de794b24ef748b52ed76e',
    messagingSenderId: '975794870059',
    projectId: 'd5n-mechin-task',
    storageBucket: 'd5n-mechin-task.firebasestorage.app',
    iosBundleId: 'com.example.d5n',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCzAm8ELUX8zKmoTV4I_jmWROmKu_cQ3g8',
    appId: '1:975794870059:web:04a4bb5a708096212ed76e',
    messagingSenderId: '975794870059',
    projectId: 'd5n-mechin-task',
    authDomain: 'd5n-mechin-task.firebaseapp.com',
    storageBucket: 'd5n-mechin-task.firebasestorage.app',
    measurementId: 'G-HKXN9J6JN3',
  );
}
