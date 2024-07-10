import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

import '../../test_data/dev.dart';

class ScoreInquire extends StatefulWidget {
  static const routeName = 'feature/row-pagination';

  const ScoreInquire({super.key});

  @override
  State<ScoreInquire> createState() => _ScoreInquireState();
}

class _ScoreInquireState extends State<ScoreInquire> {
  final List<PlutoColumn> columns = [];

  final List<PlutoRow> rows = [];

  @override
  void initState() {
    super.initState();

    final dummyData = DummyData(10, 5000);

    columns.addAll(dummyData.columns);

    rows.addAll(dummyData.rows);
  }

  @override
  Widget build(BuildContext context) {
    return PlutoGrid(
      columns: columns,
      rows: rows,
      onLoaded: (PlutoGridOnLoadedEvent event) {
        event.stateManager.setShowColumnFilter(true);
      },
      onChanged: (PlutoGridOnChangedEvent event) {
        print(event);
      },
      configuration: const PlutoGridConfiguration(),
      createFooter: (stateManager) {
        stateManager.setPageSize(100, notify: false); // default 40
        return PlutoPagination(stateManager);
      },
    );
  }
}