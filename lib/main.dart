import 'package:eba/views/unity_demo_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:eba/views/loading_screen.dart';
import 'package:eba/views/login_form.dart';
import 'package:eba/views/camera_request.dart';
import 'package:eba/views/systems_menu.dart';
import 'package:eba/views/videos_screen.dart';

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
          '/unity-demo-screen': (context) => UnityDemoScreen(),
          '/loading-screen': (context) => LoadingScreen(),
          '/login-form': (context) => LoginForm(),
          '/camera-request': (context) => CameraRequest(),
          '/systems-menu': (context) => SystemsMenu(),
          '/videos-screen': (context) => VideosScreen(),
        }
    );
  }
}

