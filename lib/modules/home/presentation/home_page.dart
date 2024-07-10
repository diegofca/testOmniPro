// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:test_app_photos/modules/home/home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          switch (state.status) {
            /// Show the loading indicator when the state is loading.
            case HomeStatus.loading:
              return _loadingIndicator();
            /// Show the home page content when the state is loaded.
            case HomeStatus.loaded:
              return HomePageContent();
            /// Show the error view when the state is failure.
            case HomeStatus.failure:
              return HomePageErrorView();
          }
        },
      ),
    );
  }

  Widget _loadingIndicator() {
    return const Center( child: CircularProgressIndicator() );
  }
}
