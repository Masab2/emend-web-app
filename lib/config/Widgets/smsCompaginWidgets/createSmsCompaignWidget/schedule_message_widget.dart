import 'package:emend_web_app/Controllers/StepController/step_controller.dart';
import 'package:emend_web_app/config/extenshions/extenshion.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ScheduleMessageUI extends StatelessWidget {
  const ScheduleMessageUI({super.key});

  @override
  Widget build(BuildContext context) {
    final stepController = Get.put(StepController());
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Send Immediately Button
          Row(
            children: [
              Radio(
                activeColor: Colors.blue,
                value: 1,
                groupValue: 1,
                onChanged: (value) {},
              ),
              Text(
                "Send Immediately",
                style: GoogleFonts.barlow(
                  fontSize: MediaQuery.of(context).size.height * 0.018,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Send Later with Time and Day Inputs
          Row(
            children: [
              Radio(
                activeColor: Colors.blue,
                value: 2,
                groupValue: 1,
                onChanged: (value) {},
              ),
              Text(
                "Send",
                style: GoogleFonts.barlow(
                  fontSize: MediaQuery.of(context).size.height * 0.018,
                ),
              ),
              0.03.pw(context),
              DropdownButton<int>(
                value: 1,
                items: List.generate(30, (index) => index + 1)
                    .map((e) =>
                        DropdownMenuItem(value: e, child: Text('$e day(s)')))
                    .toList(),
                onChanged: (value) {},
              ),
              0.01.ph(context),
              DropdownButton<int>(
                value: 9,
                items: List.generate(12, (index) => index + 1)
                    .map((e) => DropdownMenuItem(value: e, child: Text('$e')))
                    .toList(),
                onChanged: (value) {},
              ),
              const Text(":"),
              DropdownButton<int>(
                value: 0,
                items: List.generate(60, (index) => index)
                    .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e.toString().padLeft(2, '0'))))
                    .toList(),
                onChanged: (value) {},
              ),
              0.01.ph(context),
              DropdownButton<String>(
                value: "AM",
                items: ["AM", "PM"]
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (value) {},
              ),
            ],
          ),
          0.01.ph(context),

          // Message Input with Preview
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: context.mw * 0.6,
                  child: TextFormField(
                    maxLines: 3,
                    style: GoogleFonts.barlow(fontSize: 16),
                    decoration: InputDecoration(
                        hintText: "Type your message here...",
                        hintStyle: GoogleFonts.barlow(fontSize: 16),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        border: InputBorder.none),
                  ),
                ),
              ],
            ),
          ),
          0.01.ph(context),

          // Placeholder Buttons
          Obx(() {
            return stepController.isWrapVisible.value == true
                ? SizedBox(
                    width: context.mw * 0.6,
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        for (var field in [
                          "First Name",
                          "Last Name",
                          "Phone Number",
                          "Email",
                          "Contact Owner",
                          "Custom Field #7",
                          "Custom Field #8",
                          "Custom Field #9",
                          "Custom Field #10",
                          "Street Address",
                          "City",
                          "State",
                          "Zip Code"
                        ])
                          Container(
                            constraints: const BoxConstraints(
                              minWidth: 100,
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: Colors.grey.shade100,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              onPressed: () {},
                              child: Text(
                                field,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.barlow(
                                    color: Colors.black, fontSize: 14),
                              ),
                            ),
                          ),
                      ],
                    ),
                  )
                : const SizedBox();
          }),

          // Icon Buttons
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.emoji_emotions_outlined),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.attach_file),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.settings_input_svideo_rounded),
                onPressed: () {
                  stepController.toggleWrapVisibility();
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
