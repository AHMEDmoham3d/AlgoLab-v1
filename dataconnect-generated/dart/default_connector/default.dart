import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class DefaultConnector {
  static final FirebaseDatabase database = FirebaseDatabase.instance;

  DefaultConnector();

  static DefaultConnector get instance {
    return DefaultConnector();
  }

  DatabaseReference get ref => database.ref();
}
