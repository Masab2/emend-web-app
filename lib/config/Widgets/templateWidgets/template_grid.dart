import 'package:emend_web_app/config/assets/image_asset.dart';
import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:emend_web_app/config/routes/route_names.dart';
import 'package:emend_web_app/controllers/TemplateController/template_controller.dart';
import 'package:emend_web_app/data/Response/status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class TemplateGrid extends StatelessWidget {
  TemplateGrid({
    super.key,
  });

  TemplateController controller = Get.put(TemplateController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (controller.rxRequestStatusForAllTemplate.value) {
        case Status.loading:
          return const Center(
            child: CircularProgressIndicator(),
          );
        case Status.error:
          return const Text('Templates not Loaded, Something bad happened');
        case Status.completed:
          return Wrap(
            spacing: 20,
            runSpacing: 30,
            children: controller.templateModel.value.templates?.map((template) {
                  return InkWell(
                    onTap: () {
                      Get.toNamed(RouteNames.templateEditor);
                      controller.code.value = template.template ?? '';
                      debugPrint(controller.code.value);
                    },
                    child: Container(
                      height: context.mh * 0.45,
                      width: context.mw * 0.15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(ImageAsset.templateImage),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // Open Template Button
                          Card(
                              color: AppColor.primaryColor,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  template.name ?? 'Template',
                                  style: TextStyle(
                                    fontSize: context.mh * 0.020,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                  );
                }).toList() ??
                List.empty(),
          );
        default:
          return const SizedBox.shrink();
      }
    });
  }
}
