import '../view/view_floor_model.dart';
import '../view/view_bombe_model.dart';

class MapR6 {
  String _name = '';
  String? _description;
  String? _createdAt;
  String? _icon;
  String? _location;
  List<ViewFloor?> _views = [];
  List<ViewBombe?> _bombes = [];

  String get name => _name;
  String? get description => _description;
  String? get createdAt => _createdAt;
  String? get icon => _icon;
  String? get location => _location;
  List<ViewFloor?> get views => _views;
  List<ViewBombe?> get bombes => _bombes;

  MapR6({
    required name,
    description,
    createdAt,
    icon,
    location,
    views,
    bombes,
  }) {
    _name = name;
    _description = description;
    _createdAt = createdAt;
    _icon = icon;
    _location = location;
    _views = views;
    _bombes = bombes;
  }

  MapR6.fromJson(Map<String, dynamic> json)
      : _name = json['name'],
        _description = json['description'],
        _createdAt = json['_createdAt'],
        _icon = json['icon'],
        _location = json['location'],
        _views = json['views']
            .map<ViewFloor>((element) => ViewFloor.fromJson(element)),
        _bombes = json['bombes']
            .map<ViewBombe>((element) => ViewBombe.fromJson(element));

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "createdAt": createdAt,
        "icon": icon,
        "location": location,
        "views": _views.map((element) => element?.toJson()),
        "bombes": _bombes.map((element) => element?.toJson()),
      };
}
