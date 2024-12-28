import 'package:emend_web_app/views/views.dart';
import 'package:get/get.dart';

class Routes {
  static appRoutes() => [
        GetPage(
          name: LoginView.route,
          page: () => const LoginView(),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: RegisterView.route,
          page: () => const RegisterView(),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: DashboardView.route,
          page: () => const DashboardView(),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: EmailCampaignsView.route,
          page: () => const EmailCampaignsView(),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: SmsCampaignView.route,
          page: () => const SmsCampaignView(),
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
          name: TemplateEditor.route,
          page: () => const TemplateEditor(),
          transition: Transition.leftToRightWithFade,
        ),
      ];
}
