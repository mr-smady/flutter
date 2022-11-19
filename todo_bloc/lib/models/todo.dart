import 'package:equatable/equatable.dart';

class Todo extends Equatable {
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

  @override
  List<Object?> get props => [id, note, creationDate];
}
