import 'package:emend_web_app/views/view.dart';
import 'package:get/get.dart';

class Routes {
  static appRoutes() => [
        GetPage(
          name: DashboardView.route,
          page: () => const DashboardView(),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: EmailCompaignsView.route,
          page: () => const EmailCompaignsView(),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: SmsCompaignView.route,
          page: () => const SmsCompaignView(),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: ReportsView.route,
          page: () => const ReportsView(),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: TemplateView.route,
          page: () => const TemplateView(),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: ChatView.route,
          page: () => const ChatView(),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: ContactListView.route,
          page: () => const ContactListView(),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: UnLayerEditor.route,
          page: () => const UnLayerEditor(),
          transition: Transition.leftToRightWithFade,
        ),
      ];
}
