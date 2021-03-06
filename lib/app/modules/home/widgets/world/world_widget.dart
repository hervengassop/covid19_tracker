import 'package:corona_data/app/modules/home/widgets/try_again/try_again_widget.dart';
import 'package:corona_data/app/modules/home/widgets/world/world_controller.dart';
import 'package:corona_data/app/shared/info_tile_widget.dart';
import 'package:corona_data/app/shared/models/info_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class WorldWidget extends StatefulWidget {
  final String title;
  const WorldWidget({Key key, this.title = "World"}) : super(key: key);

  @override
  _WorldWidgetState createState() => _WorldWidgetState();
}

class _WorldWidgetState extends ModularState<WorldWidget, WorldController> {

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      if (controller.worldInfo.error != null) {
        return TryAgainWidget(onPressed: controller.fetchWorldInfo);
      } else {
        InfoModel info = controller.worldInfo.value;
        if (info == null) return Center(child: CircularProgressIndicator());

        return ListView(
          children: <Widget>[
            InfoTileWidget(
              number: "${info.cases}",
              todayNum: "${info.todayCases}",
              title: "Número de Casos",
            ),
            Container(
              height: 20,
            ),
            InfoTileWidget(
              number: "${info.deaths}",
              todayNum: "${info.todayDeaths}",
              title: "Número de Mortes",
            ),
            Container(
              height: 20,
            ),
            InfoTileWidget(
              number: "${info.affectedCountries}",
              title: "Número de países afetados",
            ),
            Container(
              height: 20,
            ),
            InfoTileWidget(
              number: "${info.critical}",
              title: "Pacientes em estado grave",
            ),
            Container(
              height: 20,
            ),
            InfoTileWidget(
              number: "${info.recovered}",
              title: "Pacientes recuperados",
            ),
          ],
        );
      }
    });
  }
}
