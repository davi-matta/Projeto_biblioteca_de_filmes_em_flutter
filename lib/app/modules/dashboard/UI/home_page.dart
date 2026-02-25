import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/home_page_controller.dart';

// ignore: use_key_in_widget_constructors
class HomePage extends GetView<HomePageController> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(appBar: AppBar(title: Text('HomePage')), Container());
  }
}
