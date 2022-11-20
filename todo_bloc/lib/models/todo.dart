import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  final int? id;
  final String? note;
  final DateTime? creationDate;

  const Todo({this.id, this.note, this.creationDate});

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
