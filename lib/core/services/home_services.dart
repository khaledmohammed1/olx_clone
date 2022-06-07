import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService {
  final CollectionReference _categoryCollectionRef =
  FirebaseFirestore.instance.collection('Categories');
  final CollectionReference _productCollectionRef =
  FirebaseFirestore.instance.collection('Products');

  Future<QuerySnapshot<Object?>> getCategory() async {
    var value = await _categoryCollectionRef.get();
    return value;
  }

  Future<QuerySnapshot<Object?>> getProducts() async {
    var value = await _productCollectionRef.get();
    return value;
  }
}