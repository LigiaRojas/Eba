import 'package:eba/views/unity_demo_screen.dart';
import 'package:flutter/material.dart';

import 'package:eba/views/loading_screen.dart';
import 'package:eba/views/login_form.dart';
import 'package:eba/views/camera_request.dart';
import 'package:eba/views/systems_menu.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/login-form',
//    initialRoute: '/camera-request',
    routes: {
      '/unity-demo-screen': (context) => UnityDemoScreen(),
      '/loading-screen': (context) => LoadingScreen(),
      '/login-form': (context) => LoginForm(),
      '/camera-request': (context) => CameraRequest(),
      '/systems-menu': (context) => SystemsMenu(),
    },
  ));
}

