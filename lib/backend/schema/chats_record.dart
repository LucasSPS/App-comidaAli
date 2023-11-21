import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatsRecord extends FirestoreRecord {
  ChatsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_a" field.
  DocumentReference? _userA;
  DocumentReference? get userA => _userA;
  bool hasUserA() => _userA != null;

  // "user_b" field.
  DocumentReference? _userB;
  DocumentReference? get userB => _userB;
  bool hasUserB() => _userB != null;

  // "last_message" field.
  String? _lastMessage;
  String get lastMessage => _lastMessage ?? '';
  bool hasLastMessage() => _lastMessage != null;

  // "last_message_time" field.
  DateTime? _lastMessageTime;
  DateTime? get lastMessageTime => _lastMessageTime;
  bool hasLastMessageTime() => _lastMessageTime != null;

  // "item" field.
  DocumentReference? _item;
  DocumentReference? get item => _item;
  bool hasItem() => _item != null;

  // "message_seen" field.
  bool? _messageSeen;
  bool get messageSeen => _messageSeen ?? false;
  bool hasMessageSeen() => _messageSeen != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "users" field.
  List<DocumentReference>? _users;
  List<DocumentReference> get users => _users ?? const [];
  bool hasUsers() => _users != null;

  // "visibleChatUsera" field.
  bool? _visibleChatUsera;
  bool get visibleChatUsera => _visibleChatUsera ?? false;
  bool hasVisibleChatUsera() => _visibleChatUsera != null;

  // "visibleChatUserb" field.
  bool? _visibleChatUserb;
  bool get visibleChatUserb => _visibleChatUserb ?? false;
  bool hasVisibleChatUserb() => _visibleChatUserb != null;

  void _initializeFields() {
    _userA = snapshotData['user_a'] as DocumentReference?;
    _userB = snapshotData['user_b'] as DocumentReference?;
    _lastMessage = snapshotData['last_message'] as String?;
    _lastMessageTime = snapshotData['last_message_time'] as DateTime?;
    _item = snapshotData['item'] as DocumentReference?;
    _messageSeen = snapshotData['message_seen'] as bool?;
    _user = snapshotData['user'] as DocumentReference?;
    _users = getDataList(snapshotData['users']);
    _visibleChatUsera = snapshotData['visibleChatUsera'] as bool?;
    _visibleChatUserb = snapshotData['visibleChatUserb'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chats');

  static Stream<ChatsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatsRecord.fromSnapshot(s));

  static Future<ChatsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatsRecord.fromSnapshot(s));

  static ChatsRecord fromSnapshot(DocumentSnapshot snapshot) => ChatsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatsRecordData({
  DocumentReference? userA,
  DocumentReference? userB,
  String? lastMessage,
  DateTime? lastMessageTime,
  DocumentReference? item,
  bool? messageSeen,
  DocumentReference? user,
  bool? visibleChatUsera,
  bool? visibleChatUserb,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_a': userA,
      'user_b': userB,
      'last_message': lastMessage,
      'last_message_time': lastMessageTime,
      'item': item,
      'message_seen': messageSeen,
      'user': user,
      'visibleChatUsera': visibleChatUsera,
      'visibleChatUserb': visibleChatUserb,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatsRecordDocumentEquality implements Equality<ChatsRecord> {
  const ChatsRecordDocumentEquality();

  @override
  bool equals(ChatsRecord? e1, ChatsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userA == e2?.userA &&
        e1?.userB == e2?.userB &&
        e1?.lastMessage == e2?.lastMessage &&
        e1?.lastMessageTime == e2?.lastMessageTime &&
        e1?.item == e2?.item &&
        e1?.messageSeen == e2?.messageSeen &&
        e1?.user == e2?.user &&
        listEquality.equals(e1?.users, e2?.users) &&
        e1?.visibleChatUsera == e2?.visibleChatUsera &&
        e1?.visibleChatUserb == e2?.visibleChatUserb;
  }

  @override
  int hash(ChatsRecord? e) => const ListEquality().hash([
        e?.userA,
        e?.userB,
        e?.lastMessage,
        e?.lastMessageTime,
        e?.item,
        e?.messageSeen,
        e?.user,
        e?.users,
        e?.visibleChatUsera,
        e?.visibleChatUserb
      ]);

  @override
  bool isValidKey(Object? o) => o is ChatsRecord;
}
