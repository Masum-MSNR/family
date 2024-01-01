import 'package:flutter/material.dart';

class ShoppingModel {
  int? timestamp;
  String? itemName;
  String? itemPrice;
  bool? isEditing = false;
  TextEditingController? itemPriceController;

  ShoppingModel({
    this.timestamp,
    this.itemName,
    this.itemPrice,
    this.isEditing,
    this.itemPriceController,
  });

  ShoppingModel.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    itemName = json['itemName'];
    itemPrice = json['itemPrice'];
    isEditing = false;
    itemPriceController = TextEditingController(text: itemPrice ?? '');
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['timestamp'] = timestamp;
    data['itemName'] = itemName;
    data['itemPrice'] = itemPrice;
    return data;
  }
}
