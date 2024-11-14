import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mod4mobile/app/modules/Camera/controllers/camera_controller.dart';
import 'package:mod4mobile/app/modules/Camera/views/widget_background.dart';

class CameraView extends GetView<CameraController> {
  const CameraView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image'),
        elevation: 4,
      ),
      body: Stack(
        children: [
          // WidgetBackground as the background
          Positioned.fill(
            child: WidgetBackground(),
          ),
          // Main content wrapped in SingleChildScrollView
          SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => controller.pickImage(ImageSource.camera),
                      child: const Text('Pick Image from Camera'),
                    ),
                    ElevatedButton(
                      onPressed: () =>
                          controller.pickImage(ImageSource.gallery),
                      child: const Text('Pick Image from Gallery'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: Get.height / 2.32,
                      width: Get.width * 0.7,
                      child: Obx(() {
                        return controller.isImageLoading.value
                            ? const CircularProgressIndicator()
                            : controller.selectedImagePath.value == ''
                                ? const Text('No image selected')
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.file(
                                      File(controller.selectedImagePath.value),
                                      fit: BoxFit.cover,
                                    ),
                                  );
                      }),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
