// Buat file baru, misalnya treatment_info.dart
import 'package:flutter/material.dart';

class TreatmentInfoWidget extends StatelessWidget {
  final String label;

  TreatmentInfoWidget({required this.label});

  @override
  Widget build(BuildContext context) {
    return getTreatmentInfo(label);
  }

  Widget getTreatmentInfo(String label) {
    switch (label) {
      case 'Tomato___Bacterial_spot':
        return Text(
          'Apply copper-based fungicides and practice good garden hygiene.',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),
        );
      case 'Tomato___Early_blight':
        return Text(
          'Prune infected leaves and apply fungicides with chlorothalonil. The signup and login flow of Farmassist is developed using the Bloc library and Firebase Authentication. After a user signs up successfully, the user data will be stored in the data model of Cloud Firestore as shown below:',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),
        );
      // Tambahkan kasus untuk kategori lainnya sesuai kebutuhan
      // ...
      default:
        return Container();
    }
  }
}
