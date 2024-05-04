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
    apiKey: 'AIzaSyAVdNaVcgLOsNf0Iq-bSqrzAWrr5XhtuHg',
    appId: '1:616646529186:web:17325436e462f015e287fb',
    messagingSenderId: '616646529186',
    projectId: 'chat-application-be9cf',
    authDomain: 'chat-application-be9cf.firebaseapp.com',
    storageBucket: 'chat-application-be9cf.appspot.com',
    measurementId: 'G-N7V38RP68Y',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBOc8dvOUeZ1j_OT-15DAa2wJq_KvvzWTY',
    appId: '1:616646529186:android:c2fff0d60817e23fe287fb',
    messagingSenderId: '616646529186',
    projectId: 'chat-application-be9cf',
    storageBucket: 'chat-application-be9cf.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDHSe_3D0Cmqte4UnLkXpAjoHKp_AFpKH8',
    appId: '1:616646529186:ios:21549dcff507ea47e287fb',
    messagingSenderId: '616646529186',
    projectId: 'chat-application-be9cf',
    storageBucket: 'chat-application-be9cf.appspot.com',
    iosBundleId: 'com.example.flutterRoadmap',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDHSe_3D0Cmqte4UnLkXpAjoHKp_AFpKH8',
    appId: '1:616646529186:ios:21549dcff507ea47e287fb',
    messagingSenderId: '616646529186',
    projectId: 'chat-application-be9cf',
    storageBucket: 'chat-application-be9cf.appspot.com',
    iosBundleId: 'com.example.flutterRoadmap',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAVdNaVcgLOsNf0Iq-bSqrzAWrr5XhtuHg',
    appId: '1:616646529186:web:175a66a3e3bc9b3ae287fb',
    messagingSenderId: '616646529186',
    projectId: 'chat-application-be9cf',
    authDomain: 'chat-application-be9cf.firebaseapp.com',
    storageBucket: 'chat-application-be9cf.appspot.com',
    measurementId: 'G-XTYD8ZC7R9',
  );
}
