// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Todo {
  final String? id;
  final String? text;
  final String description;
  Todo({
    this.id,
    this.text,
    required this.description,
  });

  Todo copyWith({
    String? id,
    String? text,
    String? description,
  }) {
    return Todo(
      id: id ?? this.id,
      text: text ?? this.text,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'text': text,
      'description': description,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'] as String,
      text: map['text'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Todo.fromJson(String source) =>
      Todo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Todo(id: $id, text: $text, description: $description)';

  @override
  bool operator ==(covariant Todo other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.text == text &&
        other.description == description;
  }

  @override
  int get hashCode => id.hashCode ^ text.hashCode ^ description.hashCode;
}
