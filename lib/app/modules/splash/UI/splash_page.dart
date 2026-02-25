import 'package:biblioteca_flutter/app/modules/splash/UI/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Center(
          child: controller.isLoading.value
              ? buildSplashContent()
              : Container(),
        ),
      ),
    );
  }

  Widget buildSplashContent() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.yellow, Colors.white],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Bem vindo ao summer class!",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 32),
            Image.asset('assets/images/logo.png', width: 300, height: 300),
            const SizedBox(height: 32),
            const Text(
              'Versão 1.0.0',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            )
          ],
        )
      ),
    );
  }
}
