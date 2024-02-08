import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

import '../controllers/detect_controller.dart';
import '../widgets/treatment.dart';
import '../routes/route_name.dart';

class Detect extends StatelessWidget {
  final DetectController detectController = Get.put(DetectController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xF5F5F5F5),
      appBar: AppBar(
        backgroundColor: Color(0xFF86A789),
        flexibleSpace: SafeArea(
          child: Container(
            child: Center(
              child: Text(
                "Deteksi",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        leading: IconButton(
          onPressed: () => Get.offAllNamed(RouteName.homePage),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                height: 200,
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 3,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: detectController.pickImage,
                      child: Container(
                        width: MediaQuery.of(context).size.width - 200,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 17,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFF86A789),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          'Camera',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: detectController.pickGalleryImage,
                      child: Container(
                        width: MediaQuery.of(context).size.width - 200,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 17,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFF86A789),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          'Gallery',
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
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFF86A789),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Center(
                  child: Obx(
                    () => detectController.loading.value
                        ? SizedBox.shrink()
                        : Container(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 8),
                              child: Column(
                                children: [
                                  Text(
                                    "Result",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: 250,
                                    width: 250,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: Image.file(
                                        detectController.image.value!,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    height: 25,
                                    thickness: 1,
                                    color: Colors.white,
                                  ),
                                  detectController.output != null &&
                                          detectController.output!.isNotEmpty
                                      ? Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'The object is: ${detectController.output![0]['label']}!',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            SizedBox(height: 20),
                                            Text(
                                              'Confidence: ${(detectController.output![0]['confidence'] * 100).toStringAsFixed(2)}%',
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
                                                label: detectController
                                                    .output![0]['label']),
                                          ],
                                        )
                                      : Column(
                                          children: [
                                            Text(
                                              'Gambar Tidak Cocok!!!',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  detectController.pickImage();
                                                },
                                                child: Text('Retry'),
                                              ),
                                            ),
                                          ],
                                        ),
                                  Divider(
                                    height: 25,
                                    thickness: 1,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Color(0xFF86A789),
        style: TabStyle.fixedCircle,
        items: [
          TabItem(
            icon: Icons.home,
            title: 'Home',
          ),
          TabItem(
            icon: Icons.camera_alt_outlined,
            title: 'Kamera',
          ),
          TabItem(
            icon: Icons.monitor,
            title: 'Monitoring',
          ),
        ],
        initialActiveIndex: 1,
        onTap: (int i) {
          switch (i) {
            case 0:
              Get.offAllNamed(
                RouteName.homePage,
              );
              break;
            case 1:
              Get.offAllNamed(
                RouteName.detectPage,
              );
              break;
            case 2:
              Get.offAllNamed(
                RouteName.monitoringPage,
              );
              break;
            default:
              break;
          }
        },
      ),
    );
  }
}
