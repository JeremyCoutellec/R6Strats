import 'package:flutter/cupertino.dart';
import 'package:r6_companion/map/views/map_card_list.dart';

import '../actions/map.dart';
import '../models/map.dart';

class MapController extends StatelessWidget {
  const MapController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map>>(
        future: MapActions().getMaps(),
        builder: (context, snapshot) => MapCardList(maps: snapshot.data ?? []));
  }
}
