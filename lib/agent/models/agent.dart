class Agent {
  String? _name;
  String? _description;
  String? _cover;
  String? _icon;

  String get name => _name ?? '';
  String get description => _description ?? '';
  String get cover => _cover ?? '';
  String get icon => _icon ?? '';

  Agent({required name, required description, cover, icon}) {
    _name = name;
    _description = description;
    _cover = cover;
    _icon = icon;
  }
}
