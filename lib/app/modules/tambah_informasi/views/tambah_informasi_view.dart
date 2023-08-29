import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tambah_informasi_controller.dart';

class TambahInformasiView extends GetView<TambahInformasiController> {
  const TambahInformasiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TambahInformasiView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TambahInformasiView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
