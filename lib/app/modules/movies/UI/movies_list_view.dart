import 'package:biblioteca_flutter/app/modules/movies/controller/movies_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesListView extends GetView<MoviesController> {
  const MoviesListView({super.key});


  @override
  Widget build(BuildContext context) {

    return Scaffold(
    appBar: AppBar(title: Text('Movies List')),

    body: SafeArea(
      child: Text('MoviesController'))
    );
  }
}