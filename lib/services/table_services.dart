import 'package:cloud_firestore/cloud_firestore.dart';

class TableServices {
  final CollectionReference _collectionReference =
  FirebaseFirestore.instance.collection('tables');
  Future<List<QueryDocumentSnapshot>> getTable() async {
    var  value= await _collectionReference.get();
    return value.docs;
  }
}
