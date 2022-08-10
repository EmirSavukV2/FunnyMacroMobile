// To parse this JSON data, do
//
//     final mobilStatus = mobilStatusFromJson(jsonString);

import 'dart:convert';

MobilStatus mobilStatusFromJson(String str) =>
    MobilStatus.fromJson(json.decode(str));

String mobilStatusToJson(MobilStatus data) => json.encode(data.toJson());

class MobilStatus {
  late String bot;
  late String attack;
  late String zBlock;
  late String rpr;
  late String item1;
  late String item2;
  late String item3;
  late String item4;
  late String item5;
  late String item6;
  late String item7;
  late String item8;
  MobilStatus({
    required this.bot,
    required this.attack,
    required this.zBlock,
    required this.rpr,
    required this.item1,
    required this.item2,
    required this.item3,
    required this.item4,
    required this.item5,
    required this.item6,
    required this.item7,
    required this.item8,
  });

  factory MobilStatus.fromJson(Map<String, dynamic> json) => MobilStatus(
        bot: json["bot"],
        attack: json["attack"],
        zBlock: json["z_block"],
        rpr: json["rpr"],
        item1: json["item1"],
        item2: json["item2"],
        item3: json["item3"],
        item4: json["item4"],
        item5: json["item5"],
        item6: json["item6"],
        item7: json["item7"],
        item8: json["item8"],
      );

  Map<String, dynamic> toJson() => {
        "bot": bot,
        "attack": attack,
        "z_block": zBlock,
        "rpr": rpr,
        "item1": item1,
        "item2": item2,
        "item3": item3,
        "item4": item4,
        "item5": item5,
        "item6": item6,
        "item7": item7,
        "item8": item8,
      };
}
