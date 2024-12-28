import 'package:emend_web_app/views/ContactListView/contact_list_view.dart';
import 'package:emend_web_app/views/DashboardView/dashboard_view.dart';
import 'package:emend_web_app/views/EmailCampaignsView/email_campaigns_view.dart';
import 'package:emend_web_app/views/LoginView/login_view.dart';
import 'package:emend_web_app/views/RegisterView/register_view.dart';
import 'package:emend_web_app/views/Reports/reports_view.dart';
import 'package:emend_web_app/views/SmsCampaignsView/sms_campaign_view.dart';
import 'package:emend_web_app/views/TemplateView/template_view.dart';
import 'package:emend_web_app/views/TemplateView/unLayer.dart';
import 'package:emend_web_app/views/chatView/chat_view.dart';
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
          name: UnLayerEditor.route,
          page: () => const UnLayerEditor(),
          transition: Transition.leftToRightWithFade,
        ),
      ];
}
