import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mod4mobile/app/modules/Microphone/controllers/microphone_controller.dart';

class MicrophoneView extends GetView<MicrophoneController> {
  const MicrophoneView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Speech to Text Example"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                controller.text.value,
                style: const TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            Obx(
              () => controller.isListening.value
                  ? ElevatedButton(
                      onPressed: controller.stopListening,
                      child: const Text("Stop Listening"),
                    )
                  : ElevatedButton(
                      onPressed: controller.startListening,
                      child: const Text("Start Listening"),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
