import 'package:biblioteca_flutter/app/modules/login/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.yellow, Colors.white],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ), // LinearGradient
      ), // BoxDecoration
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Summer Class 2026',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ), // TextStyle
                textAlign: TextAlign.center, //
              ), // Text
              const SizedBox(height: 200), //
              Obx(() {
                return SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton.icon(
                    onPressed: controller.isLoading.value
                        ? null
                        : controller.trySignInWithGoogle, //
                    icon: controller.isLoading.value
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ), // CircularProgressIndicator
                          ) // SizedBox
                        : Image.asset(
                            'assets/images/google.png',
                            height: 20,
                          ), // Image.asset
                    label: Text(
                      controller.isLoading.value
                          ? ''
                          : 'Entrar com Google', //
                      style: TextStyle(
                        color: Colors.blue,
                      ), // TextStyle
                    ), // Text
                  ), // ElevatedButton.icon
                ); // SizedBox
              }), // Obx
            ], // children
          ), // Column
        ), // Padding
      ), // Center
    ); // Container
  }
}