import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:eba/views/login_form.dart';
import 'package:eba/views/systems_menu.dart';
import 'package:eba/views/videos_screen.dart';
import 'package:eba/views/loading_screen.dart';
import 'package:eba/views/camera_request.dart';
import 'package:eba/views/unity/unity_screen.dart';
import 'package:eba/views/info/general_screen.dart';
import 'package:eba/views/info/digestive_screen.dart';
import 'package:eba/views/info/skeletal_screen.dart';
import 'package:eba/views/info/reproductive_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      initialRoute: '/loading-screen',
        routes: {
          '/unity-screen': (context) => UnityScreen(),
          '/loading-screen': (context) => LoadingScreen(),
          '/login-form': (context) => LoginForm(),
          '/camera-request': (context) => CameraRequest(),
          '/systems-menu': (context) => SystemsMenu(),
          '/videos-screen': (context) => VideosScreen(),
          '/digestive-screen': (context) => DigestiveScreen(),
          '/skeletal-screen': (context) => SkeletalScreen(),
          '/reproductive-screen': (context) => ReproductiveScreen(),
          '/general-screen': (context) => GeneralScreen(),
        }
    );
  }
}

