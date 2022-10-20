import 'views.dart';

class Map {
  String name;
  String? _description;
  String? _cover;
  List<View> _views = [];

  String get description => _description ?? '';
  String get cover => _cover ?? '';
  List<View> get views => _views;

  Map({required this.name, required description, cover, views}) {
    _description = description;
    _cover = cover;
    _views = views;
  }
}
