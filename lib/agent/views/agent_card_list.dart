import 'package:flutter/material.dart';
import 'package:filter_list/filter_list.dart';

import '../agent_model.dart';
import 'agent_show.dart';

class AgentCardList extends StatefulWidget {
  final List<Agent> agents;

  AgentCardList({super.key, required this.agents});

  @override
  State<AgentCardList> createState() => _AgentCardListState();
}

class _AgentCardListState extends State<AgentCardList> {
  List<Object> sideAndRolesSelected = [];
  List<Agent> filteredAgents = [];

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;

    void openFilterDialog() async {
      await FilterListDialog.display<Object>(
        context,
        hideSearchField: true,
        hideCloseIcon: true,
        hideSelectedTextCount: true,
        hideHeader: true,
        applyButtonText: 'Filtrer',
        resetButtonText: 'Aucun',
        allButtonText: 'Tous',
        listData: [...Side.values, ...Role.values],
        selectedListData: sideAndRolesSelected,
        controlButtons: [],
        choiceChipBuilder: (context, item, isSelected) {
          String? label;
          if (item is Side) label = Agent.getStringBySide(item);
          if (item is Role) label = Agent.getStringByRole(item);

          Color color = Colors.grey[200]!;
          Color colorText = Colors.black;

          if (isSelected is bool && isSelected) {
            color = Theme.of(context).primaryColor;
            colorText = Colors.white;
          }

          return Padding(
              padding: const EdgeInsets.only(right: 4, left: 4),
              child: Chip(
                backgroundColor: color,
                label: Text(
                  label ?? '',
                  style: TextStyle(color: colorText),
                ),
              ));
        },
        choiceChipLabel: (object) {
          if (object is Side) return Agent.getStringBySide(object);
          if (object is Role) return Agent.getStringByRole(object);
          return '';
        },
        validateSelectedItem: (list, val) => list!.contains(val),
        onItemSearch: (object, query) {
          String? search;
          if (object is Side) search = Agent.getStringBySide(object);
          if (object is Role) search = Agent.getStringByRole(object);
          if (search is String) {
            return search.toLowerCase().contains(query.toLowerCase());
          }
          return false;
        },
        onApplyButtonClick: (list) {
          setState(() {
            sideAndRolesSelected = List.from(list!);
            if (sideAndRolesSelected.isEmpty) {
              filteredAgents = widget.agents;
            } else {
              filteredAgents = widget.agents.where((agent) {
                bool findSide = false;
                bool testSide = false;
                bool findRoles = true;
                for (var element in list) {
                  if (element is Side) {
                    testSide = true;
                    if (!findSide) {
                      findSide = agent.side == element;
                    }
                  }
                  if (element is Role && !agent.roles.contains(element)) {
                    findRoles = false;
                  }
                }
                return (!testSide || findSide) && findRoles;
              }).toList();
            }
          });
          Navigator.pop(context);
        },
      );
    }

    filteredAgents =
        sideAndRolesSelected.isEmpty ? widget.agents : filteredAgents;
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: openFilterDialog,
          child: const Icon(Icons.filter_list),
        ),
        body: (filteredAgents.isEmpty)
            ? Center(
                child: Text('Aucun agent ne correspond à ces filtres',
                    style: TextStyle(color: Theme.of(context).primaryColor)))
            : GridView.builder(
                padding: const EdgeInsets.only(left: 20, right: 20),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        orientation == Orientation.landscape ? 6 : 3),
                itemBuilder: (context, index) => InkWell(
                    onTap: () => showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return SimpleDialog(
                              title: Row(
                                children: [
                                  Image.asset(
                                    filteredAgents[index].icon ?? '',
                                    height: 48,
                                  ),
                                  Text(filteredAgents[index].name)
                                ],
                              ),
                              children: [
                                AgentShow(agent: filteredAgents[index])
                              ]);
                        }),
                    child: Card(
                        elevation: 4.0,
                        child: Column(children: <Widget>[
                          SizedBox(
                            height: 77.0,
                            child: Ink.image(
                              image:
                                  AssetImage(filteredAgents[index].icon ?? ''),
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.centerLeft,
                            child: Text(filteredAgents[index].name,
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary),
                                textAlign: TextAlign.center),
                          ),
                        ]))),
                itemCount: filteredAgents.length));
  }
}
