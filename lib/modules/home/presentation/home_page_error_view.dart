// ignore_for_file: prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';
import 'package:test_app_photos/modules/home/home.dart';

/// The current state view of the home page.
class HomePageErrorView extends StatelessWidget {

  HomePageErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomeBloc>();
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child:  Text('😢 La descarga fallo 😢', style: TextStyle(fontSize: 30)),
          ),
          ElevatedButton(
            onPressed: () => bloc.add(const HomeGetPhotosEvent()),
            child: const Text('Reintentar'),
          ),
        ],
      ),
    );
  }
}