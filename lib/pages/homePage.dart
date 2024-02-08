import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:tomato_apps/routes/route_name.dart';

// import 'monitoringPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF86A789),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey,
                    image: DecorationImage(
                      image: AssetImage('images/ava.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hallo Awan",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "#PetaniGenZ",
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.access_alarm),
            ),
          ],
        ),
      ),
      body: ListView(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  decoration: BoxDecoration(
                      color: Color(0xFF86A789),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Informasi",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 26, left: 16, right: 16),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 146,
                              width: 138,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 38,
                                  ),
                                  Center(
                                    child: Text(
                                      "Monitoring",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      "Memantau tanaman secara real-time",
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 66,
                              width: 138,
                              decoration: BoxDecoration(
                                color: Color(0xFFBED3FB),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset('./images/monitoring.png'),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Stack(
                          children: [
                            Container(
                              height: 146,
                              width: 138,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 38,
                                  ),
                                  Center(
                                    child: Text(
                                      "Deteksi Penyakit",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      "Mendeteksi penyakit tanaman dengan mudah",
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 66,
                              width: 138,
                              decoration: BoxDecoration(
                                color: Color(0xFFFFEA9F),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset('./images/deteksi.png'),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Stack(
                          children: [
                            Container(
                              height: 146,
                              width: 138,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 38,
                                  ),
                                  Center(
                                    child: Text(
                                      "Record",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      "Menyimpan data dengan aman",
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 66,
                              width: 138,
                              decoration: BoxDecoration(
                                color: Color(0xFFB4F0D0),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset('./images/record.png'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
              child: Text(
                "Fitur Utama",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
              child: GestureDetector(
                onTap: () => Get.offAllNamed(
                  RouteName.monitoringPage,
                ),
                child: Container(
                  height: 100,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text("Monitoring"),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
              child: GestureDetector(
                onTap: () => Get.offAllNamed(
                  RouteName.pumpPage,
                ),
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                    child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text("Kontrol Pompa"),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 8, bottom: 30, left: 16, right: 16),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ]),
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
        initialActiveIndex: 0,
        onTap: (int i) {
          switch (i) {
            case 0:
              print('click index= 0');
              Get.offAllNamed(
                RouteName.homePage,
              );
              break;
            case 1:
              print('click index= 1');
              Get.offAllNamed(
                RouteName.detectPage,
              );
              break;
            case 2:
              print('click index= 2');
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
