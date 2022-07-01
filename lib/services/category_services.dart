
import 'package:cloud_firestore/cloud_firestore.dart';

class FireBaseService {

  final CollectionReference categoryCollectionRef =
  FirebaseFirestore.instance.collection('Categories');
}