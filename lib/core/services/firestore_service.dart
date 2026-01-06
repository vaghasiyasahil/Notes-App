import 'package:notes_app/export.dart';

class FirestoreService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final CollectionReference _notesCollection = _firestore.collection(DatabaseTableName.kNotes);

  static String get _userId => FirebaseAuthService.auth.currentUser?.uid ?? '';

  static Future<void> addNote(NoteModel note) async {
    await _notesCollection.add(note.toJson()).then((value) {
      value.update({"id":value.id});
    },);
  }

  static Future<void> updateNote(NoteModel note) async {
    await _notesCollection.doc(note.id).update(note.toJson());
  }

  static Future<void> deleteNote(String noteId) async {
    await _notesCollection.doc(noteId).delete();
  }

  static Stream<List<NoteModel>> getNotesStream() {
    return _notesCollection
        .where('userId', isEqualTo: _userId)
        .where('isDelete', isEqualTo: false)
        .orderBy('updatedAt', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return NoteModel.fromJson(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    });
  }
}
