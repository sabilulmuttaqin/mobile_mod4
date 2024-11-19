import 'package:get/get.dart';
import 'package:mod4mobile/app/modules/Camera/bindings/camera_binding.dart';
import 'package:mod4mobile/app/modules/Camera/views/camera.dart';
import 'package:mod4mobile/app/modules/Camera/views/video.dart';
import 'package:mod4mobile/app/modules/Microphone/bindings/microphone_binding.dart';
import 'package:mod4mobile/app/modules/Microphone/views/microphone.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.CAMERA,
      page: () => const CameraView(),
      binding: CameraBinding(),
    ),
    GetPage(
      name: _Paths.VIDEO,
      page: () => const VideoView(),
      binding: CameraBinding(),
    ),
    GetPage(
      name: _Paths.MICROPHONE,
      page: () => const MicrophoneView(),
      binding: MicrophoneBinding(),
    ),
  ];
}
