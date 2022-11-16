class Todo {
  int? id;
  String? note;
  DateTime? creationDate;

  Todo({this.id, this.note, this.creationDate});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'note': note,
      'creation_date': creationDate?.millisecondsSinceEpoch,
    };
  }
}
