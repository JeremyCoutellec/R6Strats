enum Side {
  attackers,
  defenders,
}

enum Roles {
  intelGatherer,
  areaDenial,
  coveringFire,
  crowdControl,
  anchor,
  secure,
  antiRoam,
  roam,
  buff,
  softBreach,
  disable,
  backLine,
  intelDenier,
  frontLine,
  hardBreach,
  flank,
  trap,
  antiHardBreach,
  shield
}

enum Health { low, middle, high }

enum Speed { low, middle, high }

enum Difficulty { low, middle, high }

class Agent {
  String _name = '';
  String? _description;
  String? _cover;
  String? _icon;
  List<Roles?> _roles = [];
  Side? _side = Side.attackers;
  Health? _health = Health.middle;
  Speed? _speed = Speed.middle;
  Difficulty? _difficulty;

  String get name => _name;
  String? get description => _description;
  String? get cover => _cover;
  String? get icon => _icon;
  List<Roles?> get roles => _roles;
  Side? get side => _side;
  Health? get health => _health;
  Speed? get speed => _speed;
  Difficulty? get difficulty => _difficulty;

  Agent({
    required name,
    side,
    description,
    cover,
    icon,
    roles,
    health,
    speed,
    difficulty,
  }) {
    _name = name;
    _side = side;
    _description = description;
    _cover = cover;
    _icon = icon;
    _roles = roles;
    _health = health;
    _speed = speed;
    _difficulty = difficulty;
  }

  Agent.fromJson(Map<String, dynamic> json)
      : _name = json['name'],
        _side = json['side'] == 'attackers' ? Side.attackers : Side.defenders,
        _description = json['description'],
        _cover = json['cover'],
        _icon = json['icon'],
        _roles = json['roles']
            .map<Roles?>((role) => Agent.getRoleByJson(role))
            .toList(),
        _health = Agent.getHealthByJson(json['health']),
        _speed = Agent.getSpeedByJson(json['speed']),
        _difficulty = Agent.getDifficultyByJson(json['difficulty']);

  Map<String, dynamic> toJson() => {
        'name': name,
        'side': side.toString(),
        'description': description,
        'cover': cover,
        'icon': icon,
        'roles': roles.map((role) => role.toString()).join(' - '),
        'health': health.toString(),
        'speed': speed.toString(),
        'difficulty': difficulty.toString(),
      };

  static String? getStringOfSide(Side? side) {
    switch (side) {
      case Side.attackers:
        return "Assaillant";
      case Side.defenders:
        return "Défenseur";
      default:
        return null;
    }
  }

  static Roles? getRoleByJson(role) {
    switch (role) {
      case "intelGatherer":
        return Roles.intelGatherer;
      case "areaDenial":
        return Roles.areaDenial;
      case "coveringFire":
        return Roles.coveringFire;
      case "crowdControl":
        return Roles.crowdControl;
      case "anchor":
        return Roles.anchor;
      case "secure":
        return Roles.secure;
      case "antiRoam":
        return Roles.antiRoam;
      case "roam":
        return Roles.roam;
      case "buff":
        return Roles.buff;
      case "softBreach":
        return Roles.softBreach;
      case "disable":
        return Roles.disable;
      case "backLine":
        return Roles.backLine;
      case "intelDenier":
        return Roles.intelDenier;
      case "frontLine":
        return Roles.frontLine;
      case "hardBreach":
        return Roles.hardBreach;
      case "flank":
        return Roles.flank;
      case "trap":
        return Roles.trap;
      case "antiHardBreach":
        return Roles.antiHardBreach;
      case "shield":
        return Roles.shield;
      default:
        return null;
    }
  }

  static List<Object> getFiltersSideAndRoles() {
    return [...Side.values, ...Roles.values];
  }

  static String? getStringOfRole(Roles? role) {
    switch (role) {
      case Roles.intelGatherer:
        return "Renseignements";
      case Roles.areaDenial:
        return "Blockage d'accès";
      case Roles.coveringFire:
        return "Tir de suppression";
      case Roles.crowdControl:
        return "Contrôle des foules";
      case Roles.anchor:
        return "Ancre";
      case Roles.secure:
        return "Sécurisation";
      case Roles.antiRoam:
        return "Anti-Patrouille";
      case Roles.roam:
        return "Patrouille";
      case Roles.buff:
        return "Buff";
      case Roles.softBreach:
        return "Brèche";
      case Roles.disable:
        return "Neutralisation";
      case Roles.backLine:
        return "Arrière garde";
      case Roles.intelDenier:
        return "Contre renseignements";
      case Roles.frontLine:
        return "Première ligne";
      case Roles.hardBreach:
        return "Brèche lourde";
      case Roles.flank:
        return "Contournement";
      case Roles.trap:
        return "Piège";
      case Roles.antiHardBreach:
        return "Anti-Brèche lourde";
      case Roles.shield:
        return "Bouclier";
      default:
        return null;
    }
  }

  static Health? getHealthByJson(health) {
    switch (health) {
      case "low":
        return Health.low;
      case "middle":
        return Health.middle;
      case "high":
        return Health.high;
      default:
        return null;
    }
  }

  static Speed? getSpeedByJson(speed) {
    switch (speed) {
      case "low":
        return Speed.low;
      case "middle":
        return Speed.middle;
      case "high":
        return Speed.high;
      default:
        return null;
    }
  }

  static Difficulty? getDifficultyByJson(difficulty) {
    switch (difficulty) {
      case "low":
        return Difficulty.low;
      case "middle":
        return Difficulty.middle;
      case "high":
        return Difficulty.high;
      default:
        return null;
    }
  }
}
