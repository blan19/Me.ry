// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:diary/foundation/constants.dart';
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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static FirebaseOptions android = FirebaseOptions(
    apiKey: Constants.instance.firebaseAndroidApiKey,
    appId: Constants.instance.firebaseAndroidAppId,
    messagingSenderId: Constants.instance.firebaseMessagingSenderId,
    projectId: Constants.instance.firebaseProjectID,
    storageBucket: Constants.instance.firebaseStorageBucket,
  );

  static FirebaseOptions ios = FirebaseOptions(
    apiKey: Constants.instance.firebaseIosApiKey,
    appId: Constants.instance.firebaseIosAppId,
    messagingSenderId: Constants.instance.firebaseMessagingSenderId,
    projectId: Constants.instance.firebaseProjectID,
    storageBucket: Constants.instance.firebaseStorageBucket,
    iosClientId: Constants.instance.firebaseIosClientId,
    iosBundleId: Constants.instance.firebaseIosBundleId,
  );
}
