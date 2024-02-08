import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite_v2/tflite_v2.dart';

class DetectController extends GetxController {
  RxBool loading = true.obs;
  Rx<File?> image = Rx<File?>(null);

  RxList<dynamic>? output = RxList<dynamic>([]);

  final picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
    loadModel();
  }

  Future<void> classifyImage(File? image) async {
  if (image == null) return;

  var result = await Tflite.runModelOnImage(
    path: image.path,
    numResults: 10,
    threshold: 0.5,
    imageMean: 127.5,
    imageStd: 127.5,
  );

  output!.assignAll(result?.toList() ?? []);
  loading.value = false;
}


  Future<void> loadModel() async {
    // Logika untuk load model
      await Tflite.loadModel(
      model: 'assets/model.tflite',
      labels: 'assets/labels.txt',
    );
  }

  Future<void> pickImage() async {
    var pickedImage = await picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      image.value = File(pickedImage.path);
      classifyImage(image.value);
    }
  }

  Future<void> pickGalleryImage() async {
    var pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      image.value = File(pickedImage.path);
      classifyImage(image.value);
    }
  }
}
