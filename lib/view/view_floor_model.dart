import 'package:flutter/material.dart';

class ViewFloor {
  int _floor = 0;
  String? _image;

  int get floor => _floor;
  String? get image => _image;

  ViewFloor({
    required floor,
    image,
  }) {
    _floor = floor;
    _image = image;
  }

  ViewFloor.fromJson(Map<String, dynamic> json)
      : _floor = json['floor'],
        _image = json['image'];

  Map<String, dynamic> toJson() => {
        'floor': floor,
        'image': image,
      };

  static String? getStringFromFloor(int? floor) {
    switch (floor) {
      case -2:
        return "Sous-Sol -2";
      case -1:
        return "Sous-Sol";
      case 0:
        return "Rez-de-chaussée";
      case 1:
        return "1er étage";
      case 2:
        return "2e étage";
      case 3:
        return "3e étage";
      case 99:
        return "Toit";
      default:
        return null;
    }
  }

  static IconData getIconsByFloor(int? floor) {
    switch (floor) {
      case -2:
        return Icons.waves;
      case -1:
        return Icons.water;
      case 0:
        return Icons.door_back_door;
      case 1:
        return Icons.stairs;
      case 2:
        return Icons.stairs;
      case 3:
        return Icons.stairs;
      case 99:
        return Icons.roofing;
      default:
        return Icons.house;
    }
  }
}
