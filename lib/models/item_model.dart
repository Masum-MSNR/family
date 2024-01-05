import 'package:flutter/material.dart';

class ItemModel {
  bool? isDone;
  int? timestamp;
  String? itemName;
  String? itemPrice;
  bool? isPriceEditing = false;
  bool? isNameEditing = false;
  TextEditingController? itemPriceController;
  TextEditingController? itemNameController;

  ItemModel({
    this.isDone,
    this.timestamp,
    this.itemName,
    this.itemPrice,
    this.isPriceEditing,
    this.isNameEditing,
    this.itemNameController,
    this.itemPriceController,
  });

  ItemModel.fromJson(Map<String, dynamic> json) {
    isDone = json['isDone'];
    timestamp = json['timestamp'];
    itemName = json['itemName'];
    itemPrice = json['itemPrice'];
    isPriceEditing = false;
    itemPriceController = TextEditingController(text: itemPrice ?? '');
    isNameEditing = false;
    itemNameController = TextEditingController(text: itemName ?? '');
  }

  ItemModel.fromOldState(Map<String, dynamic> newItem, ItemModel oldState) {
    isDone = newItem['isDone'];
    timestamp = newItem['timestamp'];
    itemName = newItem['itemName'];
    itemPrice = newItem['itemPrice'];
    isPriceEditing = oldState.isPriceEditing;
    itemPriceController = oldState.itemPriceController;
    isNameEditing = oldState.isNameEditing;
    itemNameController = oldState.itemNameController;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['isDone'] = isDone;
    data['timestamp'] = timestamp;
    data['itemName'] = itemName;
    data['itemPrice'] = itemPrice;
    return data;
  }
}
