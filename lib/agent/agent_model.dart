enum Side {
  attackers,
  defenders,
}

enum Role {
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
  List<Role?> _roles = [];
  Side? _side = Side.attackers;
  Health? _health = Health.middle;
  Speed? _speed = Speed.middle;
  Difficulty? _difficulty;

  String get name => _name;
  String? get description => _description;
  String? get cover => _cover;
  String? get icon => _icon;
  List<Role?> get roles => _roles;
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
            .map<Role?>((role) => Agent.getRoleByJson(role))
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

  static String? getStringBySide(Side? side) {
    switch (side) {
      case Side.attackers:
        return "Assaillant";
      case Side.defenders:
        return "Défenseur";
      default:
        return null;
    }
  }

  static Role? getRoleByJson(role) {
    switch (role) {
      case "intelGatherer":
        return Role.intelGatherer;
      case "areaDenial":
        return Role.areaDenial;
      case "coveringFire":
        return Role.coveringFire;
      case "crowdControl":
        return Role.crowdControl;
      case "anchor":
        return Role.anchor;
      case "secure":
        return Role.secure;
      case "antiRoam":
        return Role.antiRoam;
      case "roam":
        return Role.roam;
      case "buff":
        return Role.buff;
      case "softBreach":
        return Role.softBreach;
      case "disable":
        return Role.disable;
      case "backLine":
        return Role.backLine;
      case "intelDenier":
        return Role.intelDenier;
      case "frontLine":
        return Role.frontLine;
      case "hardBreach":
        return Role.hardBreach;
      case "flank":
        return Role.flank;
      case "trap":
        return Role.trap;
      case "antiHardBreach":
        return Role.antiHardBreach;
      case "shield":
        return Role.shield;
      default:
        return null;
    }
  }

  static List<Object> getRolesBySide() {
    return [...Side.values, ...Role.values];
  }

  static List<Role> getRolesBySides(List<Side> sides) =>
      Role.values.where((element) {
        if (sides.isEmpty || sides.length == Side.values.length) {
          return true;
        }
        bool findSide = false;
        for (var side in sides) {
          Agent.getSideByRole(element).contains(side);
        }
        return findSide;
      }).toList();

  static List<Side> getSideByRole(Role? role) {
    switch (role) {
      case Role.intelGatherer:
        return [Side.attackers, Side.defenders];
      case Role.areaDenial:
        return [Side.attackers, Side.defenders];
      case Role.coveringFire:
        return [Side.attackers, Side.defenders];
      case Role.crowdControl:
        return [Side.attackers, Side.defenders];
      case Role.anchor:
        return [Side.defenders];
      case Role.secure:
        return [Side.defenders];
      case Role.antiRoam:
        return [Side.attackers];
      case Role.roam:
        return [Side.defenders];
      case Role.buff:
        return [Side.attackers, Side.defenders];
      case Role.softBreach:
        return [Side.attackers, Side.defenders];
      case Role.disable:
        return [Side.attackers];
      case Role.backLine:
        return [Side.attackers];
      case Role.intelDenier:
        return [Side.attackers, Side.defenders];
      case Role.frontLine:
        return [Side.attackers, Side.defenders];
      case Role.hardBreach:
        return [Side.attackers];
      case Role.flank:
        return [Side.attackers];
      case Role.trap:
        return [Side.attackers, Side.defenders];
      case Role.antiHardBreach:
        return [Side.defenders];
      case Role.shield:
        return [Side.attackers, Side.defenders];
      default:
        return [Side.attackers, Side.defenders];
    }
  }

  static String? getStringByRole(Role? role) {
    switch (role) {
      case Role.intelGatherer:
        return "Renseignements";
      case Role.areaDenial:
        return "Blockage d'accès";
      case Role.coveringFire:
        return "Tir de suppression";
      case Role.crowdControl:
        return "Contrôle des foules";
      case Role.anchor:
        return "Ancre";
      case Role.secure:
        return "Sécurisation";
      case Role.antiRoam:
        return "Anti-Patrouille";
      case Role.roam:
        return "Patrouille";
      case Role.buff:
        return "Buff";
      case Role.softBreach:
        return "Brèche";
      case Role.disable:
        return "Neutralisation";
      case Role.backLine:
        return "Arrière garde";
      case Role.intelDenier:
        return "Contre renseignements";
      case Role.frontLine:
        return "Première ligne";
      case Role.hardBreach:
        return "Brèche lourde";
      case Role.flank:
        return "Contournement";
      case Role.trap:
        return "Piège";
      case Role.antiHardBreach:
        return "Anti-Brèche lourde";
      case Role.shield:
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
