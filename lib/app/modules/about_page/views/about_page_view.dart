import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/about_page_controller.dart';

class AboutPageView extends GetView<AboutPageController> {
  const AboutPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AboutPageView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AboutPageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
