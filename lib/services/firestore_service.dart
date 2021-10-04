import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:compound/models/user.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FirestoreService {
  final CollectionReference<Map<String, dynamic>> _usersCollectionReference =
      FirebaseFirestore.instance.collection('users');

  Future createUser(User user) async {
    try {
      await _usersCollectionReference.doc(user.id!).set(user.toJson());
    } catch (e) {
      return e.toString();
    }
  }

  Future getUser(String id) async {
    try {
      var snapshot = await _usersCollectionReference.doc(id).get();
      Map<String, dynamic> data = snapshot.data()!;
      return User.fromMap(map: data);
    } on Exception catch (e) {
      return e.toString();
    }
  }
}
