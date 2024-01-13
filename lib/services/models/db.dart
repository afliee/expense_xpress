import 'package:cloud_firestore/cloud_firestore.dart';

class DB {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // Collection References
  static final CollectionReference users =
      _firestore.collection('users');
}