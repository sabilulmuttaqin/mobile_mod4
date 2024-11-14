import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mod4mobile/app/modules/Camera/controllers/camera_controller.dart';
import 'package:mod4mobile/app/modules/Camera/views/widget_background.dart';
import 'package:video_player/video_player.dart';

class VideoView extends GetView<CameraController> {
  const VideoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video'),
        elevation: 4,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: WidgetBackground(),
          ),
          SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => controller.pickVideo(ImageSource.camera),
                      child: const Text('Pick Video from Camera'),
                    ),
                    ElevatedButton(
                      onPressed: () =>
                          controller.pickVideo(ImageSource.gallery),
                      child: const Text('Pick Video from Gallery'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: Get.height / 2.32,
                      width: Get.width * 0.7,
                      child: Obx(() {
                        if (controller.selectedVideoPath.value.isNotEmpty) {
                          return Card(
                            child: Column(
                              children: [
                                AspectRatio(
                                  aspectRatio: 1,
                                  child: VideoPlayer(
                                      controller.videoPlayerController!),
                                ),
                                VideoProgressIndicator(
                                  controller.videoPlayerController!,
                                  allowScrubbing: true,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        controller.isVideoPlaying.isTrue
                                            ? Icons.play_arrow
                                            : Icons.pause,
                                      ),
                                      onPressed: controller.togglePlayPause,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        } else {
                          return const Text('No video selected');
                        }
                      }),
                    ),
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
