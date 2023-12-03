import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

/// 日時を表す型の Converter
///
/// Firestore では Timestamp で扱いたく、Dart では DateTime で扱いたいので、
/// その変換を行う。
class TimestampField implements JsonConverter<DateTime?, Timestamp?> {
  const TimestampField();

  /// Timestamp から DateTime への変換
  ///
  /// null なら null を返す
  @override
  DateTime? fromJson(Timestamp? timestamp) => timestamp?.toDate();

  /// DateTime から Timestamp への変換
  ///
  /// null なら null を返す
  @override
  Timestamp? toJson(DateTime? dateTime) =>
      dateTime == null ? null : Timestamp.fromDate(dateTime);
}
