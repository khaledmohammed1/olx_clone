
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService {

  final CollectionReference categoryCollectionRef =
  FirebaseFirestore.instance.collection('Categories');
}