import 'package:emend_web_app/config/AppUrl/app_url.dart';
import 'package:emend_web_app/config/GlobalVarriable/global.dart';
import 'package:emend_web_app/controllers/TemplateController/template_controller.dart';
import 'package:emend_web_app/views/views.dart';
import 'package:get/get.dart';

import 'route_names.dart';

class Routes {
  final controller = Get.put(TemplateController());
  static appRoutes() => [
        GetPage(
          name: RouteNames.login,
          page: () => const LoginView(),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: RouteNames.register,
          page: () => const RegisterView(),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: RouteNames.dashboard,
          page: () => const DashboardView(),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: RouteNames.emailCampaigns,
          page: () => const EmailCampaignsView(),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: RouteNames.smsCampaigns,
          page: () => const SmsCampaignView(),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: RouteNames.reports,
          page: () => const ReportsView(),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: RouteNames.templates,
          page: () => TemplateView(),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: RouteNames.chats,
          page: () => const ChatView(),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: RouteNames.contactList,
          page: () => const ContactListView(),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: "${RouteNames.templateEditor}${templateCode.value}/?token=${AppUrl.token}",
          page: () => const TemplateEditor(),
          transition: Transition.leftToRightWithFade,
          parameters: const {
            "token": AppUrl.token,
          },
        ),
        GetPage(
          name: RouteNames.createSmsBulkCampaignScreen,
          page: () => CreateSmsCampaignHomeScreenView(),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteNames.createSmsOneToOneCampaignScreen,
          page: () => const CreateSmsOneToOneView(),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteNames.createEmailCampaign,
          page: () => const CreateEmailCampaignView(),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteNames.contactListDetailsScreen,
          page: () => const ContactDetailsList(),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteNames.createBulkEmailScreen,
          page: () => const CreateBulkEmailCampaignView(),
          transition: Transition.leftToRightWithFade,
        ),
      ];
}
