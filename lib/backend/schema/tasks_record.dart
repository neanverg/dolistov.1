import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class TasksRecord extends FirestoreRecord {
  TasksRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "taskname" field.
  String? _taskname;
  String get taskname => _taskname ?? '';
  bool hasTaskname() => _taskname != null;

  // "taskdate" field.
  DateTime? _taskdate;
  DateTime? get taskdate => _taskdate;
  bool hasTaskdate() => _taskdate != null;

  void _initializeFields() {
    _taskname = snapshotData['taskname'] as String?;
    _taskdate = snapshotData['taskdate'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tasks');

  static Stream<TasksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TasksRecord.fromSnapshot(s));

  static Future<TasksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TasksRecord.fromSnapshot(s));

  static TasksRecord fromSnapshot(DocumentSnapshot snapshot) => TasksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TasksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TasksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TasksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TasksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTasksRecordData({
  String? taskname,
  DateTime? taskdate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'taskname': taskname,
      'taskdate': taskdate,
    }.withoutNulls,
  );

  return firestoreData;
}

class TasksRecordDocumentEquality implements Equality<TasksRecord> {
  const TasksRecordDocumentEquality();

  @override
  bool equals(TasksRecord? e1, TasksRecord? e2) {
    return e1?.taskname == e2?.taskname && e1?.taskdate == e2?.taskdate;
  }

  @override
  int hash(TasksRecord? e) =>
      const ListEquality().hash([e?.taskname, e?.taskdate]);

  @override
  bool isValidKey(Object? o) => o is TasksRecord;
}
