import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_classroom_ui/controllers/dar_mode_controller.dart';
import 'package:google_classroom_ui/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => DarkModeController(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<DarkModeController>(context, listen: true).isDark;
    return Consumer(
      builder: (context, darkModeController, child) {
        return Scaffold(
          backgroundColor: isDark ? Colors.black : Colors.white,
          body: const HomeScreen(),
        );
      },
    );
  }
}
