import 'package:firebase_core/firebase_core.dart';
import 'package:learning_project/firebase_options.dart';

class FirebaseNotificationService {

  Future<void>initFirebase() async {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  }
}