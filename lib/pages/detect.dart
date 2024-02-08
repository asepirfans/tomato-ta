import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tflite_v2/tflite_v2.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/treatment.dart';

class DetectPage extends StatefulWidget {
  const DetectPage({Key? key}) : super(key: key);

  @override
  State<DetectPage> createState() => _DetectPageState();
}

class _DetectPageState extends State<DetectPage> {
  bool _loading = true;
  File? _image;
  List<dynamic>? _output;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    loadModel();
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  Future<void> classifyImage(File? image) async {
    if (image == null) return;

    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 10,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );

    setState(() {
      _output = output;
      _loading = false;
    });
  }

  Future<void> loadModel() async {
    await Tflite.loadModel(
      model: 'assets/model.tflite',
      labels: 'assets/labels.txt',
    );
  }

  Future<void> pickImage() async {
    var image = await picker.pickImage(source: ImageSource.camera);
    if (image == null) return;

    setState(() {
      _image = File(image.path);
    });
    classifyImage(_image);
  }

  Future<void> pickGalleryImage() async {
    var image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;

    setState(() {
      _image = File(image.path);
    });
    classifyImage(_image);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Fruits and Veggies Neural Network',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w200,
            fontSize: 20,
            letterSpacing: 0.8,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black.withOpacity(0.9),
          padding: EdgeInsets.symmetric(horizontal: 35, vertical: 50),
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Color(0xFF2A363B),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Center(
                    child: _loading
                        ? null
                        : Container(
                            child: Column(
                              children: [
                                Container(
                                  height: 250,
                                  width: 250,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: Image.file(
                                      _image!,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Divider(
                                  height: 25,
                                  thickness: 1,
                                ),
                                _output != null && _output!.isNotEmpty
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'The object is: ${_output![0]['label']}!',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          SizedBox(height: 20),
                                          Text(
                                            'Confidence: ${(_output![0]['confidence'] * 100).toStringAsFixed(2)}%',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                          SizedBox(height: 20),
                                          Text(
                                            'Treatment:',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                          // Menambahkan informasi treatment berdasarkan label atau kategori
                                          TreatmentInfoWidget(
                                              label: _output![0]['label']),
                                        ],
                                      )
                                    : Container(
                                        alignment: Alignment.center,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            // Tampilkan pesan peringatan
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text('Error'),
                                                  content: Text(
                                                      'Failed to classify image. Please try again.'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Text('OK'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          child: Text('Retry'),
                                        ),
                                      ),
                                Divider(
                                  height: 25,
                                  thickness: 1,
                                ),
                              ],
                            ),
                          ),
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: pickImage,
                        child: Container(
                          width: MediaQuery.of(context).size.width - 200,
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 17,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blueGrey[600],
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            'Take A Photo',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: pickGalleryImage,
                        child: Container(
                          width: MediaQuery.of(context).size.width - 200,
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 17,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blueGrey[600],
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            'Pick From Gallery',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Widget getTreatmentInfo(String label) {
//   switch (label) {
//     case 'Tomato___Bacterial_spot':
//       return Text(
//         'Apply copper-based fungicides and practice good garden hygiene.',
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: 16,
//           fontWeight: FontWeight.w300,
//         ),
//       );
//     case 'Tomato___Early_blight':
//       return Text(
//         'Prune infected leaves and apply fungicides with chlorothalonil.',
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: 16,
//           fontWeight: FontWeight.w300,
//         ),
//       );
//     // Tambahkan kasus untuk kategori lainnya sesuai kebutuhan
//     // ...
//     default:
//       return Container();
//   }
// }
