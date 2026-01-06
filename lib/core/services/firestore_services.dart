import 'package:notes_app/export.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference getCollection(String collectionName) {
    return _firestore.collection(collectionName);
  }

  Future<String?> addDocument({
    required String collectionName,
    required Map<String, dynamic> data,
    String? docId,
  }) async {
    try {
      DocumentReference docRef;
      if (docId != null) {
        docRef = _firestore.collection(collectionName).doc(docId);
        data["id"] = docId;
        await docRef.set(data);
      } else {
        docRef = await _firestore.collection(collectionName).add(data);
        await docRef.update({"id": docRef.id});
      }
      return docRef.id;
    } catch (e) {
      Get.log("Add Document Error: $e");
      return null;
    }
  }

  Future<DocumentSnapshot?> getDocument({
    required String collectionName,
    required String docId,
  }) async {
    try {
      DocumentSnapshot doc = await _firestore.collection(collectionName).doc(docId).get();
      return doc;
    } catch (e) {
      Get.log("Get Document Error: $e");
      return null;
    }
  }

  Stream<QuerySnapshot> getAllDocuments({required String collectionName}) {
    return _firestore.collection(collectionName).snapshots();
  }

  Stream<QuerySnapshot> getDocumentsWithCondition({
    required String collectionName,
    required String field,
    required dynamic isEqualTo,
  }) {
    return _firestore
        .collection(collectionName)
        .where(field, isEqualTo: isEqualTo)
        .snapshots();
  }

  Future<bool> updateDocument({
    required String collectionName,
    required String docId,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _firestore.collection(collectionName).doc(docId).update(data);
      return true;
    } catch (e) {
      Get.log("Update Document Error: $e");
      return false;
    }
  }

  Future<bool> deleteDocument({
    required String collectionName,
    required String docId,
  }) async {
    try {
      await _firestore.collection(collectionName).doc(docId).delete();
      return true;
    } catch (e) {
      Get.log("Delete Document Error: $e");
      return false;
    }
  }

  Stream<QuerySnapshot> getDocumentsQuery({
    required String collectionName,
    String? orderByField,
    bool descending = false,
    int? limit,
  }) {
    Query query = _firestore.collection(collectionName);
    if (orderByField != null) query = query.orderBy(orderByField, descending: descending);
    if (limit != null) query = query.limit(limit);
    return query.snapshots();
  }
}