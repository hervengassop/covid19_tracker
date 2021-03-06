import 'package:corona_data/app/modules/home/home_controller.dart';
import 'package:corona_data/app/modules/home/home_page.dart';
import 'package:corona_data/app/modules/home/repositories/covid_repository.dart';
import 'package:corona_data/app/modules/home/repositories/covid_repository_interface.dart';
import 'package:corona_data/app/modules/home/widgets/brazil/brazil_controller.dart';
import 'package:corona_data/app/modules/home/widgets/states_map/states_map_controller.dart';
import 'package:corona_data/app/modules/home/widgets/world/world_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => StatesMapController(Modular.get<ICovidRepository>())),
        Bind((i) => HomeController()),
        Bind<ICovidRepository>((i) => CovidRepository(i.get()),),

        Bind((i) => BrazilController(Modular.get<ICovidRepository>())),
        Bind((i) => WorldController(Modular.get<ICovidRepository>())),
      ];

  @override
  List<Router> get routers => [Router("/", child: (_, args) => HomePage())];

  static Inject get to => Inject<HomeModule>.of();
}
