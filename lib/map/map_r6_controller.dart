import 'package:flutter/cupertino.dart';
import 'package:r6_companion/map/views/map_card_list.dart';

import 'map_r6_actions.dart';
import 'map_r6_model.dart';

class MapR6Controller extends StatelessWidget {
  const MapR6Controller({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MapR6>>(
        future: MapR6Actions().getMaps(),
        builder: (context, snapshot) => MapCardList(maps: snapshot.data ?? []));
  }
}
