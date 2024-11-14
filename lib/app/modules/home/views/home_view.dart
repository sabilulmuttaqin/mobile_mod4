import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mod4mobile/app/modules/Camera/controllers/camera_controller.dart';
import 'package:mod4mobile/app/modules/Camera/views/camera.dart';
import 'package:mod4mobile/app/modules/Camera/views/video.dart';
import 'package:mod4mobile/app/modules/Camera/views/widget_background.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: WidgetBackground(),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.put(CameraController());
                    // Navigasi ke CameraView menggunakan Get
                    Get.to(() => const CameraView());
                  },
                  child: const Text('Open Foto'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.put(CameraController());
                    // Navigasi ke VideoView menggunakan Get
                    Get.to(() => const VideoView());
                  },
                  child: const Text('Open Video'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
