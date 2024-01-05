import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family/models/item_model.dart';

abstract class FirestoreHandler {
  static late FirebaseFirestore _firestore;
  static var listTable = 'lists';
  static var listCollection = 'items';

  static init() async {
    _firestore = FirebaseFirestore.instance;
  }

  static checkListExist(String listCode) async {
    var res = await _firestore.collection(listTable).doc(listCode).get();
    return res.exists;
  }

  static createNewList(String listCode) async {
    if (await checkListExist(listCode)) return false;
    await _firestore.collection(listTable).doc(listCode).set({});
    return true;
  }

  static setListItem(String listCode, ItemModel item) async {
    await _firestore
        .collection(listTable)
        .doc(listCode)
        .collection(listCollection)
        .doc(item.timestamp.toString())
        .set(item.toJson());
  }

  static updateListItem(
      String listCode, String key, Map<String, dynamic> values) async {
    await _firestore
        .collection(listTable)
        .doc(listCode)
        .collection(listCollection)
        .doc(key)
        .update(values);
  }

  static deleteListItem(String listCode, String key) async {
    await _firestore
        .collection(listTable)
        .doc(listCode)
        .collection(listCollection)
        .doc(key)
        .delete();
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getListItemsStream(
      String listCode) {
    return _firestore
        .collection(listTable)
        .doc(listCode)
        .collection(listCollection)
        .orderBy('timestamp', descending: true)
        .snapshots();
  }
}
