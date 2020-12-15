import 'package:cloud_firestore/cloud_firestore.dart';

class Item {
  String id;
  String what;
  bool done;
  DateTime date;

  Item.fromFirestore(DocumentSnapshot doc) {
    this.id = doc.id;
    this.what = doc['what'];
    this.done = doc['done'];
    this.date = (doc['date'] as Timestamp).toDate();
  }

  Map<String, dynamic> toFirestore() => {
        'id': id,
        'what': what,
        'done': done,
        'date': date,
      };
}

Stream<List<Item>> todoListSnapshots() {
  final todos = FirebaseFirestore.instance.collection('todos');
  return todos.orderBy('date').snapshots().map((QuerySnapshot query) {
    List<Item> result = [];
    for (var doc in query.docs) {
      result.add(Item.fromFirestore(doc));
    }
    return result;
  });
}
