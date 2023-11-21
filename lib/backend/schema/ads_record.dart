import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdsRecord extends FirestoreRecord {
  AdsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  bool hasQuantity() => _quantity != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "categorie" field.
  String? _categorie;
  String get categorie => _categorie ?? '';
  bool hasCategorie() => _categorie != null;

  // "visible_status" field.
  bool? _visibleStatus;
  bool get visibleStatus => _visibleStatus ?? false;
  bool hasVisibleStatus() => _visibleStatus != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "seller_ref" field.
  DocumentReference? _sellerRef;
  DocumentReference? get sellerRef => _sellerRef;
  bool hasSellerRef() => _sellerRef != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "expiration_date" field.
  DateTime? _expirationDate;
  DateTime? get expirationDate => _expirationDate;
  bool hasExpirationDate() => _expirationDate != null;

  // "isDonation" field.
  bool? _isDonation;
  bool get isDonation => _isDonation ?? false;
  bool hasIsDonation() => _isDonation != null;

  // "createdTime" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "isDeleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  bool hasIsDeleted() => _isDeleted != null;

  // "clicks" field.
  int? _clicks;
  int get clicks => _clicks ?? 0;
  bool hasClicks() => _clicks != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _quantity = castToType<int>(snapshotData['quantity']);
    _location = snapshotData['location'] as LatLng?;
    _image = snapshotData['image'] as String?;
    _categorie = snapshotData['categorie'] as String?;
    _visibleStatus = snapshotData['visible_status'] as bool?;
    _price = castToType<double>(snapshotData['price']);
    _sellerRef = snapshotData['seller_ref'] as DocumentReference?;
    _uid = snapshotData['uid'] as String?;
    _expirationDate = snapshotData['expiration_date'] as DateTime?;
    _isDonation = snapshotData['isDonation'] as bool?;
    _createdTime = snapshotData['createdTime'] as DateTime?;
    _isDeleted = snapshotData['isDeleted'] as bool?;
    _clicks = castToType<int>(snapshotData['clicks']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ads');

  static Stream<AdsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AdsRecord.fromSnapshot(s));

  static Future<AdsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AdsRecord.fromSnapshot(s));

  static AdsRecord fromSnapshot(DocumentSnapshot snapshot) => AdsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AdsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AdsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AdsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AdsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAdsRecordData({
  String? title,
  String? description,
  int? quantity,
  LatLng? location,
  String? image,
  String? categorie,
  bool? visibleStatus,
  double? price,
  DocumentReference? sellerRef,
  String? uid,
  DateTime? expirationDate,
  bool? isDonation,
  DateTime? createdTime,
  bool? isDeleted,
  int? clicks,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'description': description,
      'quantity': quantity,
      'location': location,
      'image': image,
      'categorie': categorie,
      'visible_status': visibleStatus,
      'price': price,
      'seller_ref': sellerRef,
      'uid': uid,
      'expiration_date': expirationDate,
      'isDonation': isDonation,
      'createdTime': createdTime,
      'isDeleted': isDeleted,
      'clicks': clicks,
    }.withoutNulls,
  );

  return firestoreData;
}

class AdsRecordDocumentEquality implements Equality<AdsRecord> {
  const AdsRecordDocumentEquality();

  @override
  bool equals(AdsRecord? e1, AdsRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.quantity == e2?.quantity &&
        e1?.location == e2?.location &&
        e1?.image == e2?.image &&
        e1?.categorie == e2?.categorie &&
        e1?.visibleStatus == e2?.visibleStatus &&
        e1?.price == e2?.price &&
        e1?.sellerRef == e2?.sellerRef &&
        e1?.uid == e2?.uid &&
        e1?.expirationDate == e2?.expirationDate &&
        e1?.isDonation == e2?.isDonation &&
        e1?.createdTime == e2?.createdTime &&
        e1?.isDeleted == e2?.isDeleted &&
        e1?.clicks == e2?.clicks;
  }

  @override
  int hash(AdsRecord? e) => const ListEquality().hash([
        e?.title,
        e?.description,
        e?.quantity,
        e?.location,
        e?.image,
        e?.categorie,
        e?.visibleStatus,
        e?.price,
        e?.sellerRef,
        e?.uid,
        e?.expirationDate,
        e?.isDonation,
        e?.createdTime,
        e?.isDeleted,
        e?.clicks
      ]);

  @override
  bool isValidKey(Object? o) => o is AdsRecord;
}
