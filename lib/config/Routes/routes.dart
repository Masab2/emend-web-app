import 'package:emend_web_app/config/Routes/routes_name.dart';
import 'package:emend_web_app/views/view.dart';
import 'package:get/get.dart';

class Routes {
  static appRoutes() => [
        GetPage(
          name: RoutesNames.sidebarscreen,
          page: () => const SideBarView(),
          transition: Transition.leftToRightWithFade,
        ),
      ];
}
