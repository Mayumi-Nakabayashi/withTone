import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


class CreatedAtField implements JsonConverter<DateTime?, dynamic> {
  const CreatedAtField();

  @override
  DateTime? fromJson(dynamic timestamp) {
    timestamp as Timestamp?;
    return timestamp?.toDate();
  }

  // nullの時は toJson 時 FieldValue.serverTimestamp() を返すことで、createdAt の挙動になる
  @override
  dynamic toJson(DateTime? dateTime) {
    if (dateTime == null) return FieldValue.serverTimestamp();
    return dateTime;
  }
}

class UpdatedAtField implements JsonConverter<DateTime?, dynamic> {
  const UpdatedAtField();

  @override
  DateTime? fromJson(dynamic timestamp) {
    timestamp as Timestamp?;
    return timestamp?.toDate();
  }

  @override
  FieldValue toJson(DateTime? date) {
    return FieldValue.serverTimestamp();
  }
}
