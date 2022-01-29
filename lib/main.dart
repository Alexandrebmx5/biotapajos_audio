import 'package:biotapajos_audio/common/CustomAnimation.dart';
import 'package:biotapajos_audio/models/especie/especie_manager.dart';
import 'package:biotapajos_audio/screens/splash/splash_screen.dart';
import 'package:biotapajos_audio/store/user_manager_store.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'common/color.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  configLoading();
  setupLocation();
  runApp(MyApp());
}

final location = GetIt.instance;

void setupLocation() {
  location.registerSingleton(UserManagerStore());
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.cubeGrid
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.white
    ..backgroundColor = PRIMARY
    ..indicatorColor = Colors.white
    ..textColor = Colors.white
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false
    ..customAnimation = CustomAnimation();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProxyProvider0<EspecieManager>(
            lazy: true,
            create: (_) => EspecieManager(),
            update: (_, especieManager) => especieManager..update(),
          ),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'BioCheck Tapajós - audio',
            theme: ThemeData(
              visualDensity: VisualDensity.adaptivePlatformDensity,
              textTheme: GoogleFonts.poppinsTextTheme(
                Theme.of(context).textTheme,
              ),
            ),
            builder: EasyLoading.init(),
            home: InitialScreen()),
      );
  }
}