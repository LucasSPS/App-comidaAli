import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReservationsRecord extends FirestoreRecord {
  ReservationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "item" field.
  DocumentReference? _item;
  DocumentReference? get item => _item;
  bool hasItem() => _item != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  bool hasQuantity() => _quantity != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "lastUpdateDate" field.
  DateTime? _lastUpdateDate;
  DateTime? get lastUpdateDate => _lastUpdateDate;
  bool hasLastUpdateDate() => _lastUpdateDate != null;

  // "userSeller" field.
  DocumentReference? _userSeller;
  DocumentReference? get userSeller => _userSeller;
  bool hasUserSeller() => _userSeller != null;

  // "userBuyer" field.
  DocumentReference? _userBuyer;
  DocumentReference? get userBuyer => _userBuyer;
  bool hasUserBuyer() => _userBuyer != null;

  // "chatRef" field.
  DocumentReference? _chatRef;
  DocumentReference? get chatRef => _chatRef;
  bool hasChatRef() => _chatRef != null;

  void _initializeFields() {
    _item = snapshotData['item'] as DocumentReference?;
    _quantity = castToType<int>(snapshotData['quantity']);
    _price = castToType<double>(snapshotData['price']);
    _lastUpdateDate = snapshotData['lastUpdateDate'] as DateTime?;
    _userSeller = snapshotData['userSeller'] as DocumentReference?;
    _userBuyer = snapshotData['userBuyer'] as DocumentReference?;
    _chatRef = snapshotData['chatRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reservations');

  static Stream<ReservationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReservationsRecord.fromSnapshot(s));

  static Future<ReservationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReservationsRecord.fromSnapshot(s));

  static ReservationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReservationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReservationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReservationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReservationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReservationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReservationsRecordData({
  DocumentReference? item,
  int? quantity,
  double? price,
  DateTime? lastUpdateDate,
  DocumentReference? userSeller,
  DocumentReference? userBuyer,
  DocumentReference? chatRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'item': item,
      'quantity': quantity,
      'price': price,
      'lastUpdateDate': lastUpdateDate,
      'userSeller': userSeller,
      'userBuyer': userBuyer,
      'chatRef': chatRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReservationsRecordDocumentEquality
    implements Equality<ReservationsRecord> {
  const ReservationsRecordDocumentEquality();

  @override
  bool equals(ReservationsRecord? e1, ReservationsRecord? e2) {
    return e1?.item == e2?.item &&
        e1?.quantity == e2?.quantity &&
        e1?.price == e2?.price &&
        e1?.lastUpdateDate == e2?.lastUpdateDate &&
        e1?.userSeller == e2?.userSeller &&
        e1?.userBuyer == e2?.userBuyer &&
        e1?.chatRef == e2?.chatRef;
  }

  @override
  int hash(ReservationsRecord? e) => const ListEquality().hash([
        e?.item,
        e?.quantity,
        e?.price,
        e?.lastUpdateDate,
        e?.userSeller,
        e?.userBuyer,
        e?.chatRef
      ]);

  @override
  bool isValidKey(Object? o) => o is ReservationsRecord;
}
