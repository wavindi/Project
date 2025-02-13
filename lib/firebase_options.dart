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
    apiKey: 'AIzaSyCr_XLz5aH954V1DWP-o2XVt_gaJcM6FTA',
    appId: '1:347964087109:web:fbd28f749cbc3fa92bbc2c',
    messagingSenderId: '347964087109',
    projectId: 'projectx-19c3f',
    authDomain: 'projectx-19c3f.firebaseapp.com',
    storageBucket: 'projectx-19c3f.firebasestorage.app',
    measurementId: 'G-MQW1SKBBKJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAEVhBzFhZblsSlJGnOAPq0YcKW7pzRn2c',
    appId: '1:347964087109:android:5568b84e7b606ff52bbc2c',
    messagingSenderId: '347964087109',
    projectId: 'projectx-19c3f',
    storageBucket: 'projectx-19c3f.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCO76w0w1UbLAeG5MEnD4lRcgmxcr_m7YA',
    appId: '1:347964087109:ios:4050d627cc7e25812bbc2c',
    messagingSenderId: '347964087109',
    projectId: 'projectx-19c3f',
    storageBucket: 'projectx-19c3f.firebasestorage.app',
    iosClientId: '347964087109-634b3edu2jsur4et5qvf3ho60apnr2r0.apps.googleusercontent.com',
    iosBundleId: 'com.example.carpoolingapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCO76w0w1UbLAeG5MEnD4lRcgmxcr_m7YA',
    appId: '1:347964087109:ios:4050d627cc7e25812bbc2c',
    messagingSenderId: '347964087109',
    projectId: 'projectx-19c3f',
    storageBucket: 'projectx-19c3f.firebasestorage.app',
    iosClientId: '347964087109-634b3edu2jsur4et5qvf3ho60apnr2r0.apps.googleusercontent.com',
    iosBundleId: 'com.example.carpoolingapp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCr_XLz5aH954V1DWP-o2XVt_gaJcM6FTA',
    appId: '1:347964087109:web:895025e121ad0e742bbc2c',
    messagingSenderId: '347964087109',
    projectId: 'projectx-19c3f',
    authDomain: 'projectx-19c3f.firebaseapp.com',
    storageBucket: 'projectx-19c3f.firebasestorage.app',
    measurementId: 'G-SXJKP25WFT',
  );
}
