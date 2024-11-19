import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class MicrophoneController extends GetxController {
  // Instansiasi SpeechToText untuk menangani pengenalan suara
  final stt.SpeechToText _speech = stt.SpeechToText();
  var isListening = false.obs; // Status pendengaran
  var text = "".obs; // Teks hasil pengenalan suara

  @override
  void onInit() {
    super.onInit();
    _initSpeech();
  }

  // Menginisialisasi fungsi pengenalan suara
  void _initSpeech() async {
    try {
      bool available = await _speech.initialize();
      if (!available) {
        print("Speech recognition is not available.");
      }
    } catch (e) {
      print("Error initializing speech recognition: $e");
    }
  }

  // Memeriksa dan meminta izin mikrofon
  Future<void> checkMicrophonePermission() async {
    var status = await Permission.microphone.status;
    if (!status.isGranted) {
      // Jika izin belum diberikan, minta izin kepada pengguna
      await Permission.microphone.request();
    }
  }

  // Mulai mendengarkan
  void startListening() async {
    await checkMicrophonePermission();
    if (await Permission.microphone.isGranted) {
      isListening.value = true;
      await _speech.listen(
        onResult: (result) {
          text.value = result.recognizedWords; // Memperbarui teks
        },
        listenFor: Duration(minutes: 1), // Perpanjang durasi pendengaran
        pauseFor: Duration(seconds: 5), // Waktu diam sebelum berhenti
        // onError: (error) {
        //   print("Speech recognition error: ${error.errorMsg}");
        //   stopListening();
        // },
      );
    } else {
      print("Izin mikrofon ditolak.");
    }
  }

  // Menghentikan proses pengenalan suara
  void stopListening() async {
    isListening.value = false;
    await _speech.stop();
  }
}
