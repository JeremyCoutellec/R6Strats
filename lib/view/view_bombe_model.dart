class ViewBombe {
  int _floor = 0;
  String _locationA = '';
  String _locationB = '';
  String? _image;

  int get floor => _floor;
  String? get locationA => _locationA;
  String? get locationB => _locationB;
  String? get image => _image;

  ViewBombe({
    required floor,
    required locationA,
    required locationB,
    image,
  }) {
    _floor = floor;
    _locationA = locationA;
    _locationB = locationB;
    _image = image;
  }

  ViewBombe.fromJson(Map<String, dynamic> json)
      : _floor = int.parse(json['floor']),
        _locationA = json['locationA'],
        _locationB = json['locationB'],
        _image = json['image'];

  Map<String, dynamic> toJson() => {
        "floor": floor,
        "locationA": locationA,
        "locationB": locationB,
        "image": image,
      };
}
