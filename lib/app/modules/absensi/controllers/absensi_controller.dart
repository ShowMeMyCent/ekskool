import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;

class AbsensiController extends GetxController {
  TextEditingController keterangan = TextEditingController();
  TextEditingController jmlSiswa = TextEditingController();

  var selectedekskul;
  var pickedImageName = ''.obs;
  PlatformFile? pickedImage;

  Rx<DateTime> selectedDate = DateTime.now().obs;
  Rx<TimeOfDay> selectedTime = TimeOfDay.now().obs;

  setSelectedEkskul(String id) {
    selectedekskul = id;
  }

  Future<void> absensi(idEkskul, tgl, jam, jmlSiswa, ket) async {
    var user = FirebaseAuth.instance.currentUser;
    final path = '$idEkskul/$tgl/${pickedImage!.name}';
    final file =
        await _compressImage(File(pickedImage!.path!)); // Compress image
    final ref = FirebaseStorage.instance.ref().child(path);
    await ref.putFile(file); // Use await to wait for the upload to complete
    var url = await ref.getDownloadURL();
    try {
      var newDocRef = FirebaseFirestore.instance.collection('absensi').doc();
      newDocRef.set({
        "idHistory": newDocRef.id,
        "idEkskul": idEkskul,
        "idPelatih": user!.uid,
        "tanggal": tgl,
        "jam": jam,
        "jumlah": jmlSiswa,
        "keterangan": ket,
        "dok": url,
      });

      Get.back();
      // Data has been successfully added to Firestore.
      Get.snackbar(
        'Success',
        'Data telah dimasukkan',
        backgroundColor: Colors.white,
      );
    } catch (e) {
      // Handle any errors that occur during the write operation.
      Get.snackbar(
        'Error',
        'Gagal memasukkan data',
        backgroundColor: Colors.white,
      );
    }
  }

  Future pickImage() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'jpeg'],
    );
    if (result == null) return;
    pickedImageName.value = result.files.single.name;
    pickedImage = result.files.single;
  }

  Future<File> _compressImage(File file) async {
    final image = img.decodeImage(file.readAsBytesSync())!;
    final compressedImage = img.copyResize(image, width: 600);
    return File(file.path)..writeAsBytesSync(img.encodeJpg(compressedImage));
  }
}
