// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class TasksStruct extends FFFirebaseStruct {
  TasksStruct({
    String? taskName,
    String? taskDate,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _taskName = taskName,
        _taskDate = taskDate,
        super(firestoreUtilData);

  // "taskName" field.
  String? _taskName;
  String get taskName => _taskName ?? '';
  set taskName(String? val) => _taskName = val;
  bool hasTaskName() => _taskName != null;

  // "task_date" field.
  String? _taskDate;
  String get taskDate => _taskDate ?? '';
  set taskDate(String? val) => _taskDate = val;
  bool hasTaskDate() => _taskDate != null;

  static TasksStruct fromMap(Map<String, dynamic> data) => TasksStruct(
        taskName: data['taskName'] as String?,
        taskDate: data['task_date'] as String?,
      );

  static TasksStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? TasksStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'taskName': _taskName,
        'task_date': _taskDate,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'taskName': serializeParam(
          _taskName,
          ParamType.String,
        ),
        'task_date': serializeParam(
          _taskDate,
          ParamType.String,
        ),
      }.withoutNulls;

  static TasksStruct fromSerializableMap(Map<String, dynamic> data) =>
      TasksStruct(
        taskName: deserializeParam(
          data['taskName'],
          ParamType.String,
          false,
        ),
        taskDate: deserializeParam(
          data['task_date'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TasksStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TasksStruct &&
        taskName == other.taskName &&
        taskDate == other.taskDate;
  }

  @override
  int get hashCode => const ListEquality().hash([taskName, taskDate]);
}

TasksStruct createTasksStruct({
  String? taskName,
  String? taskDate,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TasksStruct(
      taskName: taskName,
      taskDate: taskDate,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TasksStruct? updateTasksStruct(
  TasksStruct? tasks, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    tasks
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTasksStructData(
  Map<String, dynamic> firestoreData,
  TasksStruct? tasks,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (tasks == null) {
    return;
  }
  if (tasks.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && tasks.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final tasksData = getTasksFirestoreData(tasks, forFieldValue);
  final nestedData = tasksData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = tasks.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTasksFirestoreData(
  TasksStruct? tasks, [
  bool forFieldValue = false,
]) {
  if (tasks == null) {
    return {};
  }
  final firestoreData = mapToFirestore(tasks.toMap());

  // Add any Firestore field values
  tasks.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTasksListFirestoreData(
  List<TasksStruct>? taskss,
) =>
    taskss?.map((e) => getTasksFirestoreData(e, true)).toList() ?? [];
