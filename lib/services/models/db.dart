import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DB {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final FirebaseAuth auth = FirebaseAuth.instance;
  // Collection References
  static final CollectionReference users =
      _firestore.collection('users');

  // wallets collection reference
  static final CollectionReference wallets =
      _firestore.collection('wallets');

  // categories collection reference
  static final CollectionReference categories =
      _firestore.collection('categories');
}