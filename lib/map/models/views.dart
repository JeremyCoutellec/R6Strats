class View {
  String? _id;
  String? _name;
  String? _image;

  String get id => _id ?? '';
  String get name => _name ?? '';
  String get cover => _image ?? '';

  View({required id, required name, image}) {
    _id = id;
    _name = name;
    _image = image;
  }
}
