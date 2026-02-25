import 'package:biblioteca_flutter/app/modules/movies/controller/movies_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieForm extends GetView<MoviesController> {
  const MovieForm({super.key});


  @override
  Widget build(BuildContext context) {

    return Scaffold(
    appBar: AppBar(title: Text('MovieForm')),

    body: SafeArea(
      child: Text('MovieFormController'))
    );
  }
}