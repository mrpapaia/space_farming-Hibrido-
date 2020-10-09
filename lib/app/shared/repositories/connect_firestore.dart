import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class ConnectDB {
  FirebaseApp app;
  iniciaApp() async {
    app = await Firebase.initializeApp();
  }
}
