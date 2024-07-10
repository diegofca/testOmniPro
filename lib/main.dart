import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app_photos/modules/home/bloc/provider/home_bloc_provider.dart';
import 'package:test_app_photos/modules/home/presentation/home_page.dart';
import 'package:test_app_photos/utils/locator.dart';
import 'modules/home/bloc/home_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
        ),
      ),
      home: BlocProvider(
        create: (ctx) => HomeBlocProvider.get(ctx)
          ..add(const HomeGetPhotosEvent()),
        child: const HomePage(title: 'Photos App'),
      )
    );
  }
}
