import 'package:cloud_firestore/cloud_firestore.dart';

// class HomeServices {
//   final CollectionReference _collectionReference =
//       FirebaseFirestore.instance.collection('boat');
//
// }
class MyClass {
     final String s;
  final CollectionReference _collectionReference;

  MyClass(String s) : s = s, _collectionReference = FirebaseFirestore.instance.collection(s);
     Future<List<QueryDocumentSnapshot>> getBoat() async {
    var  value= await _collectionReference.get();
   return value.docs;
  }
}
// class MyClass {

// }
